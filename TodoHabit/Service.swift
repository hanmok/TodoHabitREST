import Foundation



class Service: NSObject {
    static let shared = Service()
    
    let baseUrl = "http://localhost:5000"
    
    // working code
    func fetchTodos(completion : @escaping (Result<[Todo2], Error>) -> ()) {
        guard let url = URL(string: "\(baseUrl)/todos") else { return }
        
        var fetchPostsRequest = URLRequest(url: url)
        fetchPostsRequest.httpMethod = "GET" // i added. doesn't matter for now. because The default HTTP method is “GET”.
        fetchPostsRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to fetch posts:", err)
                    return
                }
                guard let data = data else { return }
                do {
                    let todos = try JSONDecoder().decode([Todo2].self, from: data)
                    completion(.success(todos))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
     // not working code
    func requestGet( completionHandler: @escaping (Bool, Any) -> Void) {
        guard let url = URL(string: "\(baseUrl)/todos") else {
            print("cannot create url")
            return }
//        guard let url = URL(string: "www.google.com") else {
//            print("cannot create url")
//            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
//            print("data : \(data.)")
            guard let output = try? JSONDecoder().decode(Todo2.self, from: data) else {
//                print("output : \(output)")
                print("Error: JSON Data Parsing failed")
                return
            }
            
            completionHandler(true, output)
        }.resume()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func createPost(title: String, completion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "\(baseUrl)/todos") else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let params = ["title": title] as [String : Any]
        
        do {
//            let data = try JSONSerialization.data(withJSONObject: params, options: .init())
            let data = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.init())
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            URLSession.shared.dataTask(with: urlRequest) { (data, response, err) in
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }
    
//    func createTodo(){
//        guard let url = URL(string: "\(baseUrl)/todos") else { return }
//
//
////          let user1 = username.text!
////          let pass = passwordfield.text!
////          print(user1)
////          print(pass)
//
////          let data : Data = "username=\(user1)&password=\(pass)&grant_type=password".data(using: .utf8)!
//        let data = ["title": "swiftTest"]
//          var request : URLRequest = URLRequest(url: url)
//          request.httpMethod = "POST"
//          request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
////          request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
//          request.httpBody = data
//
//          print("one called")
//
//          let config = URLSessionConfiguration.default
//          let session = URLSession(configuration: config)
//          // vs let session = URLSession.shared
//            // make the request
//          let task = session.dataTask(with: request, completionHandler: {
//              (data, response, error) in
//
//               if let error = error
//              {
//                  print(error)
//              }
//               else if let response = response {
//                  print("her in resposne")
//
//              }else if let data = data
//               {
//                  print("here in data")
//                  print(data)
//              }
//
//              DispatchQueue.main.async { // Correct
//
//                  guard let responseData = data else {
//                      print("Error: did not receive data")
//                      return
//                  }
//
//                  let decoder = JSONDecoder()
//                  print(String(data: responseData, encoding: .utf8))
//                  do {
//                    //  let todo = try decoder.decode(T.self, from: responseData)
//                    //  NSAssertionHandler(.success(todo))
//                  } catch {
//                      print("error trying to convert data to JSON")
//                      //print(error)
//                    //  NSAssertionHandler(.failure(error))
//                  }
//              }
//          })
//          task.resume()
//
//
//      }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func deletePost(id: Int, completion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "http://localhost:1337/post/\(id)") else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, resp, err) in
            DispatchQueue.main.async {
                // check error
                if let err = err {
                    completion(err)
                    return
                }
                
                if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                    let errorString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                    completion(NSError(domain: "", code: resp.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]))
                    return
                }
                completion(nil)
            }
        }.resume()
    }

}
