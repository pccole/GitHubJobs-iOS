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
    
    @State private var showDetail = false
    
    init() {
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
    
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
                    RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gitGray)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                )
            
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

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gitGray)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
            )
    }
}

struct NeoButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .background(
            Group {
                if configuration.isPressed {
                    RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gitGray)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                } else {
                    RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gitGray)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 10, y: 10)
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
