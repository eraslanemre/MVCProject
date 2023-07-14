//
//  NetworkService.swift
//  MVC
//
//  Created by Emre Eraslan on 14.07.2023.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() {
        
    }
    
   private var user: User?
    
    func login(username: String, password: String, completion:@escaping(Bool) -> Void){ DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if username == "eraslanemre" && password == "emre1234"{self.user = User(name:"Emre Eraslan",username:"eraslanemre",age: 23,address: Address(city: "Ankara", country: "Turkey"))
                    completion(true)
                }else{
                    self.user = nil
                    completion(false)
                }
            }
        }
    }
}
