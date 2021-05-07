//
//  TaskListViewController.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/11/21.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let headerLabel = UILabel.makeLabel(for: .largeTitle)
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    private var listHeader = ""
    private var taskList = [String]()
    private var selection: ((String) -> Void)? = nil
    private let reuseIdentifier = "Cell"
    
    convenience init(header: String, taskList: [String], selection: @escaping (String) -> Void) {
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
        selection?(taskList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderView(with: headerLabel)
    }
    
    // MARK: Helpers
    private func dequeueCell(in tableView: UITableView, for task: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! TaskListItemCell
        cell.titleLabel.text = task
        cell.notificationLabel.text = String(describing: Date())
        return cell
    }
}
