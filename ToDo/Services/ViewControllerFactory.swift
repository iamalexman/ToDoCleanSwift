//
//  ViewControllerFactory.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

import UIKit

protocol SceneFactory {
	var loginSceneconfigurator: ILoginSceneConfigurator! { get set }
	func makeLoginScene() -> UIViewController
	
	var toDoSceneConfigurator: ToDoScreenConfigurator! { get set }
	func makeToDoScene() -> UIViewController
}

final class DefaultSceneFactory: SceneFactory {
	var loginSceneconfigurator: ILoginSceneConfigurator!
	var toDoSceneConfigurator: ToDoScreenConfigurator!
	
	func makeLoginScene() -> UIViewController {
		let viewController = LoginViewController()
		return loginSceneconfigurator.configured(viewController)
	}
	
	func makeToDoScene() -> UIViewController {
		let sceneFactory = DefaultSceneFactory()
		let viewController = ToDoListViewController()
		sceneFactory.toDoSceneConfigurator = DefaultToDoSceneConfigurator(sceneFactory: sceneFactory)
		return sceneFactory.toDoSceneConfigurator.configured(viewController)
	}
}
