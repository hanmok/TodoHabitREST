import Foundation
import Alamofire



class Service: NSObject {
    static let shared = Service()
    
    let baseUrl = "http://localhost:5000"
    
    let targetUrl = "http://localhost:5000/todos"
    // working code
    func getTodos(completion : @escaping (Result<[Todo2], Error>) -> ()) {
        //        guard let url = URL(string: "\(baseUrl)/todos") else { return }
        guard let url = URL(string: targetUrl) else { return }
        
        var fetchPostsRequest = URLRequest(url: url)
        fetchPostsRequest.httpMethod = "GET"
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
        //        guard let url = URL(string: "\(baseUrl)/todos") else {
        guard let url = URL(string: targetUrl) else {
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
    
    
    
    
    
    
    
    
    
    
        
        
        
        
        
        
        
        
        func createPost(title: String, onDate: String, completion: @escaping (Error?) -> ()) {
            guard let url = URL(string: "\(baseUrl)/todos") else { return }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            //        urlRequest.allHTTPHeaderFields = ["Content-Type" : "application/json"]
            
            
            let params = ["title": title, "onDate": onDate] as [String : Any]
            
            do {
                let data = try JSONSerialization.data(withJSONObject: params, options: .init())
                urlRequest.httpBody = data
                
                
                //            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                
                URLSession.shared.dataTask(with: urlRequest, completionHandler: { dataClosure, response, error in
                    
                    if error != nil {
                        print("error : \(String(describing: error))")
                    }
                    
                    if response != nil {
                        print("response: \(String(describing: response))")
                    }
                    print("data : \(String(describing: dataClosure))")
                })
                .resume()
            } catch {
                completion(error)
            }
        }
        
        
        func createPost2(title: String, onDate: String, completion: @escaping (Error?) -> ()) {
            guard let url = URL(string: "\(baseUrl)/todos") else { return }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
                    urlRequest.allHTTPHeaderFields = ["Content-Type" : "application/x-www-form-urlencoded"]
            
            
            let params = ["title": title, "onDate": onDate] as [String : Any]
            
            do {
                let data = try JSONSerialization.data(withJSONObject: params, options: .init())
                urlRequest.httpBody = data
                
                
                //            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                URLSession.shared.dataTask(with: urlRequest, completionHandler: { dataClosure, response, error in
                    
                    if error != nil {
                        print("error : \(String(describing: error))")
                    }
                    
                    if response != nil {
                        print("response: \(String(describing: response))")
                    }
                    print("data : \(String(describing: dataClosure))")
                })
                .resume()
            } catch {
                completion(error)
            }
        }
        
        
        //    func createTodo2(){
        //        guard let url = URL(string: "\(baseUrl)/todos") else { return }
        //
        //
        //
        //        let data : Data = " ansjd".data(using: .utf8)!
        //
        //
        //          var request : URLRequest = URLRequest(url: url)
        //          request.httpMethod = "POST"
        //          request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
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
        
        
        
        
        //    func requestPost(url: String, method: String, param:[ String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
        //        let sendData = try! JSONSerialization.data(withJSONObject: param, options: [])
        //
        //        guard let url = URL(string: url) else {
        //            print("cannot create URL")
        //            return
        //        }
        //
        //        var request = URLRequest(url: url)
        //        request.httpMethod = method
        //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //        request.httpBody = sendData
        //
        //        URLSession.shared.dataTask(with: request) { data, response, error in
        //            guard error == nil else {
        //                print("Error: error calling Get")
        //                print(error!)
        //                return
        //            }
        //            guard let data = data else {
        //                print("Error: Did not receive data")
        //                return
        //            }
        //            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
        //                print("Error: HTTP request failed")
        //                return
        //            }
        //            guard let output = try? JSONDecoder().decode(Todo2.self, from: data) else {
        //                print("Error: JSON Data Parsing failed")
        //                return
        //            }
        //
        //            completionHandler(true, output)
        //        }.resume()
        //    }
        
        
        
        func requestPost(completionHandler: @escaping (Bool) -> Void) {
            
            let param = ["title": "titleFromSwift", "onDate": "onDateFromSwift"] as [String : Any]
            let sendData = try! JSONSerialization.data(withJSONObject: param, options: [])
            guard let url = URL(string: "\(baseUrl)/todos") else { return }
            
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = sendData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("Error: error calling Get")
                    print(error!)
                    return
                }
                guard let data = data else {
                    print("Error: Did not receive data")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                    print("number: \(response)")
                    print("Error: HTTP request failed")
                    return
                }
                
                completionHandler(true)
            }.resume()
        }
        
        
        
        
        
        
        func fromStack() {
            let url = URL(string: "\(baseUrl)/todos")!
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            let parameters: [String: Any] = [
                "title": "swiftTest!!",
                "onDate": "swiftTestDate!!"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            } catch let error {
                print(error.localizedDescription)
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data,
                      let response = response as? HTTPURLResponse,
                      error == nil else {                                              // check for fundamental networking error
                    print("error", error ?? "Unknown error")
                    return
                }
                
                guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    return
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(responseString)")
            }
            
            task.resume()
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
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
        
        // only it works..
        func postTodoAF(onDate: String, title: String) {
            //        AF.request(<#T##convertible: URLConvertible##URLConvertible#>)
            //        AF.request(<#T##convertible: URLConvertible##URLConvertible#>)
            //        AF.request(<#T##convertible: URLRequestConvertible##URLRequestConvertible#>)
            //        AF.request(<#T##convertible: URLRequestConvertible##URLRequestConvertible#>, interceptor: <#T##RequestInterceptor?#>)
            
            
            //        AF.request(<#T##convertible: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Encodable?#>, encoder: <#T##ParameterEncoder#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
            
            
//            AF.request("\(baseUrl)/todos", method: .get, parameters: [:], encoding: URLEncoding.httpBody, headers: HTTPHeaders.init()).responseJSON { response in
//                print("addtodo, \(response)")
//                let data = String(data: response.data!, encoding: .utf8)
//
//                do {
//
//                }
//            }
            
            
            
            // original
            AF.request("\(baseUrl)/todos", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": onDate ]).responseJSON { response in
                print("addNote, \(response)")
            }
            
        }
    }

