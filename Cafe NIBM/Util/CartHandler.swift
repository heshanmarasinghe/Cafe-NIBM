//
//  CartHandler.swift
//  Cafe NIBM
//
//  Created by Heshan on 4/12/21.
//  Copyright © 2021 Heshan. All rights reserved.
//

import Foundation

class CartHandler{
    
    static var foodItems : [FoodItem] = []
    
    static func getCartItems() -> [FoodItem] {
        return foodItems
    }
    
    static func clearCart() {
        self.foodItems.removeAll()
    }
}
