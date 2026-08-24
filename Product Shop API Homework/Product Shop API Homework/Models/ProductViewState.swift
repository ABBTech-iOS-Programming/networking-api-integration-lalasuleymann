//
//  ProductViewState.swift
//  Product Shop API Homework
//
//  Created by Lala Suleymanova on 24.08.26.
//

enum ProductViewState {
    case idle
    case loading
    case loaded
    case empty
    case error(String)
}
