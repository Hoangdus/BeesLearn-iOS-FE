//
//  ContentView.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 05/10/2024.
//

import SwiftUI
import UIKit

extension UIViewController {
    func recursiveChildren() -> [UIViewController] {
        return children + children.flatMap({ $0.recursiveChildren() })
    }
}

struct ContentView: View {
    
    @State private var selection = 0
        private var selectionBinding: Binding<Int> {
            Binding(get: {
                selection
            }, set: {
                if $0 == selection {
                    let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
                    let navigationController = window?.rootViewController?.recursiveChildren().first(where: { $0 is UINavigationController && $0.view.window != nil }) as? UINavigationController
                    navigationController?.popToRootViewController(animated: true)
                }
                selection = $0
            })
        }
    
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
        TabView(selection: selectionBinding){
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                }
                .tag(0)
//            IPAView()
//                .tabItem{
//                    Image(systemName: "character.phonetic")
//                }
//                .tag(1)
            StatsView()
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                }
                .tag(2)
            SettingView()
                .tabItem{
                    Image(systemName: "gearshape.fill")
                }
                .tag(3)
        }
        .tint(Color("ButtonColor"))
    }
}

#Preview {
    ContentView()
}
