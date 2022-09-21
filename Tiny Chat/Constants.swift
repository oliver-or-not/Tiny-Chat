//
//  Constants.swift
//  Tiny Chat
//
//  Created by Wonil Lee on 2022/09/15.
//

struct K {
	static let appName = "🐣Tiny Chat🐣"
	static let cellIdentifier = "ReusableCell"
	static let cellNibName = "MessageCell"
	static let registerSegue = "RegisterToChat"
	static let logInSegue = "LogInToChat"
	
	struct BrandColors {
		static let blue = "blue1"
		static let purple = "purple1"
		static let lightBlue = "lightBlue1"
		static let lightPurple = "lightPurple1"
	}
	
	struct FStore {
		static let collectionName = "messages"
		static let senderField = "sender"
		static let bodyField = "body"
		static let dateField = "date"
	}
}
