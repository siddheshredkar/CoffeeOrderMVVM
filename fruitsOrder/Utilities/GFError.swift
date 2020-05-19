//
//  GFError.swift
//  iOS_GHFollowers
//
//  Created by Alex 6.1 on 2/16/20.
//  Copyright © 2020 aglegaspi. All rights reserved.
//

import Foundation

// conforms to the Error protoype
enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from server. Please try again."
    case invalidData        = "The data recieved from the server was invalid. Please try again"
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You've already favorited this user."
}
