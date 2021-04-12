//
//  TaskListViewController.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/11/21.
//

import Foundation
import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource {
    
    let headerLabel = UILabel()
    let tableView = UITableView()
    
    private var listHeader = ""
    private var taskList = [String]()
    private let reuseIdentifier = "Cell"
    
    convenience init(header: String, taskList: [String]) {
        self.init()
        self.listHeader = header
        self.taskList = taskList
        tableView.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = listHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell(in: tableView)
        cell.textLabel?.text = taskList[indexPath.row]
        return cell
    }
    
    private func dequeueCell(in tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
}
