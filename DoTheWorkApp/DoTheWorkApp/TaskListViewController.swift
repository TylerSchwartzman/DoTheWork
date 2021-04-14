//
//  TaskListViewController.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/11/21.
//

import UIKit

struct TaskListItem {
    let title: String
    let notification: Date
}

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let headerLabel = UILabel()
    let tableView = UITableView()
    
    private var listHeader = ""
    private var taskList = [TaskListItem]()
    private var selection: ((String) -> Void)? = nil
    private let reuseIdentifier = "Cell"
    
    convenience init(header: String, taskList: [TaskListItem], selection: @escaping (String) -> Void) {
        self.init()
        self.listHeader = header
        self.taskList = taskList
        self.selection = selection
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = listHeader
        tableView.register(TaskListItemCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = UIScreen.main.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = taskList[indexPath.row]
        let cell = dequeueCell(in: tableView, for: task)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(taskList[indexPath.row].title)
    }
    
    private func dequeueCell(in tableView: UITableView, for task: TaskListItem) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! TaskListItemCell
        cell.titleLabel.text = task.title
        cell.notificationLabel.text = String(describing: task.notification)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerLabel
    }
}
