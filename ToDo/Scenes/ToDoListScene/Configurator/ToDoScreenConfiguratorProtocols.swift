//
//  ToDoScreenConfiguratorProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

protocol IToDoScreenConfigurator {
	func configured(_ viewController: ToDoListViewController) -> ToDoListViewController
}
