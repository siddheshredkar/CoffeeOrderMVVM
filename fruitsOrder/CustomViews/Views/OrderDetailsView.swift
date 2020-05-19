//
//  OrderDetailsView.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-05-19.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//



import Foundation
import UIKit


class OrderDetailsView:UIView{
   

    let cornerRadius: CGFloat = 15
    let shadowOffsetWidth: Int = 0
    let shadowOffsetHeight: Int = 3
    let shadowColor: UIColor? = UIColor.black
    let shadowOpacity: Float = 0.5
    
    let orderImageView = ImageTitleView(frame: .zero)
    let customerName = TitleLabel(textAlignment: .left, fontSize: 20)
    let typeLbl = TitleLabel(textAlignment: .left, fontSize: 20)
    let sizeLbl = TitleLabel(textAlignment: .left, fontSize: 20)
    let emailLbl = TitleLabel(textAlignment: .left, fontSize: 15)
    
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
     
        
        let padding: CGFloat = 12
                        
               orderImageView.layer.cornerRadius = 4
               orderImageView.clipsToBounds = true
               
               let VstackView = UIStackView(arrangedSubviews: [customerName,
                                                              sizeLbl,typeLbl,emailLbl])
               VstackView.axis = .vertical
               VstackView.spacing = padding
               
        
               
               
               VstackView.translatesAutoresizingMaskIntoConstraints = false
               
                  addSubviews(VstackView,orderImageView)
           
                  
                  NSLayoutConstraint.activate([
                      
                  
                   VstackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
                   VstackView.trailingAnchor.constraint(equalTo: orderImageView.leadingAnchor, constant: -padding),
                   VstackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
                   VstackView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
                  // VstackView.widthAnchor.constraint(equalToConstant: 100),
           
                   orderImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
                   orderImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
                    orderImageView.widthAnchor.constraint(equalToConstant: 150),
                    orderImageView.heightAnchor.constraint(equalToConstant: 100)
                   
                   
                      
                      
                      
                  ])
   
           
       }
       
}

