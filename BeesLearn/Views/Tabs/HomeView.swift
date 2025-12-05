//
//  HomeView.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 15/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isCalendarShow = false
    
    var body: some View {
        NavigationView(){
            ZStack {
                VStack() {
//                    Spacer()
                    CustomTopBar(isCalendarShow: $isCalendarShow)
                    
                    Spacer()
                    
                    HStack{
                        Image("beefamily")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 170)
                        VStack {
                            Image("textlogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                            Text("Start learning\nwith Bee")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("Nunito-Bold", size: 17))
    //                            .foregroundStyle(Color("AppPrimaryColor"))
                        }
                    }
                    
                    Spacer()
                    
                    Grid(horizontalSpacing: 7){
                        NavigationLink(
                            destination: LevelListView()
                        ){
                            OptionButtonView(title: "Learn", imageName: "practice")
                        }
                        
                        GridRow{
                            NavigationLink(
                                destination: IPAList()
                            ){
                                OptionButtonView(title: "IPA", imageName: "podcast")
                            }
                            NavigationLink(
                                destination: FlashCardHostView()
                            ){
                                OptionButtonView(title: "Flash card", imageName: "music")
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                .background(Color("BackgroundColor"))
                
                if isCalendarShow {
                    Color.black.opacity(0.3) // Tạo nền mờ
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.1)){
                                isCalendarShow.toggle()
                            }
                        }
                    GeometryReader { geometry in
                        CalendarView()
                            .scaleEffect(0.9)
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.27)
                    }
                }
            }
        }
    }
}

struct OptionButtonView: View {
    var title: String
    var imageName: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(Font.custom("Nunito-Bold", size: 20))
                    .foregroundStyle(Color("AccentColor"))
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .foregroundColor(.yellow)
            }
        }
        .frame(height: 120)
        .padding(7)
        .background(Color("AppPrimaryColor"))
        .shadow(radius: 10, x: 0, y: 10)
    }
}

#Preview {
    HomeView()
}
