//
//  UserDAO.swift
//  SwiftDIStudy
//
//  Created by Welly on 2021/12/31.
//

import Foundation

class Connection {
    var db: Database?
    
    func getConnection() {
        self.db = Database.shard
    }
    
    func prepareStatement() -> PreparedStatement {
        let preparedStatement = PreparedStatement(connection: self)
        return preparedStatement
    }
    
    func close() {
        self.db = nil
    }
}

// user에 대한 preparedStatement
class PreparedStatement {
    var userDict = [String: String]()
    var connection: Connection?
    
    init(connection: Connection) {
        self.connection = connection
    }
    
    func setString(_ key: String, _ value: String) {
        self.userDict[key] = value
    }
    
    func executeUpdate() {
        self.connection?.db?.insert(self.userDict)
    }
    
    func executeQuery() -> [String: String] {
        let userEntity: UserEntity? = self.connection?.db?.read(userDict["id"]!)
        var dict = [String: String]()
        
        dict["id"] = userEntity?.id
        dict["name"] = userEntity?.name
        dict["password"] = userEntity?.password
        
        return dict
    }
    
    func close() {
        self.connection = nil
    }
}

class UserDAO {
    func add(_ user: User) {
        let c = Connection()
        c.getConnection()
        
        let ps = c.prepareStatement()
        ps.setString("id", user.getId())
        ps.setString("name", user.getName())
        ps.setString("password", user.getPassword())
        
        ps.executeUpdate()
        
        ps.close()
        c.close()
    }
    
    func get(id: String) -> User {
        let c = Connection()
        c.getConnection()
        
        let ps = c.prepareStatement()
        ps.setString("id", id)
        
        let result = ps.executeQuery()
        
        let user = User()
        user.setID(result["id"]!)
        user.setName(result["name"]!)
        user.setPassword(result["password"]!)
        
        ps.close()
        c.close()
        
        return user
    }
}
