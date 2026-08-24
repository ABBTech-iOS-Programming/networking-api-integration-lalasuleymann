//
//  Product.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 20.08.26.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let thumbnail: String
    let images: [String]
}

extension Product {
    static let sample : [Product] = [
        Product(
            id: 1,
            title: "Essence Mascara Lash Princess",
            description: "The Essence Mascara Lash Princess is a popular mascara that provides volume and length.",
            category: "beauty",
            price: 19.99,
            discountPercentage: 10.48,
            rating: 2.56,
            stock: 99,
            brand: "Essence",
            thumbnail: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
            images: [
                "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp",
                "https://cdn.dummyjson.com/product-images/beauty/red-lipstick/1.webp",
                "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
            ]
        ),
        Product(
            id: 2,
            title: "Essence Mascara Lash Princess",
            description: "The Essence Mascara Lash Princess is a popular mascara that provides volume and length.",
            category: "furniture",
            price: 119.99,
            discountPercentage: 10.48,
            rating: 2.56,
            stock: 99,
            brand: "Essence",
            thumbnail: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
            images:[
                "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
            ]
        ),
        Product(
            id: 3,
            title: "Essence Mascara Lash Princess",
            description: "The Essence Mascara Lash Princess is a popular mascara that provides volume and length.",
            category: "fragrances",
            price: 0.99,
            discountPercentage: 10.48,
            rating: 2.56,
            stock: 99,
            brand: "Essence",
            thumbnail: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
            images:[
                "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
            ]
        ),
        Product(
            id: 4,
            title: "Essence Mascara Lash Princess",
            description: "The Essence Mascara Lash Princess is a popular mascara that provides volume and length.",
            category: "groceries",
            price: 9.99,
            discountPercentage: 10.48,
            rating: 2.56,
            stock: 99,
            brand: "Essence",
            thumbnail: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
            images:[
                "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
            ]
        )
    ]
}
