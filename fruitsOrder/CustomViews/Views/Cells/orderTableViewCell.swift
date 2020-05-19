//
//  orderTableViewCell.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-04-26.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import UIKit

class orderTableViewCell: UITableViewCell {

    static let reuseID = "orderTableViewCell"
       
      let orderImageView = ImageTitleView(frame: .zero)
      let customerName = TitleLabel(textAlignment: .left, fontSize: 20)
      let typeLbl = TitleLabel(textAlignment: .left, fontSize: 20)
      let sizeLbl = TitleLabel(textAlignment: .left, fontSize: 20)
      let emailLbl = TitleLabel(textAlignment: .left, fontSize: 15)
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           configure()
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
       private func configure() {
     
        // add shadow on cell
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        
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


