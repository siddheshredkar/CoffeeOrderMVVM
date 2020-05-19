//
//  ImageArray.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-05-03.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import Foundation



struct imageArray{
   
    var imageArray:[String] = []

   
    init(images:[String]){
   
        self.imageArray = images
     
    }

}

var Image1 = Images.cappuccino
var Image2 = Images.lattee
var Image3 = Images.espressino
var Image4 = Images.cortado

var imageArray1 = [Image1,Image2,Image3,Image4]


