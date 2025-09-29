//
//  ContentView.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 05/10/2024.
//

import SwiftUI

struct ContentView: View {
    let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
    init() {
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(named: "BackgroundColor")
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
//        WelcomeView()
//        CalendarView()
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                }
            IPAView()
                .tabItem{
                    Image(systemName: "character.phonetic")
                }
            StatsView()
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                }
            SettingView()
                .tabItem{
                    Image(systemName: "gearshape.fill")
                }
        }
        .tint(.key)
    }
}

#Preview {
    ContentView()
}
