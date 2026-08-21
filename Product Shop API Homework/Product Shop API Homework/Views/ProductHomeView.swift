//
//  ProductHomeView.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 20.08.26.
//

import SwiftUI

struct ProductHomeView: View {
    
    @Bindable var viewModel : ProductViewModel
    var categories : [String] {
        ["All"] + viewModel.categories.map( {$0.name} )
    }
    @State private var selectedCategory = "All"
    
    var filteredProducts : [Product] {
        if(selectedCategory == "All"){
            return viewModel.products
        }
        return viewModel.products.filter {
            $0.category == selectedCategory
        }
    }
    
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
    
    var categoryCarousel : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(categories, id: \.self) { category in
                    Button{
                        selectedCategory = category
                    } label: {
                        Text(category.capitalized)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                selectedCategory == category ? Color(.main): Color(.secondary)
                            )
                            .foregroundStyle(
                                selectedCategory == category ? .white : .black
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                }
            }
        }
    }
    
    var productGrid : some View {
        LazyVGrid(
            columns: [
                GridItem(spacing: 10),
                GridItem(spacing: 10)
            ],
            spacing: 12
        ) {
            ForEach(filteredProducts) { product in
                ProductView(product: product)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color(.mainBackground)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    header
                    searchBar
                    categoryCarousel
                    productGrid
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    ProductHomeView(viewModel: ProductViewModel())
}
