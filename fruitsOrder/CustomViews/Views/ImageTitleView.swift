//
//  ImageTitleView.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-05-01.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import Foundation
import UIKit


class ImageTitleView:UIView{
   
    
    let itemImage = UIImageView()
    let itemTitle = UILabel()
    
    
    let cornerRadius: CGFloat = 15
    let shadowOffsetWidth: Int = 0
    let shadowOffsetHeight: Int = 3
    let shadowColor: UIColor? = UIColor.black
    let shadowOpacity: Float = 0.5
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           configure()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
     
        itemImage.image = UIImage(named: Images.cortado)
        itemImage.contentMode = .scaleToFill
        
        itemTitle.font = UIFont.boldSystemFont(ofSize: 30)
        itemTitle.textColor = UIColor.white
        itemTitle.numberOfLines = 1
        
        
        
        addSubviews(itemImage,itemTitle)
        
          let padding: CGFloat = 12
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
            
            
                     itemImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                     itemImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0),
                     itemImage.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0),
                     itemImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0),
                 
                   
                     
                     
                     
                     itemTitle.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: -(padding + 50)),
                     itemTitle.leadingAnchor.constraint(equalTo: itemImage.leadingAnchor, constant: padding),
                     itemTitle.trailingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: -padding),
                     itemTitle.heightAnchor.constraint(equalToConstant: 50),
            
              
           ])
           
       }
       
}

