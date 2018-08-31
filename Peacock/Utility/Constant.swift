//
//  Constant.swift
//  Imagine
//
//  Created by Mathivathani Murugesan on 28/11/17.
//  Copyright © 2017 Mathivathani Murugesan. All rights reserved.
//

import UIKit
typealias apiSuccess = (_ resultDict:NSDictionary) -> Void
typealias apiFailure = (_ resultDict:NSDictionary) -> Void
//Var constant
var DEVICE_TYPE = ""


//Type of phones
let iPhone5s = "iPhone5s"
let iPhoneX = "iPhoneX"
let iPhone6Pluse = "iPhone6Pluse"
let iPhone6 = "iPhone6"
let iPad = "ipad"

//MARK: MY Instance
struct MYCOLOR {
    static let BASE_RED = UIColor(red:0.88, green:0.38, blue:0.46, alpha:1.0)//#E06075
}
struct MYFONTS {
    // font names
    //["NeutraText-LightAlt", "NeutraText-BookAlt"]
    
    static let BOOK = "NeutraText-BookAlt"
    static let LIGHT = "NeutraText-LightAlt"
    static let BOLD = "AkkuratStd-Bold"
}

//MARK: API List
