//
//  AppDelegate.swift
//  FirebaseRemoteConfigDemo
//
//  Created by xiaoP on 2017/3/10.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        
        let i = FRC.shared.intForKey(key: .experiment)
        print("刚启动的i \(i)")
        
        let dict = FRC.shared.dictForKey(key: .test)
        print("获取的dict \(dict)")
        
        return true
    }

}

