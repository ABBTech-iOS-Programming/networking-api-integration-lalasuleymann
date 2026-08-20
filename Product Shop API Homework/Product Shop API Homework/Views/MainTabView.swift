//
//  MainTabView.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 20.08.26.
//

import SwiftUI

struct MainTabView: View {
    @State private var viewModel = ProductViewModel()
    
    var body: some View {
        TabView{
            Tab("", systemImage: "house") {
                NavigationStack {
                    ProductView(viewModel: viewModel)
                }
            }
            
            Tab("", systemImage: "heart") {
            }
            
            Tab("", systemImage: "square") {
            }
            
            Tab("", systemImage: "circle") {
            }
        }
    }
}

#Preview {
    MainTabView()
}
