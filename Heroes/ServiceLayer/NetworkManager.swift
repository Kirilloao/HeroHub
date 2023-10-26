//
//  NetworkManager.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import Foundation

// MARK: - Enums
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum Links: String {
    case api = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.2.0/api/all.json"
}

// MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
    func fetchCharacters(with url: String, completion: @escaping (Result<[Hero], NetworkError>) -> Void)
    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void)
}

// MARK: - NetworkManager
final class NetworkManager: NetworkServiceProtocol {
    
    func fetchCharacters(with url: String, completion: @escaping (Result<[Hero], NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let characters = try decoder.decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characters))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }.resume()
    }
}



