//
//  ProductDetailView.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 21.08.26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @State var product : Product
    @State var quantityValue = 1
    @State private var currentImageIndex = 0
    
    
    var indicator: some View {
        HStack(spacing: 8) {
            ForEach(product.images.indices, id: \.self) { index in
                Capsule()
                    .fill(
                        currentImageIndex == index
                        ? .orange
                        : .gray.opacity(0.4)
                    )
                    .frame(
                        width: currentImageIndex == index ? 26 : 8,
                        height: 7
                    )
            }
        }
    }
    
    var image: some View {
        VStack(spacing: 12) {
            TabView(selection: $currentImageIndex) {
                ForEach(product.images.indices, id: \.self) { index in
                    WebImage(url: URL(string: product.images[index]))
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: UIScreen.main.bounds.width - 40,
                            height: 280
                        )
                        .background(Color(.secondarySystemBackground))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 24)
                        )
                        .tag(index)
                }
            }
            .frame(height: 280)
            .tabViewStyle(.page(indexDisplayMode: .never))

            indicator
        }
    }
    
    
    var title : some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .font(.system(size: 20, weight: .bold))
            HStack {
                Text(product.category.capitalized)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.secondary)
                
                Text("·")
                    .foregroundStyle(.secondary)
                
                Text(product.brand)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    var ratingAndStock : some View {
        HStack {
            HStack{
                Text("★ \(product.rating.formatted())")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.yellow)
                
                Text("(3 reviews)")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            Text("In stock: \(product.stock)")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(.stock)
                .padding()
                .background(Color.stock.opacity(0.3))
            
                .frame(height: 28)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
        }
    }
    
    var description : some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .font(.system(size: 15, weight: .semibold))
            
            Text(product.description)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.secondary)
        }
    }
    
    var info : some View {
        VStack(alignment: .leading, spacing: 16){
            title
            ratingAndStock
            Divider()
            description
        }
    }
    
    
    
    var quantity : some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Quantity")
                .font(.system(size: 14, weight: .semibold))
            
            HStack(spacing: 16) {
                Button {
                    if quantityValue > 0{
                        quantityValue -= 1
                    }
                } label: {
                    Image(systemName: "minus")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(.black)
                        .padding()
                        .frame(width: 42, height: 42)
                        .background(Color(.secondary))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                Text("\(quantityValue)")
                
                Button {
                    quantityValue += 1
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(.black)
                        .padding()
                        .frame(width: 42, height: 42)
                        .background(Color(.secondary))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
            }
        }
    }
    
    
    var footer : some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Price")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(.secondary)
                
                Text("$\(product.price.formatted())")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.main)
            }
            
            Spacer()
            
            Button{
                print("add to cart")
            } label: {
                Text("Add to cart")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 44)
                    .padding(.vertical, 20)
                    .background(.main)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    image
                    info
                    quantity
                    footer
                }
                .padding(20)
            }
        }
        .navigationTitle("Product Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    print("love itttt")
                } label: {
                    Image(systemName: "heart")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var product = Product.sample[0]
    ProductDetailView(product: product)
}
