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
            
            Text(product.brand)
                .font(.system(size: 10, weight: .regular))
                .foregroundStyle(.gray)
        }
        
    }
    
    var priceAndBuy : some View {
        
        HStack {
            Text("$\(product.price.formatted())")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.black)
            
            Spacer()
            
            Button{
                
            } label: {
                Image(systemName: "plus")
                    .padding(12)
                    .foregroundStyle(.white)
                    .background(.main)
                    .frame(width: 30, height: 30)
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
    @Previewable @State var product = Product.sample[0]
    ProductView(product: product)
}
