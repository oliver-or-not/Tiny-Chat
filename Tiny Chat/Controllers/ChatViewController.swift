//
//  ChatViewController.swift
//  Tiny Chat
//
//  Created by Wonil Lee on 2022/09/13.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var messageTextField: UITextField!
	
	let db = Firestore.firestore()
	
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
		
		loadMessages()
	}
	
	func loadMessages() {
		db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
			self.messages = []
			if let e = error {
				print("There was an issue retrieving data from Firestore. \(e)")
			} else {
				if let snapshotDocuments = querySnapshot?.documents {
					for doc in snapshotDocuments {
						let data = doc.data()
						if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
							let newMessage = Message(sender: messageSender, body: messageBody)
							self.messages.append(newMessage)
							DispatchQueue.main.async {
								self.tableView.reloadData()
								let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
								self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
							}
						}
						
					}
				}
			}
		}
		
	}
	
	
	@IBAction func logOutPressed(_ sender: UIBarButtonItem) {
		do {
			try Auth.auth().signOut()
			navigationController?.popToRootViewController(animated: true)
			
		} catch let signOutError as NSError {
			print("Error signing out: %@", signOutError)
		}
	}
	
	@IBAction func sendPressed(_ sender: UIButton) {
		if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
			db.collection(K.FStore.collectionName).addDocument(data: [
				K.FStore.senderField: messageSender,
				K.FStore.bodyField: messageBody,
				K.FStore.dateField: Date().timeIntervalSince1970
			]) {(error) in
				if let e = error {
					print("There was an issue saving data to firestore, \(e)")
				} else {
					print("Successfully saved data.")
					
					DispatchQueue.main.async {
						self.messageTextField.text = ""
					}
				}
			}
		}
		
	}
}


extension ChatViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return messages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let message = messages[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
		cell.label.text = messages[indexPath.row].body
		
		//This is a message from the current user
		if message.sender == Auth.auth().currentUser?.email {
			cell.leftImageView.isHidden = true
			cell.rightImageView.isHidden = false
			cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightBlue)
			cell.label.textColor = UIColor(named: K.BrandColors.blue)
		} else {
			cell.leftImageView.isHidden = false
			cell.rightImageView.isHidden = true
			cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.blue)
			cell.label.textColor = UIColor(named: K.BrandColors.lightBlue)
		}
		
		return cell
	}
	
	
}
//
//extension ChatViewController: UITableViewDelegate {
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		print(indexPath.row)
//	}
//}
