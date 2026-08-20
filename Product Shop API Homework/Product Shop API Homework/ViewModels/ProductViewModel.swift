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
    var searchPhrase : String = ""
}
