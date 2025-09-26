import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab: Int = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            // Nội dung của tab được chọn
            Group {
                switch selectedTab {
                case 1:
                    HomeView()
                case 2:
                    IPAView()
                case 3:
                    StatsView()
                case 4:
                    SettingView()
                default:
                    HomeView()
                }
            }
            .padding(.bottom, 50) // Để không bị che bởi tab bar
            
            Spacer()
            
            // Tab bar tùy chỉnh
            HStack {
                Spacer()
                
                // Tab 1: Home
                Button(action: {
                    selectedTab = 1
                }) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 27)
                        .foregroundColor(selectedTab == 1 ? Color(hex: "#692943") : Color(hex: "#e5e5e5"))
                }
                
                Spacer()
                
                // Tab 2: IPA
                Button(action: {
                    selectedTab = 2
                }) {
                    Image(systemName: "character.phonetic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .foregroundColor(selectedTab == 2 ? Color(hex: "#692943") : Color(hex: "#e5e5e5"))
                }
                
                Spacer()
                
                // Tab 3: Stats
                Button(action: {
                    selectedTab = 3
                }) {
                    Image(systemName: "chart.bar.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .foregroundColor(selectedTab == 3 ? Color(hex: "#692943") : Color(hex: "#e5e5e5"))
                }
                
                Spacer()
                
                // Tab 4: Settings
                Button(action: {
                    selectedTab = 4
                }) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .foregroundColor(selectedTab == 4 ? Color(hex: "#692943") : Color(hex: "#e5e5e5"))
                }
                
                Spacer()
            }
            .padding(.top, 20)
            //            .background(Color.white)
            .shadow(radius: 0.2) // Thêm shadow cho tab bar
        }
    }
}


#Preview {
    CustomTabView()
}
