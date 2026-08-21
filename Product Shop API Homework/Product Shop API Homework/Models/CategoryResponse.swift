//
//  CategoryResponse.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 21.08.26.
//

import Foundation

struct CategoryResponse {
    let name : String
}

extension CategoryResponse {
    static let sample: [CategoryResponse] = [
        CategoryResponse(name: "beauty"),
        CategoryResponse(name: "fragrances"),
        CategoryResponse(name: "furniture"),
        CategoryResponse(name: "groceries"),
        CategoryResponse(name: "home-decoration"),
        CategoryResponse(name: "kitchen-accessories"),
        CategoryResponse(name: "laptops"),
        CategoryResponse(name: "mens-shirts"),
        CategoryResponse(name: "mens-shoes"),
        CategoryResponse(name: "mens-watches"),
        CategoryResponse(name: "mobile-accessories"),
        CategoryResponse(name: "motorcycle"),
        CategoryResponse(name: "skin-care"),
        CategoryResponse(name: "smartphones"),
        CategoryResponse(name: "sports-accessories"),
        CategoryResponse(name: "sunglasses"),
        CategoryResponse(name: "tablets"),
        CategoryResponse(name: "tops"),
        CategoryResponse(name: "vehicle"),
        CategoryResponse(name: "womens-bags"),
        CategoryResponse(name: "womens-dresses"),
        CategoryResponse(name: "womens-jewellery"),
        CategoryResponse(name: "womens-shoes"),
        CategoryResponse(name: "womens-watches")
    ]
}
