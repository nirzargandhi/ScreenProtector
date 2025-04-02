//
//  Constants.swift
//  ScreenProtectorDemo
//
//  Created by Nirzar Gandhi on 11/03/25.
//

import Foundation
import UIKit

let BASEWIDTH = 375.0
let SCREENSIZE: CGRect      = UIScreen.main.bounds
let SCREENWIDTH             = UIScreen.main.bounds.width
let SCREENHEIGHT            = UIScreen.main.bounds.height
let STATUSBARHEIGHT         = UIApplication.shared.statusBarFrame.size.height
var NAVBARHEIGHT            = 44.0
var TABBARHEIGHT            = 49.0
let MAINBUNDLE              = Bundle.main
let FILEMANAGER             = FileManager.default
let DOCUMENTS_URL           = FILEMANAGER.urls(for: .documentDirectory, in: .userDomainMask)[0]

let APPDELEOBJ              = UIApplication.shared.delegate as! AppDelegate
