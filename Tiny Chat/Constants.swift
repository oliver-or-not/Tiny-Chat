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
		static let purple = "BrandPurple"
		static let lightPurple = "BrandLightPurple"
		static let blue = "BrandBlue"
		static let lightBlue = "BrandLightBlue"
		
		struct FStore {
			static let collectionName = "messages"
			static let senderField = "sender"
			static let bodyField = "body"
			static let dateField = "date"
		}
	}
}
