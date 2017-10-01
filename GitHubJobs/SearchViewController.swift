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
	@IBOutlet weak var descriptionTextField: UITextField!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "GitHub Jobs"
		Location.instance.delegate = self
		style()
		addTapGestures()
		navigationItem.rightBarButtonItem = searchBarButtonItem
	}
	
	private func style() {
		view.backgroundColor = Color.grayLight
		styleFullTimeField()
		styleCurrentLocationField()
		styledescriptionAndLocationTextColor()
	}
	
	private func styledescriptionAndLocationTextColor() {
		descriptionTextField.textColor = Color.blue
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
		descriptionTextField.returnKeyType = .search
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
		guard let description = descriptionTextField.text,
			description.count > 0,
			let location = locationTextField.text,
			location.count > 0 else {
				let alert = UIAlertController(title: "Error", message: "Please fill in Description or Location", preferredStyle: .alert)
				let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
				alert.addAction(okAction)
				Navigation.instance.present(alert)
				return
		}
		let search = JobSearch(description: description, location: location, latitude: nil, longitude: nil, fullTime: fullTimeSwitch.isOn)
		JobData.instance.getJobs(data: search) { (jobs:[Job]?) in
			guard let jobs = jobs else {
				let alert = UIAlertController(title: "No Jobs Found", message: nil, preferredStyle: .alert)
				let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
				alert.addAction(okAction)
				Navigation.instance.present(alert)
				return
			}
			let jobVC = JobsViewController(jobs: jobs)
			Navigation.instance.push(jobVC)
		}
	}
}

extension SearchViewController: LocationDelegate {
	func new(_ location: String) {
		locationTextField.text = location
	}
}
