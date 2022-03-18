//
//  APITest.swift
//  TodoHabit
//
//  Created by Mac mini on 2022/03/18.
//

import Foundation

struct HttpMethodType {
    static let get = "GET"
    static let post = "POST"
    static let put = "PUT"
    static let patch = "PATCH"
    static let delete = "DELETE"
}

class APITest {
    
    static let shared = APITest()
    
    let baseUrl = "http://localhost:5001"
    let targetUrl = "http://localhost:5001/todos"
    
    
    // MARK: - GET
    func getOneTodo(id: String, completion: @escaping (Result<Todo2, Error>) -> Void ) {
        let url = "\(baseUrl)/\(id)"
        guard let URL = URL(string: url) else { return }

        var urlReq = URLRequest(url: URL)
        
        urlReq.httpMethod = HttpMethodType.get
        
        let task = URLSession.shared.dataTask(with: urlReq) { data, response, error in
            
            if let err = error {
                print("error: \(err)")
                return
                
            }
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    let todo = try JSONDecoder().decode(Todo2.self, from: data)
                    completion(.success(todo))
                } catch {
                    print("error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func getAllTodos(completion: @escaping (Result<[Todo2], Error>) -> Void ) {
        let url = "\(targetUrl)"
        guard let URL = URL(string: url) else { return }
        var urlReq = URLRequest(url: URL)
        
        urlReq.httpMethod = HttpMethodType.get
        
        let task = URLSession.shared.dataTask(with: urlReq) { data, response, error in
            if let e = error {
                print("error: \(e)")
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    // json object sent from the server.
                    let todos = try JSONDecoder().decode([Todo2].self, from: data)
                    print("todos: \(todos)")
                    completion(.success(todos))
                } catch {
                    print("error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    // MARK: - POST
    
    func postOneTodo(title: String, onDate: String) {
        print("my func triggered")
//        let url = "\(targetUrl)/"
        let url = "http://localhost:5001/todos/"
        guard let URL = URL(string: url) else { return }
        var urlReq = URLRequest(url: URL)
        
        let json: [String: Any] = ["title": title, "onDate": onDate]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
//        if jsonData != nil {
//            let decoded = try? JSONDecoder().decode(Todo2.self, from: jsonData!)
//            print("decoded: \(decoded)") // works fine.
//        } else {
//            print("jsonData is nil")
//        } // 여기까지는 정상..

//        let data : Data = "title=\(title)&onDate=\(onDate)".data(using: .utf8)!
        urlReq.httpMethod = HttpMethodType.post
        urlReq.httpBody = jsonData
//        urlReq.httpBody = data

//        urlReq.headers = .init()
//        urlReq.allHTTPHeaderFields =
//        urlReq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlReq.addValue("keep-alive", forHTTPHeaderField: "Connection")
//        urlReq.addValue("Content-Length", forHTTPHeaderField: "<calculated when request is sent>")
//        urlReq.addValue("Host", forHTTPHeaderField: "<calculated when request is sent>")
//        urlReq.addValue("keep-alive", forHTTPHeaderField: "Connection")
//        urlReq.addValue("keep-alive", forHTTPHeaderField: "Connection")
        
// header, ?
        
        let task = URLSession.shared.dataTask(with: urlReq) { data, response, error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            // code : 201
            let responseJSON = try? JSONDecoder().decode(Todo2.self, from: data)
            
            print("responseJSON : \(responseJSON)")
            
        }.resume()
    }
    
//    func patchOntTodo(id: String, completion: @escaping (Error?) -> Void ) {
//        let url = "\(baseUrl)/\(id)"
//        guard let URL = URL(string: url) else {return }
//        var urlReq = URLRequest(url: URL)
//        urlReq.htt
//    }
    
    // works !
    func deleteOneTodo(id: String, completion: @escaping (Error?) -> Void) {
        let url = "\(targetUrl)/\(id)"
        guard let URL = URL(string: url) else { return }
        var urlReq = URLRequest(url: URL)

        urlReq.httpMethod = HttpMethodType.delete

        let task = URLSession.shared.dataTask(with: urlReq) { data, response, error in

            guard error == nil else {
                print("error : \(error?.localizedDescription)")
                completion(error)
                return
            }

            completion(nil)

        }.resume()
    }
    
    // works fine !
    func deleteAllTodos() {
        
        let url = "\(targetUrl)"
        guard let URL = URL(string: url) else { return }
        var urlReq = URLRequest(url: URL)
        urlReq.httpMethod = HttpMethodType.delete
        
        let task = URLSession.shared.dataTask(with: urlReq) { data, response, error in
            guard error == nil else { print("error!! : \(error)"); return }
            
            print("response: \(response)")
        }.resume()
    }
    
    func patchOneTodo() {
        Service.shared.patchOne(id: "614b4bf15b7fb541813e79b7", newTitle: "this is new title From Swift!", newOnDate: "new Date From Swift!!")
    }
}

// post, and patch left..
