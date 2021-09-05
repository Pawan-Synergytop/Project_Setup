//
//  AccordionHeaderView.swift
//  FZAccordionTableViewExample
//
//  Created by Krisjanis Gaidis on 10/5/15.
//  Copyright © 2015 Fuzz. All rights reserved.
//

import UIKit

class CategoryHeaderView: FZAccordionTableViewHeaderView {
    static let kDefaultAccordionHeaderViewHeight: CGFloat = 40.0
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var imgErro: UIImageView!
}

class SubCategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtValue: UILabel!

}
