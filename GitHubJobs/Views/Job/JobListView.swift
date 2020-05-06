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
        List {
            ForEach(model.jobs) { (job: GithubJob) in
                ZStack {
                    NavigationLink(destination: JobDetailView(job: job)) {
                        EmptyView()
                    }
                    JobCellView(job: job)
                }
                .background(
                    Color.gitGray
                    .cornerRadius(15)
                    .shadow(radius: 5)
                )
                
                
            }
        }
        .navigationBarTitle("Github Jobs")
        .navigationBarItems(trailing:
            Button("Search") {
                self.isSearchViewPresented.toggle()
            }
            .foregroundColor(Color.white)
        )
        .sheet(isPresented: $isSearchViewPresented) {
                SearchView()
                    .environmentObject(self.searchParameters)
        }
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = JobViewModel()
        viewModel.getJobs()
        return JobListView().environmentObject(viewModel)
    }
}
