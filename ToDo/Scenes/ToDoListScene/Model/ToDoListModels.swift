//
//  ToDoListModels.swift
//  ToDo
//
//  Created by Alex Smith on 26.02.2023.
//

import UIKit

// MARK: ViewModel
enum ToDoList {
	struct ViewModel {
		struct RegularTask {
			let name: String
			let isDone: Bool
		}
		struct ImportantTask {
			let name: String
			let isDone: Bool
			let isOverdue: Bool
			let deadline: String
			let priority: String
		}
		enum Task {
			case regularTask(RegularTask)
			case importantTask(ImportantTask)
		}
		
		struct Section {
			let title: String
			let tasks: [Task]
		}
		let tasksBySections: [Section]
	}
}
