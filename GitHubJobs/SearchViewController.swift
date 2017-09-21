//
//  SearchViewController.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
	
	@IBOutlet weak var currentLocationButton: UIButton!
	@IBOutlet weak var locationTextField: UITextField!
	@IBOutlet weak var fullTimeSwitch: UISwitch!
	@IBOutlet weak var fullTimeLabel: UILabel!
	@IBOutlet weak var fullTimeContainerView: UIView!
	@IBOutlet weak var languageTextField: UITextField!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Search Jobs"
		style()
		addDismissKeyboardTapGesture()
	}
	
	private func style() {
		view.backgroundColor = Color.grayLight
		styleFullTimeField()
		styleCurrentLocationField()
		styleLanguageAndLocationTextColor()
	}
	
	private func styleLanguageAndLocationTextColor() {
		languageTextField.textColor = Color.blue
		locationTextField.textColor = Color.blue
	}
	
	private func styleCurrentLocationField() {
		currentLocationButton.backgroundColor = UIColor.white
		currentLocationButton.setTitleColor(Color.blue, for: .normal)
		currentLocationButton.layer.cornerRadius = 5
	}
	
	private func styleFullTimeField() {
		fullTimeSwitch.onTintColor = Color.blue
		fullTimeSwitch.backgroundColor = Color.gray
		fullTimeSwitch.layer.cornerRadius = fullTimeSwitch.frame.height / 2
		fullTimeLabel.textColor = Color.blue
		fullTimeContainerView.backgroundColor = UIColor.white
		fullTimeContainerView.layer.cornerRadius = 5
	}
	
	private func addDismissKeyboardTapGesture() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
		view.addGestureRecognizer(tap)
	}
	
	@objc private func endEditing() {
		view.endEditing(true)
	}
	
	private func addFullTimeFieldTapGesture() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(fullTimeFieldTapped))
		view.addGestureRecognizer(tap)
	}
	
	@objc private func fullTimeFieldTapped() {
		fullTimeSwitch.isOn = !fullTimeSwitch.isOn
	}
	
	@IBAction func useCurrentLocationTapped(_ sender: UIButton) {
		
	}
	
}
