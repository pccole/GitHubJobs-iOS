//
//  Color+Extensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 5/5/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static let ghGrayLight = Color("gray-light")
    
    static let ghGray = Color("gray")
    
    static let ghGrayDark = Color("gray-dark")
    
    static let offWhite = Color(red: 217 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let background = Color("background")
    
    static let ghBlueLight = Color("blue-light")
    
    static let ghBlue = Color("blue")
    
    static let darkBackground = Color("dark-background")
}

extension UIColor {
    
    static let ghGrayLight = UIColor(named: "gray-light")!
    
    static let ghGray = UIColor(named: "gray")!
    
    static let offWhite = UIColor(red: 217 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1.0)
    
    static let background = UIColor(named: "background")!
    
    static let ghBlueLight = UIColor(named: "blue-light")!
    
    static let ghBlue = UIColor(named: "blue")!
}
