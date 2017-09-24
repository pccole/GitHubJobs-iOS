//
//  SearchViewController.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
	
	private lazy var searchBarButtonItem: UIBarButtonItem = {
		let item = UIBarButtonItem(title: "Search", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.search))
		return item
	}()
	
	@IBOutlet weak var currentLocationButton: UIButton!
	@IBOutlet weak var locationTextField: UITextField!
	@IBOutlet weak var fullTimeSwitch: UISwitch!
	@IBOutlet weak var fullTimeLabel: UILabel!
	@IBOutlet weak var fullTimeContainerView: UIView!
	@IBOutlet weak var languageTextField: UITextField!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Search Jobs"
		Location.instance.delegate = self
		style()
		addTapGestures()
		navigationItem.rightBarButtonItem = searchBarButtonItem
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
	
	private func setKeyboardReturnType() {
		locationTextField.returnKeyType = .search
		languageTextField.returnKeyType = .search
	}
	
	private func addTapGestures() {
		addDismissKeyboardTapGesture()
		addFullTimeFieldTapGesture()
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
		fullTimeContainerView.addGestureRecognizer(tap)
	}
	
	@objc private func fullTimeFieldTapped() {
		fullTimeSwitch.setOn(!fullTimeSwitch.isOn, animated: true)
	}
	
	@IBAction func useCurrentLocationTapped(_ sender: UIButton) {
		Location.instance.getCurrentLocation()
	}
	
	@objc private func search() {
		guard let language = languageTextField.text,
			language.count > 0,
			let location = locationTextField.text,
			location.count > 0 else {
			let alert = UIAlertController(title: "Error", message: "Please fill in Language or Location", preferredStyle: .alert)
			Navigation.instance.present(alert)
			return
		}
		
	}
}

extension SearchViewController: LocationDelegate {
	func new(_ location: String) {
		locationTextField.text = location
	}
}
