//
//  SignUpResponse.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

struct SignUpResponse : Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : SignUpResult
}

struct SignUpResult : Decodable{
    var userIdx : Int?
    var jwt : String?
}
