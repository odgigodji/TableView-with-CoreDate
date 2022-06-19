//
//  TableViewController.swift
//  toDoWithCoreData
//
//  Created by Nikita Evdokimov on 19.06.2022.
//

import UIKit

class TableViewController: UITableViewController {

    var tasks: [String] = ["a", "b", "c", "d", "e"]
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        
        navigationItem.title = "ToDo with CoreData"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusTask))
    }
    
    @objc func plusTask() {
        let alertController = UIAlertController(title: "New task", message: "enter task", preferredStyle: .alert)
        
        let saveTask = UIAlertAction(title: "save", style: .default) { action in
            let tf = alertController.textFields?.first
            if let newTask = tf?.text {
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        alertController.addTextField { _ in }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveTask)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundView?.backgroundColor = .yellow
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

