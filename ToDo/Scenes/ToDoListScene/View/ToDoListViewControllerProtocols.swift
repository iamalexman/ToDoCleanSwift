//
//  ToDoListViewControllerProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

protocol ToDoListDisplayLogicInput: AnyObject {
	func render(viewModel: ToDoList.ViewModel)
}
