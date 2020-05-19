//
//  UITableView+Ext.swift
//  goodNewsMVVM
//
//  Created by Siddhesh Redkar on 2020-04-20.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
