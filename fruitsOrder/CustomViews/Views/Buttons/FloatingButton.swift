//
//  FloatingButton.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-05-04.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//



import UIKit

class FloatingButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        
        
    }
    
    private func configure() {
        
        
        setImage(UIImage(named: "icons8-add-100"), for: .normal)
       
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 40
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}
