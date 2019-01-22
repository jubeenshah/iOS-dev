//
//  ViewController.swift
//  Todoey
//
//  Created by Jubeen shah on 1/22/19.
//  Copyright © 2019 Jubeen shah. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["A", "B", "C"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDOItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - TableView Delegate Methods

}

