//
//  LoginInteractor.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

import UIKit

//protocol LoginDataStore {
//	var email: String? { get set }
//	var password: String? { get set }
//}

class LoginInteractor {
	var presenter: ILoginPresentationLogic?
	var worker: LoginWorker?
	
	init(presenter: ILoginPresentationLogic,
		 worker: LoginWorker) {
		
		self.presenter = presenter
		self.worker = worker
	}
}

// MARK: Interactor Input protocol

extension LoginInteractor: LoginBusinessLogicInput {
	func tryToLogin(request: LoginModels.Request) {
		let result = worker?.login(login: request.login,
								   password: request.password)

		let response = LoginModels.Response(
			success: result?.success ?? false,
			login: result?.login ?? "",
			lastLoginDate: result?.lastLoginDate ?? Date()
		)
		presenter?.present(response: response)
	}
}
