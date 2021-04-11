//
//  Entity.swift
//  Cafe NIBM
//
//  Created by Heshan on 4/10/21.
//  Copyright © 2021 Heshan. All rights reserved.
//

import Foundation

struct User {
    var userName: String
    var userEmail: String
    var userPassword: String
    var userPhone: String
}

struct FoodItem {
    var _id: String
    var foodName: String
    var foodDescription: String
    var foodPrice: Double
    var discount: Int
    var image: String
    var category: String
}

