//
//  UIFont+Extensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 5/3/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    
}

enum FontStyle {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption1
    case caption2
    
    var font: UIFont? {
        let sizeCategory = UITraitCollection.current.preferredContentSizeCategory
        switch sizeCategory {
        case .extraSmall, .small, .medium, .extraLarge, .extraExtraLarge, .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraLarge, .unspecified:
            return nil
        case .large:
            switch self {
            case .largeTitle, .body, .title1, .title2, .title3, .callout, .footnote, .caption1, .caption2:
                return UIFont(name: FontWeight.regular.rawValue, size: size)
            case .headline:
                return UIFont(name: FontWeight.bold.rawValue, size: size)
            case .subhead:
                return UIFont(name: FontWeight.semiBold.rawValue, size: size)
            }
        default:
            return nil
        }
    }
    
    var size: CGFloat {
        switch self {
        case .largeTitle:
            return 34
        case .title1:
            return 28
        case .title2:
            return 22
        case .title3:
            return 20
        case .headline, .body:
            return 17
        case .callout:
            return 16
        case .subhead:
            return 15
        case .footnote:
            return 13
        case .caption1:
            return 12
        case .caption2:
            return 11
        }
    }
    
    enum FontWeight: String {
        case bold = "OpenSans-Bold"
        case boldItalic = "OpenSans-BoldItalic"
        case extraBlod = "OpenSans-ExtraBold"
        case extraBlodItalic = "OpenSans-ExtraBoldItalic"
        case italic = "OpenSans-Italic"
        case light = "OpenSans-Light"
        case lightItalic = "OpenSans-LightItalic"
        case regular = "OpenSans-Regular"
        case semiBold = "OpenSans-SemiBold"
        case semiBoldItalic = "OpenSans-SemiBoldItalic"
    }
}
