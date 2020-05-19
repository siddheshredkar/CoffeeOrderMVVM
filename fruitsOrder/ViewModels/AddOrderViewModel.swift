//
//  AddOrderViewModel.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-04-28.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//


import Foundation

struct AddOrderViewModel {
    
    var name: String?
    var email: String?
    
    var selectedSize: String?
    var selectedType: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
    
}
