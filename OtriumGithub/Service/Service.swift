//
//  Service.swift
//  OtriumGithub
//
//  Created by Nipun Ruwanpathirana on 2021-07-02.
//

import Foundation
import Apollo

class Service {
    private let baseUrl = Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    
    static let shared = Service()
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: baseUrl)!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                     endpointURL: url)
        return ApolloClient(networkTransport: transport, store: store)
    }()
}

class NetworkInterceptorProvider: LegacyInterceptorProvider {
    //Haven't added the network check since not required.
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        interceptors.insert(RequestLoggingInterceptor(), at: 1)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {
    private let token = Bundle.main.infoDictionary?["AUTH_TOKEN"] as? String ?? ""
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        
        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}

class RequestLoggingInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        
        Logger.log(.info, data: request)
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
