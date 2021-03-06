//
//  JobListView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import SwiftUI
import UIKit

struct JobListView: View {
    
    @EnvironmentObject var model: JobViewModel
    
    private var searchParameters = SearchParameters()
    
    @State private var isSearchViewPresented: Bool = false
    
    var body: some View {
        List(model) { (job) in
            ZStack {
                NavigationLink(destination: JobDetailView(job: job)) {
                    EmptyView()
                }
                JobCellView(job: job)
            }
            .background(
                NeomorphismView()
                .contextMenu {
                    Button(action:{
                        // Save to core data
                    }) {
                        HStack {
                            Text("Bookmark")                            
                            Image(systemName: "bookmark")
                        }
                    }
                }
            )
            .onAppear {
                self.model.onAppear(job: job)
            }
        }            
        .navigationBarTitle("Github Jobs")
        .navigationBarItems(trailing:
            Button(action: {
                self.isSearchViewPresented.toggle()
            }, label: {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
            })
        )
        .sheet(isPresented: $isSearchViewPresented) {
            SearchView().environmentObject(self.searchParameters)
        }
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(
                NeomorphismView()
            )
    }
}

struct NeoButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .background(
            Group {
                if configuration.isPressed {
                    NeomorphismView()
                } else {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.ghGray)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                }
            }
        )
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = JobViewModel()
        viewModel.getJobs()
        return JobListView().environmentObject(viewModel)
    }
}
