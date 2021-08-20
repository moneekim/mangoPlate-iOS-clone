//
//  LoginResponse.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

struct LoginResponse : Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : LoginResult
}

struct LoginResult : Decodable{
    var userIdx : Int?
    var jwt : String?
}
