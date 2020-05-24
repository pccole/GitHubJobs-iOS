//
//  Network.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/25/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import Combine

class Network {
    static let shared = Network()
    
    private init() { }
    
    func getJobs<T: Decodable>(paramaters: SearchParameters, decode: T.Type) -> AnyPublisher<T, Error> {
        /*
         Try large/prefetch with allowsConstrainedNetworkAccess = true : allows use of low data network
         let config = URLSessionConfiguration()
         config.allowsConstrainedNetworkAccess = false
         */
        let url = "https://jobs.github.com/positions.json"
        var components = URLComponents(string: url)!
        components.queryItems = paramaters.queryItems()
        let request = URLRequest(url: components.url!)
        let publisher =  URLSession.shared.dataTaskPublisher(for: request)
                            .map{ $0.data}
                            .decode(type: T.self, decoder: JSONDecoder.jobsDecoder)
                            .receive(on: RunLoop.main)
                            .eraseToAnyPublisher()
        return publisher
    }
}
