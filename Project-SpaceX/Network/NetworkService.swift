//
//  NetworkService.swift
//  SpaceX-Project
//
//  Created by Umut Sever on 19.07.2021.
//

import Foundation

struct NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    func getPastLaunch(completion: @escaping(Result<[LaunchModel], Error>) -> Void) {
            request(route: .past, method: .get, completion: completion)
    }
    func getUpcomingLaunch(completion: @escaping(Result<[LaunchModel], Error>) -> Void) {
        request(route: .upcoming, method: .get, completion: completion)
    }
    func getRockets(completion: @escaping(Result<[RocketModel], Error>) -> Void) {
        request(route: .rocket, method: .get, completion: completion)
        
    }
   
    
     func request<T: Codable>(route: Route,
                         method: Method,
                         parameters: [String: Any]? = nil,
                         completion: @escaping(Result<T, Error>) -> Void) {
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                //let responseString = String(data: data, encoding: .utf8) ?? "Data could not be stringify"
                //print("The response is:\n\(responseString)")
            } else if let error = error {
                result = .failure(error)
                print(error.localizedDescription)
            }
           
            DispatchQueue.main.async {
                
                self.handleResponse(result: result, completion: completion)
            }
            
        }.resume()
        
    }
    
    
    private func handleResponse<T: Decodable> (result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        
        guard let result = result else {
            completion(.failure(AppError.errorDecoding))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(T.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            completion(.success(response))
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
     private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.routeDescription
        guard let url = URL(string: urlString) else { return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 60
        if let params = parameters {
            switch method {
            case .get:
                var urlComponents = URLComponents(string: urlString)
                urlComponents?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
            case .post, .patch, .delete:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
