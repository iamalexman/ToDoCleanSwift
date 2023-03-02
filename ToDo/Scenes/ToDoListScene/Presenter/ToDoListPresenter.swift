//
//  ToDoListPresenter.swift
//  ToDo
//
//  Created by Alex Smith on 26.02.2023.
//

import UIKit

class ToDoListPresenter: ToDoListPresentationLogic {
	weak var viewController: ToDoListDisplayLogicInput?
	
	// MARK: Presentation
	
	func present(response: ToDoList.ViewModel) {
		viewController?.render(viewModel: response)
	}
}
