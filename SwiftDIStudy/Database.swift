//
//  Database.swift
//  SwiftDIStudy
//
//  Created by Welly on 2021/12/31.
//

import Foundation

struct UserEntity {
    let id: String
    let name: String
    let password: String
}

class Database {
    static let shard = Database()
    
    var users = [UserEntity]()
    
    private init() {}
    
    func insert(_ userDict: [String: String]) {
        let user = UserEntity(id: userDict["id"]!, name: userDict["name"]!, password: userDict["password"]!)
        
        self.users.append(user)
    }
    
    func read(_ id: String) -> UserEntity? {
        for user in users {
            if user.id == id {
                return user
            }
        }
        return nil
    }
    
}
