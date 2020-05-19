//
//  OrderTableViewController.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-04-26.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import UIKit

class OrderTableViewController: UIViewController {
    
    
     let tableView = UITableView()
     let addFloatingButton = FloatingButton()
     
    
    
    var orderListViewModel = OrderListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        populateOrder()
        configureViewController()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    
    
    private func configureViewController() {
        view.backgroundColor    = .systemBackground
        title                   = "Coffee"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.gray
        
        //navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
      
       
      
        
    }
    
    func configureTableView() {
        view.addSubviews(tableView,addFloatingButton)
        tableView.frame         = view.bounds
      //  tableView.backgroundColor = .lightGray
       // tableView.rowHeight     = 250
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.removeExcessCells()
        tableView.register(orderTableViewCell.self, forCellReuseIdentifier: orderTableViewCell.reuseID)
        
       
        NSLayoutConstraint.activate([
                  addFloatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
                  addFloatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
                  addFloatingButton.heightAnchor.constraint(equalToConstant: 80),
                  addFloatingButton.widthAnchor.constraint(equalToConstant: 80)
                  ])

    }
    
    
    private func populateOrder(){
     
        
        Webservice().load(resourse: Order.all) { [ weak self ] result in
            
            switch result {
            case.success(let orders):
                self?.orderListViewModel.orders = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
                
            case .failure(let error):
                print(error)
                self?.presentGFAlertOnMainThread(title: "Error", message: "not able to fetch Order", buttonTitle: "Ok")
            }
            
        }
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension OrderTableViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.orders.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: orderTableViewCell.reuseID, for: indexPath) as! orderTableViewCell
        
        let orderVM = self.orderListViewModel.orderViewModel(at: indexPath.row)

        cell.customerName.text = "Customer: \(orderVM.name)"
        cell.emailLbl.text = "Email: \(orderVM.email)"
        cell.sizeLbl.text = "Size: \(orderVM.size)"
        cell.typeLbl.text = "Order: \(orderVM.type)"
        
       
        
        return cell
        
    }
    
    
    

}
