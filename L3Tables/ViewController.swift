//
//  ViewController.swift
//  L3Tables
//
//  Created by Artem on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //Отложенная инициализация
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "Identifier")
        table.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.reuseIdentifier)
        table.estimatedRowHeight = 140
        return table
    }()
    
    var dataSource: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        dataSource = Array(repeating: User(name: "Den",
                                           lastName: "Koltrein",
                                           age: "32",
                                           avatarImage: UIImage(named: "Zvezdopad")), count: 30)
        view.addSubview(tableView)
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as! UserTableViewCell
        
        
        let user = dataSource[indexPath.row]
        cell.configureCell(with: user)
            
        
//        let model = dataSource[indexPath.row]
//        var listConfiguration = cell.defaultContentConfiguration()
//        var backgroundConfiguration = cell.defaultBackgroundConfiguration()
//        backgroundConfiguration.backgroundColor =  .brown
//        backgroundConfiguration.cornerRadius = 10
//        backgroundConfiguration.backgroundInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
//        listConfiguration.text =  model
//        listConfiguration.secondaryTextProperties.color = .purple
//        listConfiguration.secondaryText = "secondary Text"
//        cell.contentConfiguration = listConfiguration
//        cell.backgroundConfiguration = backgroundConfiguration
        
        return cell
    }
}

