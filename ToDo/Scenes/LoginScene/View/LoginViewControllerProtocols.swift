//
//  LoginViewControllerProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

protocol LoginDisplayLogicInput: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

protocol LoginViewControllerOutput: AnyObject {
	func tryToLogin()
}
