//
//  Location.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/20/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

protocol LocationDelegate {
	func new(_ location:String)
}

class Location: NSObject, CLLocationManagerDelegate {
	
	static let instance = Location()
	private lazy var locationManager: CLLocationManager = {
		let manager = CLLocationManager()
		manager.delegate = self
		return manager
	}()
	private let geoCoder:CLGeocoder = CLGeocoder()
	var currentLocation:CLLocation?
	var delegate:LocationDelegate?
	
	private override init() {
		super.init()
		locationManager.delegate = self
	}
	
	func getCurrentLocation() {
		switch CLLocationManager.authorizationStatus() {
		case .notDetermined, .restricted, .denied:
			locationManager.requestWhenInUseAuthorization()
		case .authorizedAlways, .authorizedWhenInUse:
			locationManager.requestLocation()
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		currentLocation = locations.first
		guard let location = currentLocation else { return }
		manager.stopUpdatingLocation()
		geoCoder.reverseGeocodeLocation(location) { (placemark:[CLPlacemark]?, error:Error?) in
			guard let mark = placemark?.first,
				let dict = mark.addressDictionary,
				let city = dict["City"] as? String else {
					return
			}
			self.delegate?.new(city)
		}
	}
}
