//
//  ProductResponse.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 20.08.26.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}
