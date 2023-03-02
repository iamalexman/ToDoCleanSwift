//
//  ToDoListInteractorProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

import Foundation

protocol IToDoListBusinessLogicInput: AnyObject {
	func viewIsReady()
	func didTaskSelected(at indexPath: IndexPath)
}
