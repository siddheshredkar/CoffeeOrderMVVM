//
//  Button.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-05-01.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        // DYNAMIC TYPE
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // ANYTIME WE MAKE AN INSTANCE WE DON'T NEED TO CONFIGURE THIS
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
}
