//
//  APIHelper.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import Foundation
import Combine

final class APIHelper {
    
    struct ErrorResponse: Decodable, Error {
        let message: String
        let error: String?
        let statusCode: Int?
    }
    
    static let shared = APIHelper()

    private init() {}
    
    func request<T: Decodable>(
        endpoint: String,
        method: String = "GET",
        headers: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type,
        completion: @escaping (Result<T, ErrorResponse>) -> Void
    ) {

        let serverURL = "https://homelinkapi-production.up.railway.app" + endpoint
        
        guard let url = URL(string: serverURL) else {
            print("URL inválida: \(serverURL)")
            completion(.failure(ErrorResponse(message: "URL Inválida", error: nil, statusCode: nil)))
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
                        completion(.failure(ErrorResponse(message:error.localizedDescription, error: nil, statusCode: nil)))
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        print("Resposta Invalida")
                        completion(.failure(ErrorResponse(message: "Resposta Invalida", error: nil, statusCode: nil)))
                        return
                    }
                    
                    guard let data = data else {
                        print("Nenhum dado recebido")
                        completion(.failure(ErrorResponse(message: "Nenhum dado recebido", error: nil, statusCode: httpResponse.statusCode)))
                        return
                    }
                    
                    if(200...299).contains(httpResponse.statusCode) {
                        do {
                            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(decodedResponse))
                        } catch {
                            print("Erro ao decodificar a resposta: \(error)")
                            completion(.failure(ErrorResponse(message: "Erro ao decodificar a resposta", error: nil, statusCode: httpResponse.statusCode)))
                        }
                    } else {
                        do {
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                            completion(.failure(errorResponse))
                        } catch {
                            print("Erro ao decodificar o erro da API: \(error)")
                            completion(.failure(ErrorResponse(message: "Erro desconhecido", error: nil, statusCode: httpResponse.statusCode)))
                        }
                    }
                }
            }.resume()
        }
    }
}
