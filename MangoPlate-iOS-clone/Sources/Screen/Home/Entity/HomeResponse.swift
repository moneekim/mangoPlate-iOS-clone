//
//  HomeResponse.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/21.
//

struct HomeResponse : Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : [HomeResult]?
}

struct HomeResult : Decodable{
    var restaurantIdx : Int
    var name : String
    var profImg : String?
    var rating : Float
    var location : String
    var views : Int
    var reviews : Int
}
