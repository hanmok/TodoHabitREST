////
////  Availables.swift
////  TodoHabit
////
////  Created by Mac mini on 2022/03/18.
////
//
//import Foundation
//import Alamofire
//
////@objc func getOneBtnPressed() {
//func getOne() {
//    AF.request("http://localhost:5001/todos/614b423a799255beccc10a40").response { response in
//        let newData = String(data: response.data!, encoding: .utf8)
//
//        do {
//            let newTodo = try JSONDecoder().decode(Todo2.self, from: newData!.data(using: .utf8)!)
//            //                self.todos.append(newTodo)
//            //                self.todos.append(newTodo)
//            print("newTodo : \(newTodo)")
//        } catch {
//            print("failed to decode!")
//        }
//        //            print("todo: \(self.todos)")
//        //            print("count :\(self.todos.count)")
//    }
//}
////}
//
////@objc func getAllBtnPressed() {
//func getAll() {
//    AF.request("http://localhost:5001/todos").response { response in
//        let newData = String(data: response.data!, encoding: .utf8)
//
//        do {
//            self.todos = try JSONDecoder().decode([Todo2].self, from: newData!.data(using: .utf8)!)
//        } catch {
//            print("failed to decode!")
//        }
//        print("todo: \(self.todos)")
//        print("todoCount :\(self.todos.count)")
//    }
//}
////}
//
////@objc func postBtnPressed() {
////    postOneTodo()
////    Service.shared.postTodoAF(onDate: "testOnDateSwift4", title: "testTitleSwift44")
//func postTodoAF(onDate: String, title: String) {
//    AF.request("\(baseUrl)/todos", method: .post, parameters: ["title": title, "onDate": onDate ], encoding: URLEncoding.httpBody, headers: HTTPHeaders.init()).responseJSON { response in
//        print("addtodo, \(response)")
//    }
//}
////}
//
//
////@objc func deleteOnePressed() {
////    deleteOneTodo()
//Service.shared.deleteOneTodo(id: "614b4fac5b7fb541813e79ec")
//func deleteTodoAF(id: String) {
//    AF.request(targetUrl + "/" + id, method: .delete,   headers: HTTPHeaders.init()).responseData { response in
//        print("response: \(response)")
//    }
//}
////}
//
////@objc func deleteAllPressed() {
////    deleteAllTodos()
////    Service.shared.deleteTodosAF()
//func deleteTodosAF() {
//    AF.request(targetUrl, method: .delete,   headers: HTTPHeaders.init()).responseData { response in
//        print("response: \(response)")
//    }
//}
//
//
////}
//
////@objc func patchBtnPressed() {
////    patchOneTodo()
//
////Service.shared.patchOne(id: "614b4bf15b7fb541813e79b7", newTitle: "this is new title From Swift!", newOnDate: "new Date From Swift!!")
//
//func patchOne(id: String, newTitle: String, newOnDate: String) {
//    AF.request("\(baseUrl)/todos/\(id)", method: .patch, parameters: ["title": newTitle, "onDate": newOnDate ], encoding: URLEncoding.httpBody, headers: HTTPHeaders.init()).responseJSON { response in
//        print("patchOne, \(response)")
//    }
//}
//
////}
