//
//  ChatViewController.swift
//  Tiny Chat
//
//  Created by Wonil Lee on 2022/09/13.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ChatViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var messageTextField: UITextField!
	
	var messages: [Message] = [
		Message(sender: "1@2.com", body: "hey"),
		Message(sender: "a@b.com", body: "good"),
		Message(sender: "1@2.com", body: "wow!")
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		tableView.delegate = self
		tableView.dataSource = self
		title = K.appName
		navigationItem.hidesBackButton = true
		
		tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: "ReusableCell")
	}
	
	@IBAction func logOutPressed(_ sender: UIBarButtonItem) {
		do {
			try Auth.auth().signOut()
			navigationController?.popToRootViewController(animated: true)
			
		} catch let signOutError as NSError {
			print("Error signing out: %@", signOutError)
		}
	}
	
}


extension ChatViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return messages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
		cell.textLabel?.text = messages[indexPath.row].body
		return cell
	}
	
	
}
//
//extension ChatViewController: UITableViewDelegate {
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		print(indexPath.row)
//	}
//}
