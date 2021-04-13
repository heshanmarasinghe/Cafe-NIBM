//
//  OrdersViewController.swift
//  Cafe NIBM
//
//  Created by Heshan on 4/12/21.
//  Copyright © 2021 Heshan. All rights reserved.
//

import UIKit
import Firebase
import Loaf

class OrdersViewController: UIViewController {

    var orders: [Order] = []
    
    let sessionMGR = SessionManager()
    var ref: DatabaseReference!
    
    @IBOutlet weak var tblorders: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        tblorders.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderCellReuseIdentifier")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getAllOrders()
    }

}

extension OrdersViewController {
    func getAllOrders() {
                
        self.orders.removeAll()
        self.ref.child("orders")
            .child(sessionMGR.getUserLogin().userEmail
            .replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_"))
            .observe(.value, with: {
                snapshot in

                if let data = snapshot.value {
                    if let orders = data as? [String: Any] {
                        for singleOrder in orders {
                            var placedOrder = Order()
                            placedOrder.orderId = singleOrder.key
                            if let orderInfo = singleOrder.value as? [String: Any] {
                                placedOrder.orderStatus = orderInfo["status"] as! String
                                if let orderItems = orderInfo["orderItems"] as? [Any] {
                                    for item in orderItems {
                                        if let itemInfo = item as? [String: Any] {
                                            placedOrder.orderTotal += (itemInfo["foodPrice"] as? Double)!
                                        }
                                    }
                                }
                            }
                            self.orders.append(placedOrder)
                        }
                        self.tblorders.reloadData()
                    }
                }
                
            })
    }
}

extension OrdersViewController: UITableViewDataSource, UITableViewDelegate{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return orders.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tblorders.dequeueReusableCell(withIdentifier: "OrderCellReuseIdentifier", for: indexPath) as! OrderTableViewCell
    cell.setupUI(order: orders[indexPath.row])
    return cell
}

    
}
