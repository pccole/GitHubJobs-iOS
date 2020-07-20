//
//  TabBarView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 7/16/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            JobListView()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
