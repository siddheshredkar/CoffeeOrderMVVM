//
//  AddOrderViewController.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-04-29.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import Foundation
import UIKit

protocol AddOrderDelegate {
  func  AddOrderViewControllerDidSave(order: Order,controller: UIViewController)
  func  AddOrderViewControllerDidClose(controller: UIViewController)
}



class AddOrderViewController: UIViewController{
    
    private var vm = AddOrderViewModel()
    
    var delegate: AddOrderDelegate?
    
    private var segmentedControl: UISegmentedControl!

    let imageTitleView = ImageTitleView()
    let BriefLabel = BodyLabel()
    let OrderButton = Button()
    let closeButton = UIButton()
    
    let coffeImages = imageArray1
    var ImageIndex = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        SetImage()
        configure()
        SetupUI()
        // Do any additional setup after loading the view.
    }
    
    
    
    private func SetImage(){
        imageTitleView.itemImage.image = UIImage(named: coffeImages[ImageIndex])
    }
    
    
    private func configure() {
        
        BriefLabel.numberOfLines = 0
        BriefLabel.text = "Caffè Americano is a type of coffee drink prepared by diluting an espresso with hot water, giving it a similar strength to, but different flavor from, traditionally brewed coffee. The strength of an Americano varies with the number of shots of espresso and the amount of water added"
        
        
        self.segmentedControl = UISegmentedControl(items: self.vm.sizes)
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        
        
        OrderButton.backgroundColor = UIColor.blue
        OrderButton.setTitle("Order", for: .normal)
        OrderButton.addTarget(self, action: #selector(handelOrderBtn), for: .touchUpInside)
        
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        closeButton.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
        
        
        
    }
    
    
    
    @objc fileprivate func handelOrderBtn(){
        
        let name = "Siddhesh"
        let email = "siddehsh@gmail.com"
        let selectedSize = self.segmentedControl.titleForSegment(at: self.segmentedControl.selectedSegmentIndex)
        let selectedType = self.vm.types[0].lowercased()
        
   
        self.vm.name = name
        self.vm.email = email
        self.vm.selectedSize = selectedSize
        self.vm.selectedType = selectedType
        
        print(self.vm)
        
        Webservice().load(resourse: Order.create(vm: self.vm)) { result in
            
          switch result{
            case .success(let order):
               
                
                if let order = order , let delegate = self.delegate {
                    print(order)
                    delegate.AddOrderViewControllerDidSave(order: order, controller: self)
                }
                
                self.presentGFAlertOnMainThread(title: "Order Placed", message: "Thank You For placing the Order", buttonTitle: "Ok")
                
                
            case .failure(let error):
                print(error)
          }
        }
        
        
    }

    
    @objc fileprivate func handleSegmentChange() {
        print(segmentedControl.selectedSegmentIndex)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("small")
        case 1:
            print("medium")
        default:
            print("large")
        }
        
    }
    
    
    @objc fileprivate func handleCloseButton() {
      
        if let delegate = self.delegate{
            delegate.AddOrderViewControllerDidClose(controller: self)
        }
        
    }
    
    
    private func SetupUI(){
        
        self.navigationController?.navigationBar.isHidden = true
        let padding: CGFloat = 12
        
        BriefLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        

        
        let DiscriptionView = UIView()
        DiscriptionView.addSubviews(BriefLabel)
        
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        
        let buttonsStackView = UIStackView(arrangedSubviews: [OrderButton])
        buttonsStackView.layoutMargins = .init(top: 12, left: 40, bottom: 12, right: 40)
        buttonsStackView.isLayoutMarginsRelativeArrangement = true
        
        
        let stackView = UIStackView(arrangedSubviews: [imageTitleView,DiscriptionView,
                                                       paddedStackView,buttonsStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = padding
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero)
        
        view.addSubview(closeButton)
        closeButton.anchor(top: view.topAnchor, leading: view.leadingAnchor , bottom: nil, trailing: nil , padding: .init(top: 12, left: 12, bottom: 0, right: 0))
        

     
        
        NSLayoutConstraint.activate([
            
        
            imageTitleView.heightAnchor.constraint(equalToConstant: 300),
            
            
            BriefLabel.topAnchor.constraint(equalTo: DiscriptionView.topAnchor, constant: padding),
            BriefLabel.leadingAnchor.constraint(equalTo: DiscriptionView.leadingAnchor, constant: padding),
            BriefLabel.trailingAnchor.constraint(equalTo: DiscriptionView.trailingAnchor, constant: -padding),
            BriefLabel.bottomAnchor.constraint(equalTo: DiscriptionView.bottomAnchor,constant: -padding),
            BriefLabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            
            
            
        ])
    }
    

    
    
    
}

