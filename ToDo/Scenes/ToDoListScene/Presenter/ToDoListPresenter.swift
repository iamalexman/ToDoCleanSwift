//
//  ToDoListPresenter.swift
//  ToDo
//
//  Created by Alex Smith on 26.02.2023.
//

import UIKit

class ToDoListPresenter: IToDoListPresentationLogic {
	weak var viewController: IToDoListDisplayLogicInput?
	
	// MARK: Presentation
	
	func present(response: ToDoList.ViewModel) {
		viewController?.render(viewModel: response)
	}
}
