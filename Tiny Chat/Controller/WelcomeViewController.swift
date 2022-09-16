//
//  ViewController.swift
//  Tiny Chat
//
//  Created by Wonil Lee on 2022/09/12.
//  Hi!

import UIKit

class WelcomeViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		titleLabel.text = K.appName
		
	}
	
	
}

