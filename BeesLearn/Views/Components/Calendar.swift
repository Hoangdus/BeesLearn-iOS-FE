import SwiftUI

struct CalendarView: View {
    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    @State private var currentDate: Date = Date() // Khởi tạo với ngày hiện tại
    
    private var daysInMonth: [Int] {
        let calendar = Calendar.current
        let monthInterval = calendar.dateInterval(of: .month, for: currentDate)!
        let monthRange = calendar.range(of: .day, in: .month, for: monthInterval.start)!
        return Array(monthRange.lowerBound...monthRange.upperBound) // Lấy các ngày trong tháng (dùng < để không lấy ngày cuối tháng)
    }
    
    private var monthYearString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: currentDate)
    }
    
    private var leadingEmptyDays: Int {
        let calendar = Calendar.current
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
        let weekday = calendar.component(.weekday, from: firstDayOfMonth)
        return (weekday + 5) % 7 // Điều chỉnh về hệ thứ tự bắt đầu từ thứ Hai
    }
    
    private var trailingEmptyDays: Int {
        let calendar = Calendar.current
        let nextMonth = calendar.date(byAdding: .month, value: 1, to: currentDate)!
        let firstDayOfNextMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: nextMonth))!
        let weekday = calendar.component(.weekday, from: firstDayOfNextMonth)
        return (weekday + 5) % 7 // Số ngày trống ở cuối tháng
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("calendar-bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(spacing: 15) {
                Text(monthYearString)
                    .font(Font.custom("Nunito-Bold", size: 18))
//                    .padding(.bottom, 10)
              
                
                // Tiêu đề các ngày trong tuần
                HStack {
                    ForEach(daysOfWeek, id: \.self) { day in
                        Text(day)
                            .font(Font.custom("Nunito-Bold", size: 15))
                            .frame(maxWidth: .infinity)
                           
                    }
                }
//                .padding(.horizontal, 15)
//                .padding(.top, 6)
                
                // Hiển thị các ngày trong tháng
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                    // Ngày trống ở đầu tháng
                    ForEach(0..<leadingEmptyDays, id: \.self) { index in
                        Text("")
                            .frame(width: 20, height: 20)
                            .id("empty-\(index)") // ID duy nhất cho các ngày trống
                    }
                    
                    // Các ngày trong tháng
                    ForEach(Array(daysInMonth.enumerated()), id: \.element) { index, day in
                        Text("\(day)")
                            .frame(width: 20, height: 20)
    //                        .background(Color.blue.opacity(0.1))
    //                        .cornerRadius(5)
                            .id("day-\(day)") // ID duy nhất cho mỗi ngày
                            .font(.custom("Nunito-Bold", size: 15))
                    }
                    
                    // Ngày trống ở cuối tháng
                    ForEach(0..<trailingEmptyDays, id: \.self) { index in
                        Text("")
                            .frame(width: 20, height: 20)
                            .id("trailing-empty-\(index)") // ID duy nhất cho các ngày trống
                    }
                }
//                .padding(.horizontal, 15)
            }
            .padding(.top, 33)
        }
        .foregroundColor(Color("KeyColor"))
        .onAppear {
            let calendar = Calendar.current
            let now = Date()
            let components = calendar.dateComponents([.year, .month], from: now)
            // Cập nhật currentDate về đầu tháng hiện tại
            currentDate = calendar.date(from: components)!
            print("Updated currentDate to first of month:", currentDate) // In ra ngày hiện tại
        }
    }
}

#Preview {
    CalendarView()
}
