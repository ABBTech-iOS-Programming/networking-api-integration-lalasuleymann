//
//  ProductView.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 21.08.26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductView: View {
    
    @State var product : Product
    
    var image : some View {
        ZStack(alignment: .topLeading) {
            if product.images.isEmpty {
                Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
            } else {
                WebImage(url: URL(string: product.images[0]))
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            

            Text("★ \(product.rating.formatted())")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.yellow)
                .padding(.leading, 12)
                .padding(.top, 12)
        }
    }
    
    var info : some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(product.title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.black)
                .lineLimit(1)
            
            Text(product.brand ?? "Unkown")
                .font(.system(size: 10, weight: .regular))
                .foregroundStyle(.gray)
        }
        
    }
    
    var discountedPrice: Double {
        product.price - (product.price * product.discountPercentage / 100)
    }
    
    var priceAndBuy: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {

                if product.discountPercentage > 0 {
                    Text("$\(discountedPrice, specifier: "%.2f")")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.red)

                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.system(size: 11))
                        .foregroundStyle(.gray)
                        .strikethrough()
                } else {
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.red)
                }
            }

            Spacer()

            Button {
                
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .frame(width: 30, height: 30)
                    .background(.main)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 12) {
                image
                info
                priceAndBuy
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

#Preview {
    @Previewable @State var viewModel = ProductViewModel()

    Group {
        if let product = viewModel.products.first {
            ProductView(product: product)
        } else {
            ProgressView("Loading...")
        }
    }
    .task {
        await viewModel.fetchDataAccordingToCategory(category: "beauty")
    }
}
