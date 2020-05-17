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
            VStack(alignment: .leading, spacing: 25) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(Font.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(Color.black)
                    TextField("python, ruby, android, ios", text: $searchParameters.description)
                        .font(Font(FontStyle.body.font!))
                        .padding()
                        .background(NeomorphismView())
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Location")
                        .font(Font.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(Color.black)
                    
                    TextField("New York, 27344", text: $searchParameters.location)
                        .padding()
                        .background(NeomorphismView())                    
                }
                
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("SEARCH")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font(FontStyle.body.font!))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.ghGrayDark)
                                .shadow(color: Color.black, radius: 5)
                        )
                }
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
            .background(NavigationConfigurator { nc in
                let appearance = UINavigationBarAppearance.defaultAppearance
                nc.navigationBar.standardAppearance = appearance
                nc.navigationBar.isTranslucent = false
                nc.navigationBar.prefersLargeTitles = false
            })
                .background(Color.offWhite.edgesIgnoringSafeArea(.all))
            .navigationBarTitle(Text("Query Terms"))
            .navigationBarItems(trailing: Button("Clear") {
                self.searchParameters.description = ""
                self.searchParameters.location = ""
            }
            .font(Font.system(size: 17)))
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
