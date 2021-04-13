//
//  OrderTableViewCell.swift
//  Cafe NIBM
//
//  Created by Heshan on 4/12/21.
//  Copyright © 2021 Heshan. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupUI(order: Order){
        lblOrderId.text = order.orderId
        lblStatus.text = order.orderStatus
        lblTotal.text = "LKR: \(order.orderTotal)"
    }
}
