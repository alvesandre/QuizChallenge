//
//  API.swift
//  QuizChallenge
//
//  Created by André Alves on 08/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

typealias QuestionCompletionBlock = (_ data: Question?, _ error: Error?) -> Void

enum HTTPMethod: String {
    case delete
    case get
    case patch
    case post
    case put
    
    var name: String {
        get {
            return self.rawValue.uppercased()
        }
    }
}

public class API: APIProtocol {
    let baseURL: String = "https://codechallenge.arctouch.com"
    
    static var shared: APIProtocol = API()
    
    // Endpoint: getQuestion
    // Description: Get question object
    // parameters:
    // - completionBlock: callback for async request. It can return an Question object or an Error object
    
    func getQuestion(completionBlock: @escaping QuestionCompletionBlock) {
        let components = URLComponents(string: baseURL + "/quiz/1")
        
        guard let componentsURL = components, let url = componentsURL.url else {
            return
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10000)
        urlRequest.httpMethod = HTTPMethod.get.name
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil, let dataResponse = data else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
                }
                do {
                    guard let responseJSON = try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [String: Any] else {
                        return
                    }
                    var question : Question?
                    
                    if let data = try? JSONSerialization.data(withJSONObject: responseJSON, options: []), let questionDecoded = try? JSONDecoder().decode(Question.self, from: data) {
                      question = questionDecoded
                    }
                    
                    completionBlock(question, nil)
                }
                catch {
                    completionBlock(nil, error)
                }
            }
        }
        task.resume()
        
    }
    
}
