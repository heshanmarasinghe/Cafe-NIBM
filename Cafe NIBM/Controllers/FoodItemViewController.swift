//
//  FoodItemViewController.swift
//  Cafe NIBM
//
//  Created by Heshan on 4/12/21.
//  Copyright © 2021 Heshan. All rights reserved.
//

import UIKit
import Kingfisher
import Loaf

class FoodItemViewController: UIViewController {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodDescription: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    
    var foodItem: FoodItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = self.foodItem{
            imgImage.kf.setImage(with: URL(string: item.image))
            lblFoodName.text = item.foodName
            lblFoodDescription.text = item.foodDescription
            lblFoodPrice.text = "LKR: \(item.foodPrice)"
        }
    }
    

    @IBAction func btnBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAddToCart(_ sender: UIButton) {
        if let item = self.foodItem {
            CartHandler.foodItems.append(item)
            Loaf("Item Added to the Cart!!", state: .success, sender: self).show() {
                type in
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
