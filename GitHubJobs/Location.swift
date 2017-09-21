//
//  Location.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/20/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
	
	private let locationManager = CLLocationManager()
	
	func getCurrentLocation() {
		switch CLLocationManager.authorizationStatus() {
		case .notDetermined, .restricted, .denied:
			break
		case .authorizedAlways, .authorizedWhenInUse:
			break
		}
	}
}
