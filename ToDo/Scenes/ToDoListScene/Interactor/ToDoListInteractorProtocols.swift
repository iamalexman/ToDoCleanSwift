//
//  ToDoListInteractorProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

import Foundation

protocol ToDoListBusinessLogicInput: AnyObject {
	func viewIsReady()
	func didTaskSelected(at indexPath: IndexPath)
}

protocol ToDoListDataStore {
	//var name: String { get set }
}
