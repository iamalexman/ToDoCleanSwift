//
//  LoginInteractorProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

import Foundation

typealias ILoginInteractorInput = ILoginViewControllerOutput

protocol ILoginBusinessLogicInput {
	func tryToLogin(request: LoginModels.Request)
}

protocol ILoginInteractorOutput: AnyObject {
	func showLoginSuccess()
	func showLoginFailure(message: String)
}
