//
//  CollectionCellInTableCell.swift
//  CollectionViewInCellDemo
//
//  Created by Itsuki on 2024/02/23.
//

import UIKit

class CollectionCellInTableCell: UICollectionViewCell {
    static let cellIdentifier = String(describing: CollectionCellInTableCell.self)

    
    @IBOutlet weak var labelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        containerView.layer.borderWidth = 1.0
        containerView.clipsToBounds = true
    }

}
