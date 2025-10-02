//
//  LevelListItem.swift
//  BeesLearn
//
//  Created by HoangDus on 2/10/25.
//

import SwiftUI

struct LevelListItem: View {
    var body: some View {
        NavigationLink(destination: QuestionView().toolbar(.hidden, for: .tabBar), label: {
            HexagonShape()
                .fill(Color("AppPrimaryColor"))
                .stroke(Color("AccentColor"), lineWidth: 10)
                .frame(width: 200, height: 200)
                .padding()
        })
    }
}

struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = min(width, height) / 2
        
        // Calculate hexagon vertices (6 points)
        for i in 0..<6 {
            let angle = (CGFloat(i) * 60 - 90) * .pi / 180
            let x = center.x + radius * cos(angle)
            let y = center.y + radius * sin(angle)
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        path.closeSubpath()
        return path
    }
}


#Preview {
    LevelListItem()
}
