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
    
    var body: some View {
        
            List {
                ForEach(model.jobs) { (job: GithubJob) in
                    NavigationLink(destination: JobDetailView()) {
                        JobView(job: job)
                    }
                }
            }
            .navigationBarTitle("Github Jobs")
            .navigationBarItems(trailing:
                Button("Search") {
                
                }
                .foregroundColor(Color.white)
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
