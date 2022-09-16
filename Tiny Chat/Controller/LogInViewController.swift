//
//  LogInViewController.swift
//  Tiny Chat
//
//  Created by Wonil Lee on 2022/09/13.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LogInViewController: UIViewController {

	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	@IBAction func LogInPressed(_ sender: UIButton) {
		if let email = emailTextField.text, let password = passwordTextField.text {
			Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
				if let e = error {
					print(e.localizedDescription)
				} else {
					self.performSegue(withIdentifier: K.logInSegue, sender: self)
				}
			}
		}
	}
	
}
