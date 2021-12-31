//
//  User.swift
//  SwiftDIStudy
//
//  Created by Welly on 2021/12/31.
//

import Foundation

class User {
    private var id: String?
    private var name: String?
    private var password: String?
    
    func getId() -> String {
        return self.id ?? ""
    }
    
    func getName() -> String {
        return self.name ?? ""
    }
    
    func getPassword() -> String {
        return self.password ?? ""
    }
    
    func setID(_ id: String) {
        self.id = id
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func setPassword(_ pw: String) {
        self.password = pw
    }
}
