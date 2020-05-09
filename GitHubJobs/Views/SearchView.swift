//
//  SearchView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/24/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var searchParameters: SearchParameters
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Description")) {
                    TextField("python, ruby, android, ios", text: $searchParameters.description)
                }
                Section(header: Text("Location")) {
                    TextField("New York, 27344", text: $searchParameters.location)
                }
            }
            .background(NavigationConfigurator { nc in
                nc.navigationBar.backgroundColor = UIColor.blue
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
