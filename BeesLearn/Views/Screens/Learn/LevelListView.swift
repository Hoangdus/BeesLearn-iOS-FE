//
//  LevelListView.swift
//  BeesLearn
//
//  Created by HoangDus on 30/9/25.
//

import SwiftUI

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

struct LevelListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var toolbarVisibility = Visibility.visible
    
    var body: some View {
        VStack{
            CustomNavigationBar(){
                dismiss()
            }
            ScrollView{
                LazyVStack(spacing: -35){
                    ForEach(0...100, id: \.self){ i in
                        if ( i % 2 == 0){
                            HStack{
                                LevelListItem(label: "\(i)")
                                Spacer()
                            }
                        }else{
                            HStack{
                                Spacer()
                                LevelListItem(label: "\(i)")
                            }
                        }
                    }
                }
            }
            .onAppear{toolbarVisibility = .visible}
            .toolbar(toolbarVisibility, for: .tabBar)
            .toolbar(.hidden, for: .navigationBar)
        }
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    LevelListView()
}
