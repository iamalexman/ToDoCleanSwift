//
//  LoginSceneConfigurator.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

final class DefaultLoginSceneConfigurator: ILoginSceneConfigurator {
	private var sceneFactory: SceneFactory
	
	init(sceneFactory: SceneFactory) {
		self.sceneFactory = sceneFactory
	}
	
	func configured(_ viewController: LoginViewController) -> LoginViewController {
		sceneFactory.loginSceneconfigurator = self
//		let service = DefaultAuthService(
//			networkManager: DefaultNetworkManager(session: MockNetworkSession())
//		)
//		let authWorker = LoginSceneAuthWorker(service: service)
		let presenter = LoginPresenter()
		let worker = LoginWorker()
		let interactor = LoginInteractor(presenter: presenter, worker: worker)
		let router = LoginRouter(sceneFactory: sceneFactory)
		router.viewController = viewController
		presenter.viewController = viewController
		interactor.presenter = presenter
//		interactor.authWorker = authWorker
		viewController.interactor = interactor
		viewController.router = router
		return viewController
	}
}
