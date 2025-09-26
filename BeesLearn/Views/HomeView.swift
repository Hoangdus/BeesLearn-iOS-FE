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
        ZStack {
            VStack {
                CustomTopBar(isCalendarShow: $isCalendarShow)
                
                Spacer()
                
                ZStack {
                    HStack {
                        Image("beefamily")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        
                        Spacer()
                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            Image("textlogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                                .padding(.trailing, 10)
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("Start to learning \n with Bee")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("Nunito-Bold", size: 20))
                                .foregroundStyle(Color("KeyColor"))
                        }
                    }
                }
                
                // bottom
                
                Spacer()
                
                // Practice
                HStack {
                    VStack {
                        HStack {
                            Text("Practice")
                                .font(Font.custom("Nunito-Bold", size: 20))
                                .foregroundStyle(Color("KeyColor"))
                                .padding([.top, .leading], 10)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Image("practice")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .foregroundColor(.yellow)
                                .padding(.trailing, 25)
                                .padding(.bottom, 10)
                            
                        }
                    }
                    .frame(height: 130)
                    .background((Color(hex: "#FFF192")))
                    .padding(.trailing, 2)
                    .shadow(radius: 10, x: 0, y: 10)
                    
                    // Podcast
                    VStack {
                        HStack {
                            Text("Podcast")
                                .font(Font.custom("Nunito-Bold", size: 20))
                                .foregroundStyle(Color("KeyColor"))
                                .padding([.top, .leading], 10)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Image("podcast")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .foregroundColor(.yellow)
                                .padding(.trailing, 25)
                                .padding(.bottom, 10)
                            
                        }
                    }
                    .frame(height: 130)
                    .background((Color(hex: "#FFF192")))
                    .padding(.leading, 2)
                    .shadow(radius: 10, x: 0, y: 10)
                }
                
                HStack {
                    // Movie
                    VStack {
                        HStack {
                            Text("Movie")
                                .font(Font.custom("Nunito-Bold", size: 20))
                                .foregroundStyle(Color("KeyColor"))
                                .padding([.top, .leading], 10)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Image("movie")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .foregroundColor(.yellow)
                                .padding(.trailing, 25)
                                .padding(.bottom, 10)
                            
                        }
                    }
                    .frame(height: 130)
                    .background((Color(hex: "#FFF192")))
                    .padding(.trailing, 2)
                    .shadow(radius: 10, x: 0, y: 10)
                    
                    // Music
                    VStack {
                        HStack {
                            Text("Music")
                                .font(Font.custom("Nunito-Bold", size: 20))
                                .foregroundStyle(Color("KeyColor"))
                                .padding([.top, .leading], 10)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Image("music")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .foregroundColor(.yellow)
                                .padding(.trailing, 25)
                                .padding(.bottom, 10)
                            
                        }
                    }
                    .frame(height: 130)
                    .background((Color(hex: "#FFF192")))
                    .padding(.leading, 2)
                    .shadow(radius: 10, x: 0, y: 10)
                }
            }
            .padding(.horizontal, 10)
            
            if isCalendarShow {
                Color.black.opacity(0) // Tạo nền mờ
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isCalendarShow = false
                        }
                    }
                
                GeometryReader { geometry in
                    CalendarView()
//                        .background(Color.red)
//                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.9)
                        .padding(.horizontal, 15)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 3.5)
                    
                }
                
            }
        }
        
    }
}

#Preview {
    HomeView()
}
