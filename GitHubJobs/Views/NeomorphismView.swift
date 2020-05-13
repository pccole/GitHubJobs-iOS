//
//  NeomorphismView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 5/12/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import SwiftUI

struct NeomorphismView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.offWhite)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
    }
}

struct NeomorphismView_Previews: PreviewProvider {
    static var previews: some View {
        NeomorphismView()
    }
}
