//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by Alex Smith on 26.02.2023.
//

import UIKit

final class ToDoListViewController: UITableViewController {
	private var viewModel: ToDoList.ViewModel = ToDoList.ViewModel(tasksBySections: [])
	var interactor: ToDoListBusinessLogicInput?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "ToDoList"
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		interactor?.viewIsReady()
	}
	
	// MARK: - Table view datasource and delegate
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		viewModel.tasksBySections.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let section = viewModel.tasksBySections[section]
		return section.tasks.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tasks = viewModel.tasksBySections[indexPath.section].tasks
		let taskData = tasks[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		var contentConfig = cell.defaultContentConfiguration()
		
		switch taskData {
		case .importantTask(let task):
			let redText = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]
			let taskText = NSMutableAttributedString(string: "\(task.priority) ", attributes: redText)
			taskText.append(NSAttributedString(string: task.name))
			
			contentConfig.attributedText = taskText
			contentConfig.secondaryText = task.deadline
			contentConfig.secondaryTextProperties.color = task.isOverdue ? .systemPink.withAlphaComponent(0.2) : .black
			cell.accessoryType = task.isDone ? .checkmark : .none
		case .regularTask(let task):
			contentConfig.text = task.name
			cell.accessoryType = task.isDone ? .checkmark : .none
		}
		cell.tintColor = .systemRed
		contentConfig.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)
		contentConfig.textProperties.font = UIFont.boldSystemFont(ofSize: 19)
		cell.selectionStyle = .none
		cell.contentConfiguration = contentConfig
		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		viewModel.tasksBySections[section].title
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		interactor?.didTaskSelected(at: indexPath)
	}
}

// MARK: Input protocol

extension ToDoListViewController: ToDoListDisplayLogicInput {
	func render(viewModel: ToDoList.ViewModel) {
		self.viewModel = viewModel
		tableView.reloadData()
	}
}
