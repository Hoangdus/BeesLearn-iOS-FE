import SwiftUI

struct CalendarView: View {
    @State private var currentDate = Date()
    private let calendar = Calendar.current

    var body: some View {
        Text("Hello World")
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .preferredColorScheme(.light) // Thay đổi sang dark mode nếu muốn
    }
}
