//
//  CustomTopBar.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 30/10/2024.
//

import SwiftUI

struct CustomTopBar: View {
    @Binding var isCalendarShow: Bool
    @State var isTranlateShow = false
    
    var body: some View {
        ZStack {
//            if isCalendarShow == true {
//                Color.black.opacity(0.4) // Tạo nền mờ
//                    .ignoresSafeArea()
//                    .onTapGesture {
//                        withAnimation(.easeInOut(duration: 0.2)) {
//                            isCalendarShow = false
//                        }
//                    }
//                
//                CalendarView()
//                //                .frame(width: 300, height: 400)
//                    .background(Color.red)
//            }
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 9)
                        .fill(Color.white)
                        .frame(width: 48, height: 37)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9)
                                .stroke(Color("KeyColor"), lineWidth: 2)
                        )
                    
                    Image("eng-flag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 34)
                }
                
                Spacer()
                
                Image(isCalendarShow ? "calendar" : "calendar-disable")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 34)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            isCalendarShow.toggle()
                        }
                    }
                
                Spacer()
                
                Image(isTranlateShow ? "translate" : "translate-disable")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 34)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isTranlateShow.toggle()
                        }
                    }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(Color("KeyColor"), lineWidth: 2)
                        .frame(width: 45, height: 45)
                    
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 34)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

//#Preview {
//    CustomTopBar()
//}
