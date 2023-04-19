//
//  SpaceXGQL.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 19.04.23.
//

import Foundation
import Apollo

protocol SpaceGQLHandler {
    func queryRequest<T>(
        query: T,
        resultHandler: @escaping GraphQLResultHandler<T.Data>
    ) where T : GraphQLQuery
}

struct SpaceXGQL: SpaceGQLHandler {
    static let shared: SpaceXGQL = SpaceXGQL()
    private var client: ApolloClient
    
    private init() {
        let url: URL = URL(string: "https://spacex-production.up.railway.app")!
        client = ApolloClient(url: url)
    }
    
    // MARK: - SpaceGQLHandler
    
    func queryRequest<T>(
        query: T,
        resultHandler: @escaping GraphQLResultHandler<T.Data>
    ) where T : GraphQLQuery {
        client.fetch(query: query, resultHandler: resultHandler)
    }
}
