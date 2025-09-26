//
//  CalendarViewComponent.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 31/10/2024.
//

import SwiftUI

struct CalendarViewComponent: View {
  @State private var selectedDate = Date()

  var body: some View {
    VStack {
      headerView
      gridView
        .padding()
    }
  }

  private var headerView: some View {
    HStack {
      Text(selectedDate, format: .dateTime.month(.wide))
      Spacer()
      Text(selectedDate, format: .dateTime.year())
    }
    .padding(.horizontal)
  }

  private var gridView: some View {
    LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 5) {
      ForEach(Array(1...31), id: \.self) { day in
        CalendarDayComponent(day: day, isSelected: selectedDate.day == day)
          .onTapGesture {
            let newDate = Calendar.current.date(byAdding: .day, value: day - selectedDate.day, to: selectedDate)!
            selectedDate = newDate
          }
      }
    }
  }
}

#Preview {
    CalendarViewComponent()
}
