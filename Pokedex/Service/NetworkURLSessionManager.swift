//
//  NetworkManager.swift
//  Pokedex
//
//  Created by Consultant on 11/14/22.
//

import Foundation


class NetworkURLSessionManager {
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
}

extension NetworkURLSessionManager {
    
    func getResults(with urlStr: String, completion: @escaping (PageResults?) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            completion(nil)
            return
        }
        
        let task = self.session.dataTask(with: url) {data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let PageResults = try JSONDecoder().decode(PageResults.self, from: data)
                completion(PageResults)
                
            }catch {
                print(error)
                completion(nil)
            }
            
            
            
        }
        task.resume()
        
    }
    
    func fetchPageResults(with urlStr: String, completion: @escaping (Pokemon?) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            completion(nil)
            return
        }
        
        let task = self.session.dataTask(with: url) {data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let Pokemones = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(Pokemones)
                
            }catch {
                print(error)
                completion(nil)
            }
            
            
            
        }
        task.resume()
    }
    
    func fetchPageResults(with urlStr: String, completion: @escaping (Types?) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            completion(nil)
            return
        }
        
        let task = self.session.dataTask(with: url) {data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let Types = try JSONDecoder().decode(Types.self, from: data)
                completion(Types)
                
            }catch {
                print(error)
                completion(nil)
            }
            
            
            
        }
        task.resume()
    }
    
    func fetchPageResults(with urlStr: String, completion: @escaping (Sprites?) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            completion(nil)
            return
        }
        
        let task = self.session.dataTask(with: url) {data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let spriteTypes = try JSONDecoder().decode(Sprites.self, from: data)
                completion(spriteTypes)
                
            }catch {
                print(error)
                completion(nil)
            }
            
            
            
        }
        task.resume()
    }
    
    func fetchImageData(path: String, completion: @escaping (Data?) -> Void) {
        
        guard let url = URL(string: path) else{
            completion(nil)
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(nil)
                return
            }
            
            completion(data)
            
        }
        task.resume()
    }
}
