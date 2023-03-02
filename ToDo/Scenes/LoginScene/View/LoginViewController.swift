//
//  LoginViewController.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
	var interactor: ILoginBusinessLogicInput?
	var router: ILoginRoutingLogic?
	
	// MARK: Outlets
	
	let loginTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Login"
		textField.textAlignment = .center
		textField.layer.cornerRadius = 10
		textField.backgroundColor = .secondarySystemBackground
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	
	let passwordTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Password"
		textField.textAlignment = .center
		textField.layer.cornerRadius = 10
		textField.backgroundColor = .secondarySystemBackground
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	
	let loginButton: UIButton = {
		let button = UIButton()
		button.setTitle("Login", for: .normal)
		button.backgroundColor = UIColor.systemBlue
		button.layer.cornerRadius = 10
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	@objc func loginButtonAction() {
		if let email = loginTextField.text, let password = passwordTextField.text {
			let request = LoginModels.Request(login: email, password: password)
			interactor?.tryToLogin(request: request)
		}
	}
	
	// MARK: View lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	// MARK: Setup
	
	func setup() {
		[loginTextField, passwordTextField, loginButton].forEach { view.addSubview($0)}
		view.backgroundColor = .systemBackground
		loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
		setupConstraints()
	}
	
	// MARK: Setup Constraints
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -40),
			loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
			loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
			loginTextField.heightAnchor.constraint(equalToConstant: 40),
			
			passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
			passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
			passwordTextField.heightAnchor.constraint(equalToConstant: 40),
			
			loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
			loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150),
			loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150),
			loginButton.heightAnchor.constraint(equalToConstant: 40),
		])
	}
}

// MARK: Input protocol

extension LoginViewController: ILoginDisplayLogicInput {
	func render(viewModel: LoginModels.ViewModel) {
		viewModel.success ? router?.showLoginSuccess() :
		router?.showLoginFailure(message: "Try another password please")
	}
}
