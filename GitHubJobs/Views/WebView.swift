//
//  WebView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/25/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
