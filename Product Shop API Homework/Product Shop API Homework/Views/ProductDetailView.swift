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
    
    var image : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(product.images, id: \.self){ image in
                    WebImage(url: URL(string: image))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 370, height: 280)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
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
        VStack(alignment: .leading, spacing: 12){
            title
            ratingAndStock
            Divider()
            description
        }
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    image
                    info
                }
                .padding()
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
