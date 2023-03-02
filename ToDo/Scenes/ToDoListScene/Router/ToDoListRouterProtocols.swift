//
//  ToDoListRouterProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

protocol ToDoListRoutingLogic {
	//func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ToDoListDataPassing {
	var dataStore: ToDoListDataStore? { get }
}
