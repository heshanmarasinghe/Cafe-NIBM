//
//  FootViewController.swift
//  Cafe NIBM
//
//  Created by Heshan on 4/10/21.
//  Copyright © 2021 Heshan. All rights reserved.
//

import UIKit
import Firebase

class FoodViewController: UIViewController {

    @IBOutlet weak var tblfood: UITableView!
    
    var ref: DatabaseReference!
    
    var foodItems : [FoodItem] = []
    
    var selectFoodItem: FoodItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Registering Food cell with the TableView
        tblfood.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCellReuseIdentifier")
        ref = Database.database().reference()
        getFoodItemData();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToViewFoodItem"{
            let destinationVC = segue.destination as! FoodItemViewController
            destinationVC.foodItem = selectFoodItem
        }
    }

}

    extension FoodViewController{
        func getFoodItemData(){
            ref.child("foodItems").observe(.value, with: {
                (snapshot) in
                
                if let data = snapshot.value{
                    if let foodItems = data as? [String: Any]
                    {
                        for item in foodItems
                        {
                            if let foodInfo = item.value as? [String: Any]
                            {
                                let singleFoodItem = FoodItem(_id: "",
                                            foodName: foodInfo["name"] as! String ,
                                            foodDescription: foodInfo["description"] as! String ,
                                            foodPrice: foodInfo["price"] as! Double ,
                                            discount: foodInfo["discount"] as! Int  ,
                                            image: foodInfo["image"] as! String ,
                                            category: foodInfo["category"] as! String )
                                
                                
                                self.foodItems.append(singleFoodItem)
                            }
                        }
                        self.tblfood.reloadData()
                    }
                }
            })
     }
    
}

extension FoodViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int{
            return foodItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblfood.dequeueReusableCell(withIdentifier: "FoodCellReuseIdentifier", for: indexPath) as! FoodTableViewCell
        cell.setupView(foodItem: foodItems[indexPath.row]);
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectFoodItem = foodItems[indexPath.row]
        self.performSegue(withIdentifier: "HomeToViewFoodItem", sender: nil)
    }
}
    
