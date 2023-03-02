//
//  LoginRouter.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

import UIKit

final class LoginRouter {
	weak var viewController: LoginViewController?
	private let sceneFactory: SceneFactory
	
	init(sceneFactory: SceneFactory) {
		self.sceneFactory = sceneFactory
	}
}

// MARK: Routing Logic

extension LoginRouter: ILoginRoutingLogic {
	func showLoginSuccess() {
		let scene = sceneFactory.makeToDoScene()
		viewController?.navigationController?.pushViewController(scene, animated: true)
	}
	
	func showLoginFailure(message: String) {
		let action = UIAlertAction(title: "OK",
								   style: .destructive)
		let alertController = UIAlertController(title: "Login Failure",
												message: message,
												preferredStyle: .alert)
		alertController.addAction(action)
		viewController?.present(alertController, animated: true)
	}
}
