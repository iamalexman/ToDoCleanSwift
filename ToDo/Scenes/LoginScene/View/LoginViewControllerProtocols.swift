//
//  LoginViewControllerProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

protocol ILoginDisplayLogicInput: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

protocol ILoginViewControllerOutput: AnyObject {
	func tryToLogin()
}
