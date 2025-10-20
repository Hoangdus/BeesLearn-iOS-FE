//
//  QuestionHostView.swift
//  BeesLearn
//
//  Created by HoangDus on 2/10/25.
//

import SwiftUI

struct QuestionHostView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var hostViewModel = QuestionHostViewModel()
    
    var body: some View {
        VStack(){
            ProgressNavigationBar(progress: hostViewModel.progress){
                dismiss()
            }
            if(hostViewModel.questionType == .ArrangeWords){
                ArrangeWords(){
                    hostViewModel.CompleteQuestion()
                }
            }else if(hostViewModel.questionType == .MultipleChoices){
                MultipleChoices(){
                    hostViewModel.CompleteQuestion()
                }
            }else if(hostViewModel.questionType == .TrueFalse){
                TrueFalse(){ _ in
                    hostViewModel.CompleteQuestion()
                }
            }else{
                
            }
//            Spacer()
//            FillInTheBlank()
//            CompleteSentence()
//            TrueFalse()
//            MultipleChoices()
//            Spacer()
        }
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
        .onChange(of: hostViewModel.dismissQuestionHostView) { old, new  in
            if new {
                dismiss()
            }
        }
    }
}

#Preview {
    QuestionHostView()
}
