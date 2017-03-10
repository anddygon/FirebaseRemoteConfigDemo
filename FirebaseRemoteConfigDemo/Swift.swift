//
//  Swift.swift
//  FirebaseRemoteConfigDemo
//
//  Created by xiaoP on 2017/3/10.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import Foundation

//func print(items: Any..., separator: String = "", terminator: String = "\n") {
//    #if DEBUG
//        Swift.print(["\(#file)_\(#line)_\(#function): "] + items, separator: separator, terminator: terminator)
//    #endif
//}

func print(_ items: Any..., separator: String = " | ", terminator: String = "\n") {
    #if DEBUG
        Swift.print(items, separator: separator, terminator: terminator)
    #endif
}
