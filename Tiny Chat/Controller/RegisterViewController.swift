//
//  RegisterViewController.swift
//  Tiny Chat
//
//  Created by Wonil Lee on 2022/09/13.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {

	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	@IBAction func registerPressed(_ sender: UIButton) {
		
		if let email = emailTextField.text, let password = passwordTextField.text {
			Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
				if let e = error {
					print(e.localizedDescription)
				} else {
					self.performSegue(withIdentifier: "RegisterToChat", sender: self)
				}
			}
		}
	}
	
}
