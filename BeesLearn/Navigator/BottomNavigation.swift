//
//  BottomNavigation.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 15/10/2024.
//

import SwiftUI

struct BottomNavigation: View {
    var body: some View {
        TabView {
            VStack{}
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(1)
            
            VStack{}
            .tabItem {
                VStack {
                    Image("ipaicondisable")
                        .resizable()
//                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                    Text("IPA")
                }
            }
            .tag(2)
            
            VStack{}
            .tabItem {
                Image(systemName: "clock.fill")
                Text("Clock")
            }
            .tag(3)
            
            VStack{}
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
            }
            .tag(4)
        }
    }
}

#Preview {
    BottomNavigation()
}
