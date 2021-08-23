//
//  ProfileResponse.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/23.
//


struct ProfileResponse : Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : UserInfo?
}


struct UserInfo : Decodable{
    var userIdx : Int
    var userName : String
    var profImg : String
    var email : String
    var phoneNum : String
    var follower : Int
    var following : Int
    var reviews : Int
    var went : Int
    var photos : Int
    var wish : Int
    
    
    
}

