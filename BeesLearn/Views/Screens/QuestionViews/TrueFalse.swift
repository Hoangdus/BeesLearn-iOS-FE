//
//  TrueFalse.swift
//  BeesLearn
//
//  Created by HoangDus on 6/10/25.
//

import SwiftUI

struct TrueFalse: View {
    var onCompleteQuestion: (_: Bool)->Void
    var body: some View {
        VStack(){
            QuestionBox(question: "True or false", content: "is this a test?")
            Spacer()
            HStack(spacing: 90){
                answerButtonView(type: false){ i in
                    print(i)
                    onCompleteQuestion(i)
                }
                answerButtonView(type: true){ i in
                    print(i)
                    onCompleteQuestion(i)
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

#Preview {
    TrueFalse(){_ in}
}
