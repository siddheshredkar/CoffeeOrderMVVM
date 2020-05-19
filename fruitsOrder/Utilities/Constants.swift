//
//  Constants.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-04-26.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import Foundation
import UIKit


enum Images {
    static let cappuccino  = "top-view-cup-coffee-with-copy-space_23-2148336691"
    static let lattee  = "59806598.cms"
    static let espressino  = "2017_04_17_25228_1492395137._large"
    static let cortado  = "cup-fresh-made-coffee-served-cup_1220-4580"
   
}

enum ScreenSize {
    static let width                    = UIScreen.main.bounds.size.width
    static let height                   = UIScreen.main.bounds.size.height
    static let maxLength                = max(ScreenSize.width, ScreenSize.height)
    static let minLength                = min(ScreenSize.width, ScreenSize.height)
}
