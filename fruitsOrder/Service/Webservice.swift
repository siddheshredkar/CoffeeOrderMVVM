//
//  Webservice.swift
//  fruitsOrder
//
//  Created by Siddhesh Redkar on 2020-04-24.
//  Copyright © 2020 Siddhesh Redkar. All rights reserved.
//

import Foundation



enum NetorkError:Error{
    
    case domainError
    case decodingError
}


enum HttpMethod:String{
    case get = "GET"
    case post = "POST"
}


struct Resourse<T:Codable> {
    let url:URL
    var htttpMethod: HttpMethod = .get
    var body: Data? = nil
    
}


extension Resourse {
    
    init(url:URL) {
        self.url = url
    }
}


class Webservice {
    
    
    
    func load<T>(resourse:Resourse<T>,completion: @escaping (Result<T ,NetorkError>) -> Void ) {
        
        
        var request = URLRequest(url: resourse.url)
        request.httpMethod = resourse.htttpMethod.rawValue
        request.httpBody = resourse.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, responce, error) in
            
           guard let data = data,error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            
           let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result{
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }else{
                completion(.failure(.decodingError))

            }
            
        }.resume()
        
    }
    
    
    
    
    
}
