//
//  ItemsCollectionsViewController.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-05-01.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//


import UIKit

class ItemsCollectionsViewController: UIViewController {
    
     private var vm = AddOrderViewModel()
    
    let coffeImages = imageArray1
    
    enum Section { case main }
    
    
    var collectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // viewDidLoad reads as commands
        
        
       
        configureViewController()
        
        configureCollectionView()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
       
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Coffee"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        // initializd the object with a custom flow layout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        //then use the object
        view.addSubview(collectionView)
        //telling delegate what we're listening too
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemBackground
        // use the reuseID instance on the custom cell
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseID)
    }
    

    
    
 
    

    
}




extension ItemsCollectionsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
  

      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return self.vm.types.count
      }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseID, for: indexPath) as! ItemCollectionViewCell
      cell.containerView.itemTitle.text = self.vm.types[indexPath.row]
        cell.containerView.itemImage.image = UIImage(named: coffeImages[indexPath.row])
      return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
      //  let follower = activeArray[indexPath.item]
        
        let destVC = AddOrderViewController()
        destVC.ImageIndex = indexPath.row
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}


