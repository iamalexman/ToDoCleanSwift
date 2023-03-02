//
//  LoginModels.swift
//  ToDo
//
//  Created by Alex Smith on 25.02.2023.
//

import Foundation

// MARK: Entity

enum LoginModels {
	struct Request {
		var login: String
		var password: String
	}
	struct Response {
		var success: Bool
		var login: String
		var lastLoginDate: Date
	}
	struct ViewModel {
		var success: Bool
		var userName: String
		var lastLoginDate: String
	}
}
