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
    static let grayLight = Color("gray-light")
    
    static let gitGray = Color("gray")
    
    static let offWhite = Color(red: 217 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let background = Color("background")
}

extension UIColor {
    
    static let grayLight = UIColor(named: "gray-light")!
    
    static let gitGray = UIColor(named: "gray")!
    
    static let offWhite = UIColor(red: 217 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1.0)
    
    static let background = UIColor(named: "background")!
}
