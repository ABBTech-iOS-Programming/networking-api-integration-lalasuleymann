//
//  ProductViewModel.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 20.08.26.
//

import SwiftUI
import Observation

@Observable final class ProductViewModel {
    var products : [Product] = Product.sample
    var categories : [String] = []
    var searchPhrase : String = ""
    
    private let urlStringCategoryList = "https://dummyjson.com/products/category-list"
    private let urlStringProducts = "https://dummyjson.com/products/category/{categoryName}"
    
    func fetchCategoryData() async {
        guard let url = URL(string: urlStringCategoryList) else {
            print("Invalid url")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard(200...299).contains(httpResponse.statusCode) else {
                print("Error, \(httpResponse.statusCode)")
                return
            }
            
            let decoder = JSONDecoder()
            
            let categoriesResponse = try decoder.decode([String].self, from: data)
            
            categories = categoriesResponse
            
            if let json = String(data: data, encoding: .utf8) {
                print(json)
            }
        }
        catch {
            print("Error happened")
        }
    }
}
