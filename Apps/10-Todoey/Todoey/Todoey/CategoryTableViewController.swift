//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Jubeen shah on 1/26/19.
//  Copyright © 2019 Jubeen shah. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

      var categoryArray = [Category]()
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategory()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categoryArray[indexPath.row]
        categoryCell.textLabel?.text = category.name
        return categoryCell
    }
    


    func loadCategory(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error Fetching Data \(error)")
        }
        tableView.reloadData()
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Category todoey?", message: "", preferredStyle: .alert)
        let enterTextAlert = UIAlertController(title: "Please enter a category", message: "", preferredStyle: .alert)
        let dismissEnterTextAlert = UIAlertAction(title: "OK", style: .default) { (dismissEnterTextAlert) in
            self.present(alert, animated: true, completion: nil)
        }
        enterTextAlert.addAction(dismissEnterTextAlert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            if textField.text != "" {
                self.categoryArray.append(newCategory)
                self.saveCategory()
            } else {
                
                self.present(enterTextAlert, animated: true, completion: nil)
            }
            print(self.categoryArray)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Category"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func saveCategory() {
        
        do {
            
            try context.save()
            
        } catch {
            
            print("Error saving context -> \(error)")
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPathTest = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPathTest.row]
        }
    }
    
}
