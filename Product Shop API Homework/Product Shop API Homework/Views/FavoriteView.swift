//
//  FavoriteView.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 24.08.26.
//

import SwiftUI

struct FavoriteView: View {
    
    @Bindable var viewModel: ProductViewModel
    
    var favoriteProducts: [Product] {
        viewModel.products.filter { $0.isFavorite }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.mainBackground)
                    .ignoresSafeArea()
                
                if favoriteProducts.isEmpty {
                    ContentUnavailableView(
                        "No Favorites",
                        systemImage: "heart",
                        description: Text("You haven't added any products to favorites yet.")
                    )
                } else {
                    ScrollView {
                        LazyVGrid(
                            columns: [
                                GridItem(spacing: 10),
                                GridItem(spacing: 10)
                            ],
                            spacing: 12
                        ) {
                            ForEach(favoriteProducts) { product in
                                NavigationLink {
                                    ProductDetailView(
                                        product: binding(for: product)
                                    )
                                    .toolbar(.hidden, for: .tabBar)
                                } label: {
                                    ProductView(product: product)
                                }
                            }
                        }
                        .padding(20)
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func binding(for product: Product) -> Binding<Product> {
        Binding(
            get: {
                viewModel.products.first(where: { $0.id == product.id }) ?? product
            },
            set: { newValue in
                if let index = viewModel.products.firstIndex(
                    where: { $0.id == newValue.id }
                ) {
                    viewModel.products[index] = newValue
                }
            }
        )
    }
}

#Preview {
    FavoriteView(viewModel: ProductViewModel())
}
