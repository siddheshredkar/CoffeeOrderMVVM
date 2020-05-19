//
//  OrderViewModel.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-04-26.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import Foundation


class OrderListViewModel {
    
    var orders:[OrderViewModel]
    
    
    init() {
        self.orders = [OrderViewModel]()
    }
}


extension OrderListViewModel {
    
    func orderViewModel(at index: Int) -> OrderViewModel{
        return self.orders[index]
    }
    
}



struct OrderViewModel {
    let order:Order
}


extension OrderViewModel {
    
    var name:String{
        return self.order.name
    }
    
    var email:String{
        return self.order.email
    }
    
    var type:String{
        return self.order.type.rawValue.capitalized
    }
    
    var size:String{
        return self.order.size.rawValue.capitalized
    }
    
    
}
