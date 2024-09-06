//
//  APIHelper.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import Foundation
import Combine

final class APIHelper {
    
    static let shared = APIHelper()

    private init() {}
    
    func request<T: Decodable>(
        endpoint: String,
        method: String = "GET",
        headers: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {

        let serverURL = "https://homelinkapi-production.up.railway.app" + endpoint
        
        guard let url = URL(string: serverURL) else {
            print("URL inválida: \(serverURL)")
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.timeoutInterval = 30
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("Erro na requisição: \(error)")
                        completion(.failure(error))
                        return
                    }
                    
                    guard let data = data else {
                        print("Nenhum dado recebido")
                        completion(.failure(NSError(domain: "NoData", code: -1, userInfo: nil)))
                        return
                    }
                    
                    do {
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedResponse))
                    } catch {
                        print("Erro ao decodificar a resposta: \(error)")
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }
}
