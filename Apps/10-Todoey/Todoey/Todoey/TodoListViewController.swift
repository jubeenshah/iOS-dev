//
//  ViewController.swift
//  Todoey
//
//  Created by Jubeen shah on 1/22/19.
//  Copyright © 2019 Jubeen shah. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["A", "B", "C"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Something todoey?", message: "", preferredStyle: .alert)
        let enterTextAlert = UIAlertController(title: "Todoey Text please", message: "", preferredStyle: .alert)
        let dismissEnterTextAlert = UIAlertAction(title: "OK", style: .default) { (dismissEnterTextAlert) in
            self.present(alert, animated: true, completion: nil)
        }
        
        enterTextAlert.addAction(dismissEnterTextAlert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks the "Add item" button
            //print(textField.text!)
            if textField.text != "" {
            self.itemArray.append(textField.text!)
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
            } else {
                
                self.present(enterTextAlert, animated: true, completion: nil)
            }
            print(self.itemArray)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

