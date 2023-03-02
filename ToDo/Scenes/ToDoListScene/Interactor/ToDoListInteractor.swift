//
//  ToDoListInteractor.swift
//  ToDo
//
//  Created by Alex Smith on 26.02.2023.
//

import UIKit

final class ToDoListInteractor: ToDoListBusinessLogicInput {
	private var sectionManager: ITaskManagerSectionsAdapter!
	var presenter: ToDoListPresentationLogic?
	
	init(presenter: ToDoListPresentationLogic?,
		 sectionManager: ITaskManagerSectionsAdapter!) {
		
		self.presenter = presenter
		self.sectionManager = sectionManager
	}
	
	// MARK: Business logic
	
	func viewIsReady() {
		presenter?.present(response: mapViewData())
	}
	
	func didTaskSelected(at indexPath: IndexPath) {
		let section = sectionManager.getSection(forIndex: indexPath.section)
		let task = sectionManager.getTasksForSection(section: section)[indexPath.row]
		task.completed.toggle()
		presenter?.present(response: mapViewData())
	}
	
	private func mapViewData() -> ToDoList.ViewModel {
		var sections = [ToDoList.ViewModel.Section]()
		for section in sectionManager.getSections() {
			let sectionData = ToDoList.ViewModel.Section(
				title: section.title,
				tasks: mapTasksData(tasks: sectionManager.getTasksForSection(section: section))
			)
			sections.append(sectionData)
		}
		return ToDoList.ViewModel(tasksBySections: sections)
	}
	
	private func mapTasksData(tasks: [Task]) -> [ToDoList.ViewModel.Task] {
		tasks.map { mapTaskData(task: $0) }
	}
	
	private func mapTaskData(task: Task) -> ToDoList.ViewModel.Task {
		if let task = task as? ImportantTask {
			let dateFormatter = DateFormatter()
					dateFormatter.dateFormat = "MM.dd.yy"
			let result = ToDoList.ViewModel.ImportantTask(
				name: task.title,
				isDone: task.completed,
				isOverdue: task.deadLine < Date(),
				deadline: "Deadline: \(dateFormatter.string(from: task.deadLine))",
				priority: "\(task.taskPriority)"
			)
			return .importantTask(result)
		} else {
			return .regularTask(ToDoList.ViewModel.RegularTask(name: task.title,
															   isDone: task.completed))
		}
	}
}
