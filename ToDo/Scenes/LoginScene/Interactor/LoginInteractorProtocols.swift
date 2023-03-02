//
//  LoginInteractorProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

import Foundation

typealias LoginInteractorInput = LoginViewControllerOutput

protocol LoginBusinessLogicInput {
	func tryToLogin(request: LoginModels.Request)
}

protocol LoginInteractorOutput: AnyObject {
	func showLoginSuccess()
	func showLoginFailure(message: String)
}
