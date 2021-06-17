//
//  TaskListViewController.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/11/21.
//

import UIKit

struct TaskListItem {
    var title: String
    let notification: Date
}

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
        
    private var listHeader = ""
    private(set) var taskList = [TaskListItem]()
    private var selection: ((String) -> Void)? = nil
    
    convenience init(header: String, taskList: [TaskListItem], selection: @escaping (String) -> Void) {
        self.init()
        self.listHeader = header
        self.taskList = taskList
        self.selection = selection
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .secondarySystemBackground
    }
    
    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TaskListItemCell.nib(), forCellReuseIdentifier: TaskListItemCell.identifier)
        tableView.register(HeaderView.nib(), forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tableView.separatorStyle = .none
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return dequeueHeaderView(in: tableView)
    }
    
    // MARK: Helpers
    private func dequeueCell(in tableView: UITableView, for task: TaskListItem) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskListItemCell.identifier) as! TaskListItemCell
        cell.titleLabel.text = task.title
        cell.notificationLabel.text = String(describing: task.notification)
        return cell
    }
    
    private func dequeueHeaderView(in tableView: UITableView) -> UIView {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as! HeaderView
        headerView.label.text = listHeader
        return headerView
    }
}
