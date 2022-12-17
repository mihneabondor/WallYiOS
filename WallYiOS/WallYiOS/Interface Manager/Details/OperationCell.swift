//
//  OperationCell.swift
//  WallYiOS
//
//  Created by David Retegan on 17.12.2022.
//

import UIKit

class OperationCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!

    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var signIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 13.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
