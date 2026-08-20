//
//  ProductView.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 20.08.26.
//

import SwiftUI

struct ProductView: View {
    
    @Bindable var viewModel : ProductViewModel
    
    var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10){
                Text("Good morning")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color(.secondary))
                Text("""
                     Find your next favorite
                     product
                     """)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.white)
                Text("Fresh picks for you")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color(.lightOrange))
            }
            Spacer()
            
            Text("20% OFF")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(.main)
                .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .padding()
        .background(.headerBackground)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
    
    var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)

            TextField("Search Products", text: $viewModel.searchPhrase)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    var body: some View {
        ZStack {
            Color(.mainBackground)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    header
                    searchBar
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    ProductView(viewModel: ProductViewModel())
}
