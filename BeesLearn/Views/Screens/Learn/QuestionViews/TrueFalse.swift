//
//  TrueFalse.swift
//  BeesLearn
//
//  Created by HoangDus on 6/10/25.
//

import SwiftUI

struct TrueFalse: View {
    var question: TrueFalseQuestion
    var onCompleteQuestion: (_ correctness: String)->Void
    var body: some View {
        VStack(){
            QuestionBox(question: "Câu tiếng anh đúng hay sai?", content: question.content, vietnameseMeaning: question.vietnameseMeaning)
            Spacer()
            HStack(spacing: 90){
                answerButtonView(type: false){ i in
                    onCompleteQuestion("0")
                }
                answerButtonView(type: true){ i in
                    onCompleteQuestion("1")
                }
            }
            Spacer()
        }
    }
}

fileprivate struct answerButtonView: View {
    var type: Bool
    var action: (Bool)->Void
    
    var body: some View {
        Button(action: {
            action(type)
        }, label: {
            ZStack{
                Circle()
                    .fill(Color("AppPrimaryColor"))
                    .frame(width: 75, height: 75)
                if type{
                    Image(systemName: "checkmark")
                        .font(.system(size: 33).bold())
                        .foregroundStyle(Color.green)
                }else{
                    Image(systemName: "xmark")
                        .font(.system(size: 33).bold())
                        .foregroundStyle(Color.red)
                }
            }
            .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
        })
    }
}

//#Preview {
//    TrueFalse(){_ in}
//}
