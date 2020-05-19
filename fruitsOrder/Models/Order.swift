//
//  Order.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-04-26.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//


import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case lattee
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
   
}



struct Order: Codable ,Hashable{
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
}



extension Order {
    
    
    static var all:Resourse<[Order]> = {
        
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else{
             fatalError("URL incorrect")
         }
        
        return Resourse<[Order]>(url: url)
    }()
    
    
    
    static func create(vm: AddOrderViewModel) -> Resourse<Order?> {
        
        let order = Order(vm)
        
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else{
            fatalError("URL incorrect")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Encoding order Error")
        }
        
        var resourse = Resourse<Order?>(url: url)
        resourse.htttpMethod = HttpMethod.post
        resourse.body = data
        
        return resourse
        
        
        
    }
    
}


extension Order {
    
    
    init?(_ vm:AddOrderViewModel) {
        
        
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: (vm.selectedType?.lowercased())!),
              let selectedSize = CoffeeSize(rawValue: (vm.selectedSize?.lowercased())!)
        else{
         return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
        
        
        
    }
    
    
    
}
