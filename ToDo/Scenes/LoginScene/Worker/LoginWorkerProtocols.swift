//
//  LoginWorkerProtocols.swift
//  ToDo
//
//  Created by Alex Smith on 03.03.2023.
//

protocol ILoginWorker {
	func login(login: String, password: String) -> LoginDTO
}
