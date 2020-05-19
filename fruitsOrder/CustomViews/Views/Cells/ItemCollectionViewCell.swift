//
//  ItemCollectionViewCell.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-05-01.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//


import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    
    static let reuseID = "ItemCollectionViewCell"
    
    let containerView = ImageTitleView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    // fill in the username value
      func set(follower: Order) {
        containerView.itemImage.image = UIImage(named: "top-view-cup-coffee-with-copy-space_23-2148336691")
        containerView.itemTitle.text = "Coffee"
         
      }
    
    func configureViews() {
        addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
