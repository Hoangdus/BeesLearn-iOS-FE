//
//  CompleteSentence.swift
//  BeesLearn
//
//  Created by HoangDus on 17/10/25.
//

import SwiftUI

struct CompleteSentence: View {
    @StateObject var viewModel = QuestionViewModel()
    @State var wordsInSentence: [Substring] = []

    var body: some View {
        GeometryReader{ geo in
            let parentWidth = geo.size.width * 0.9
            let parentHeight = geo.size.height * 0.5
            
            VStack{
                QuestionBoxView(
                    question: viewModel.questionForType0,
                    content: viewModel.content,
                    answer: viewModel.wordsInAnswer,
                    width: parentWidth,
                    height: parentHeight
                ){ value in
                    viewModel.removeWordInAnswer(index: value)
                }
                WrappingChipLayout(
                    items: viewModel.wordsInSentence,
                    hiddenItems: viewModel.hiddenSentenceWords,
                    spacing: 6
                ){ word, index in
                    viewModel.putContentWordInAnswer(word: word, index: index)
                }
                    .padding()
                    .frame(width: parentWidth)
                Spacer()
                CheckAnswerButton(width: parentWidth){
                    print("Check")
                }
            }
            .padding(.bottom, 20)
            .frame(width: geo.size.width, height: geo.size.height)
//            .onAppear(){
//                viewModel.initCompleteSentence()
//            }
        }
    }
}

fileprivate struct WrappingChipLayout: View {
    var items: [Substring]
    var hiddenItems: [Int] = []
    var spacing: CGFloat
    var action: (_: Substring, _: Int) -> Void
    
    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        VStack{
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                AnswerChipView(answer: item.description, action: {
                    action(item, index)
                })
                    .padding(.trailing, spacing)
                    .padding(.bottom, spacing)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        if (abs(width - dimension.width) > geometry.size.width) {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if index == items.count - 1 {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { dimension in
                        let result = height
                        if index == items.count - 1 {
                            height = 0
                        }
                        return result
                    })
                    .opacity(hiddenItems.contains(index) ? 0 : 1)
                    
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

fileprivate struct QuestionBoxView: View {
    var question: String
    var content: String
    var answer: [Substring]
    var width: CGFloat
    var height: CGFloat
    var action: (_: Int) -> Void
    
    var body: some View {
        VStack(spacing: 10){
            Text(question)
                .font(Font.custom("Nunito-Bold", size: 21))
                .foregroundStyle(Color("AccentColor"))
            Text(content)
                .multilineTextAlignment(.center)
                .font(Font.custom("Nunito-Bold", size: 17))
                .foregroundStyle(Color("AccentColor"))
            WrappingChipLayout(items: answer, spacing: 5){ _, index in
                action(index)
            }
            Spacer()
        }
        .padding(14)
        .frame(width: width, height: height)
        .background(){
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("AppPrimaryColor"))
                .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
        }
    }
}
