//
//  FavoriteView.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 24.08.26.
//

import SwiftUI

struct FavoriteView: View {
    @Bindable var viewModel : ProductViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.mainBackground)
                    .ignoresSafeArea()
                ScrollView {
                    LazyVGrid(
                        columns: [
                            GridItem(spacing: 10),
                            GridItem(spacing: 10)
                        ],
                        spacing: 12
                    ) {
                        ForEach($viewModel.products) { $product in
                            if product.isFavorite {
                                NavigationLink {
                                    ProductDetailView(product: $product)
                                        .toolbar(.hidden, for: .tabBar)
                                } label: {
                                    ProductView(product: product)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FavoriteView(viewModel: ProductViewModel())
}
