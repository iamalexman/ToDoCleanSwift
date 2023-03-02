//
//  LoginPresenter.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

class LoginPresenter: ILoginPresentationLogic {
	weak var viewController: ILoginDisplayLogicInput?
	
	// MARK: Presentation
	
	func present(response: LoginModels.Response) {
		let viewModel = LoginModels.ViewModel(
			success: response.success,
			userName: response.login,
			lastLoginDate: "\(response.lastLoginDate)"
		)
		viewController?.render(viewModel: viewModel)
	}
}
