//
//  LoginRouter.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

import UIKit

//protocol LoginDataPassing {
//	var dataStore: LoginDataStore? { get }
//}

final class LoginRouter {
	weak var viewController: LoginViewController?
	private let sceneFactory: SceneFactory
//	var dataStore: LoginDataStore?
	
	init(sceneFactory: SceneFactory) {
		self.sceneFactory = sceneFactory
	}
	
	// MARK: Routing
	
	// MARK: Navigation
	
	//func navigateToSomewhere(source: LoginViewController, destination: SomewhereViewController) {
	//  source.show(destination, sender: nil)
	//}
	
	// MARK: Passing data
	
	//func passDataToSomewhere(source: LoginDataStore, destination: inout SomewhereDataStore) {
	//  destination.name = source.name
	//}
}

// MARK: Routing Logic

extension LoginRouter: LoginRoutingLogic {
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
