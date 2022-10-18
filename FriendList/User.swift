//
//  User.swift
//  FriendList
//
//  Created by Mohamed Hany on 13/10/2022.
//

import Foundation

struct User: Codable, Identifiable{
    let id: String
    let isActive: Bool
    let name:String
    let age:Int
    let company:String
    let email:String
    let address:String
    let about:String
    let registered:String
    let tags:[String]
    let friends:[Friend]
}
