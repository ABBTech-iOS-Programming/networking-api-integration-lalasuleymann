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
    let brand: String?
    let thumbnail: String
    let images: [String]

    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case category
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case thumbnail
        case images
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        category = try container.decode(String.self, forKey: .category)
        price = try container.decode(Double.self, forKey: .price)
        discountPercentage = try container.decode(Double.self, forKey: .discountPercentage)
        rating = try container.decode(Double.self, forKey: .rating)
        stock = try container.decode(Int.self, forKey: .stock)
        brand = try container.decodeIfPresent(String.self, forKey: .brand)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        images = try container.decode([String].self, forKey: .images)

        isFavorite = false
    }
}
