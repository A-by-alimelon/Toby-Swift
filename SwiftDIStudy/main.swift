//
//  main.swift
//  SwiftDIStudy
//
//  Created by Welly on 2021/12/31.
//

import Foundation

let dao = UserDAO()

let user = User()
user.setID("whiteship")
user.setName("welly")
user.setPassword("password")

dao.add(user)

print("\(user.getId()) 등록 성공")

print("===========================")

let user2 = dao.get(id: user.getId())

print("name: \(user2.getName())")
print("password: \(user2.getPassword())")
print("\(user2.getId()) 조회 성공")


