//
//  CalendarDayComponent.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 31/10/2024.
//

import SwiftUI

struct CalendarDayComponent: View {
    let day: Int
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Text(String(day))
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(isSelected ? .white : .black)
            
            if isSelected {
                Circle()
                    .fill(.blue)
                    .frame(width: 5, height: 5)
            }
        }
        .frame(width: 40, height: 40)
        .background(.gray.opacity(0.1))
        .cornerRadius(5)
    }
}

#Preview {
    CalendarDayComponent(day: 10, isSelected: true)
}
