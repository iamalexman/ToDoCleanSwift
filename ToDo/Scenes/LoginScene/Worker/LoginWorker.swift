//
//  LoginWorker.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

import Foundation

public struct LoginDTO {
	var success: Bool
	var login: String
	var lastLoginDate: Date
}

final class LoginWorker: ILoginWorker {
	
	func login(login: String, password: String) -> LoginDTO {
		if login == "123" && password == "123" {
			return LoginDTO(
				success: true,
				login: login,
				lastLoginDate: Date()
			)
		} else {
			return LoginDTO(
				success: false,
				login: login,
				lastLoginDate: Date()
			)
		}
	}
}
