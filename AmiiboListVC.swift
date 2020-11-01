//
//  ViewController.swift
//  CollectionViewAPI
//
//  Created by Sean Kang on 2020/10/28.
//

import UIKit

class AmiiboListVC: UIViewController {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var amiiboList = [AmiiboforView]()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
       
        
        setupView()
        
        let anonymousFunction = { (fetchedAmiiboList: [Amiibo]) in
            DispatchQueue.main.async {
                let amiiboforViewList = fetchedAmiiboList.map { amiibo in
                    return AmiiboforView(name: amiibo.name, gameSeries: amiibo.gameSeries, imageUrl: amiibo.image, count: 0)
                }
                self.amiiboList = amiiboforViewList
                self.tableView.reloadData()
            }
            
        }
        AmiiboAPI.shared.fetchAmiiboList(onCompletion: anonymousFunction)
        
        
    }
    // MARK: - Setup View
    func setupView() {
        view.addSubview(tableView)
        tableView.register(AmiiboCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
}

extension AmiiboListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amiiboList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let amiibo = amiiboList[indexPath.row]
        
        guard let amiiboCell = cell as? AmiiboCell else {
            return cell
        }
        
        
        
        amiiboCell.nameLabel.text = amiibo.name
        amiiboCell.gameSeriesLabel.text = amiibo.gameSeries
        amiiboCell.owningCountLabel.text = String(amiibo.count)
        if let url = URL(string: amiibo.imageUrl) {
            amiiboCell.imageIV.loadImage(from: url)
        }
        
        return cell
    }
    
    
}

// Mark: - UITableViewDelegate

extension AmiiboListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
          
            self.amiiboList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let amiibo = self.amiiboList[indexPath.row]
        let amiiboDetailVC = AmiiboDetailVC()
        amiiboDetailVC.amiibo = amiibo
        self.present(amiiboDetailVC, animated: true)
    }
    
}
