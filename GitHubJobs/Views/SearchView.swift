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
    @Environment(\.presentationMode) var presentationMode
    
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
                        
                        .padding()
                        .background(NeomorphismView())
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.ghBlue)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: -5, y: -5)
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("SEARCH")
                            .font(Font(FontStyle.body.font!))
                            .foregroundColor(Color.white)
                    }
                    .padding()
                }
                                    
            }
//        .padding(EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 15))
            .background(NavigationConfigurator { nc in
                let appearance = UINavigationBarAppearance.defaultAppearance
                nc.navigationBar.standardAppearance = appearance
                nc.navigationBar.isTranslucent = false
                nc.navigationBar.prefersLargeTitles = false
            })
            .navigationBarTitle(Text("Query Terms"))
            .navigationBarItems(trailing: Button("Clear") {
                self.searchParameters.description = ""
                self.searchParameters.location = ""
            }
            .font(Font.system(size: 17)))
//            .background(Color.offWhite.edgesIgnoringSafeArea(.all))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func dismiss() -> Void {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(SearchParameters())
    }
}
