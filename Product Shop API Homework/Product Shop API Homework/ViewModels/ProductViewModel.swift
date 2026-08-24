//
//  ProductViewModel.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 20.08.26.
//

import SwiftUI
import Observation

@Observable
final class ProductViewModel {

    var products: [Product] = []
    var categories: [String] = []
    var state: ProductViewState = .idle
    var searchPhrase: String = ""

    private let urlStringCategoryList = "https://dummyjson.com/products/category-list"

    private let urlStringProducts = "https://dummyjson.com/products/category/"

    

    func fetchCategoryData() async {
        guard let url = URL(string: urlStringCategoryList) else {
            state = .error("Invalid url")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                state = .error("Invalid response")
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                state = .error("Server error")
                return
            }

            let decoder = JSONDecoder()

            let categoriesResponse = try decoder.decode(
                [String].self,
                from: data
            )

            categories = categoriesResponse

        } catch {
            state = .error("error")
        }
    }


    func fetchAllProducts() async {
        state = .loading
        var allProducts: [Product] = []

        for category in categories {
            guard let url = URL(string: urlStringProducts + category) else {
                continue
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(
                    ProductResponse.self,
                    from: data
                )
                allProducts.append(contentsOf: response.products)
            } catch {
                state = .error("Error fetching \(category): \(error)")
                return
            }
        }

        products = allProducts

        if products.isEmpty {
            state = .empty
        } else {
            state = .loaded
        }
    }
    

    func fetchDataAccordingToCategory(category: String) async {
        state = .loading
        guard let url = URL(string: urlStringProducts + category) else {
            state = .error("Invalid url")
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                state = .error("Invalid response")
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                state = .error("Server error")
                return
            }
            let productsResponse = try JSONDecoder().decode(
                ProductResponse.self,
                from: data
            )

            products = productsResponse.products

            if products.isEmpty {
                state = .empty
            } else {
                state = .loaded
            }

        } catch {
            state = .error("Error fetching \(category): \(error)")
        }
    }
}
