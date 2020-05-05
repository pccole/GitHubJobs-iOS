//
//  JobListView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import SwiftUI

struct JobListView: View {
    
    @EnvironmentObject var model: JobViewModel
    
    private var searchParameters = SearchParameters()
    
    @State private var isSearchViewPresented: Bool = false
    
    var body: some View {
        List {
            ForEach(model.jobs) { (job: GithubJob) in
                NavigationLink(destination: JobDetailView(job: job)) {
                    JobCellView(job: job)
                        .border(Color.red)
                }
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
