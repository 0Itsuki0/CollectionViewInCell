//
//  TableCell.swift
//  TableViewInCellDemo
//
//  Created by Itsuki on 2024/02/23.
//

import UIKit

class TableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    static let cellIdentifier = String(describing: TableCell.self)
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!

    var maxCellHeight: CGFloat = 0
    
    var items: Array<String> = [] {
        didSet {
            maxCellHeight = 0
            collectionView.reloadData()

            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.contentView.invalidateIntrinsicContentSize()
                self.collectionViewHeightConstraint.constant = self.maxCellHeight
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.register(UINib(nibName: CollectionCellInTableCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: CollectionCellInTableCell.cellIdentifier)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.minimumInteritemSpacing = 1000
            layout.minimumLineSpacing = 10
            collectionView.collectionViewLayout = layout
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.layer.borderColor = UIColor.systemGray5.cgColor
        collectionView.layer.borderWidth = 1.0
        collectionView.layer.cornerRadius = 4.0
        collectionView.layer.masksToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCellInTableCell.cellIdentifier, for: indexPath) as! CollectionCellInTableCell
        let title = items[indexPath.item]
        cell.label.text = title
        cell.label.sizeToFit()
        
        maxCellHeight = max(maxCellHeight,  cell.label.frame.height + 20) // 20 for pading
        return cell
    }
    
}
