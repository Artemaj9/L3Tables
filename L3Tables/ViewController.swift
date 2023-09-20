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
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Identifier")
        return table
    }()
    
    var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        dataSource = ["Hello", "World", "You", "My", "Wonderwall","Hello", "World", "You", "My", "Wonderwall","Hello", "World", "You", "My", "Wonderwall","Hello", "World", "You", "My", "Wonderwall","Hello", "World", "You", "My", "Wonderwall"]
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier", for: indexPath)
        
        let model = dataSource[indexPath.row]
        var listConfiguration = cell.defaultContentConfiguration()
        var backgroundConfiguration = cell.defaultBackgroundConfiguration()
        backgroundConfiguration.backgroundColor =  .brown
        backgroundConfiguration.cornerRadius = 10
        backgroundConfiguration.backgroundInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        listConfiguration.text =  model
        listConfiguration.secondaryTextProperties.color = .purple
        listConfiguration.secondaryText = "secondary Text"
        cell.contentConfiguration = listConfiguration
        cell.backgroundConfiguration = backgroundConfiguration
        
        return cell
    }
    
}

