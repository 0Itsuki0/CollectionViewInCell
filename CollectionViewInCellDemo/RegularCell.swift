//
//  RegularCell.swift
//  TableViewInCellDemo
//
//  Created by Itsuki on 2024/02/23.
//

import UIKit

class RegularCell: UITableViewCell {
    static let cellIdentifier = String(describing: RegularCell.self)


    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.backgroundColor = UIColor.systemGray6
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        containerView.layer.borderWidth = 1.0
        containerView.layer.cornerRadius = 4.0
        containerView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
