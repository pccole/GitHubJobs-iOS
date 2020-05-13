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
                Section(header:
                    Text("Description")
                        .font(Font.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(Color.black)
                ) {
                    TextField("python, ruby, android, ios", text: $searchParameters.description)
                        .font(Font(FontStyle.body.font!))
                        .padding()
                        .background(NeomorphismView())
                }
                Section(header:
                    Text("Location")
                        .font(Font.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(Color.black)
                ) {
                    TextField("New York, 27344", text: $searchParameters.location)
                        .font(Font(FontStyle.body.font!))
                        .padding()
                        .background(NeomorphismView())
                }
            }
            .background(NavigationConfigurator { nc in
                nc.navigationBar.standardAppearance = UINavigationBarAppearance.defaultAppearance
                nc.navigationBar.isTranslucent = true
                nc.navigationBar.backgroundColor = UIColor.ghBlue
            })
            .navigationBarTitle(Text("Search"))
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(SearchParameters())
    }
}
