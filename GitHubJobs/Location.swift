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

class Location: NSObject, CLLocationManagerDelegate {
	
	static let instance = Location()
	private let locationManager = CLLocationManager()
	var currentLocation:CLLocation?
	
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
	}
}
