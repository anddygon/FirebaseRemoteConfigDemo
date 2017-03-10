//
//  FRC.swift
//  FirebaseRemoteConfigDemo
//
//  Created by xiaoP on 2017/3/10.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig

class FRC {
    
    static let shared = FRC()
    
    
    init() {
        setDefaultValues()
        fetchRemoteValues()
    }
    
    func setDefaultValues() {
        let defaults: [String: NSObject] = [
            "experiment" : 1 as NSObject
        ]
        FIRRemoteConfig.remoteConfig().setDefaults(defaults)
    }
    
    func fetchRemoteValues() {
        let fetchInterval: TimeInterval = 0
        FIRRemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchInterval) { (status: FIRRemoteConfigFetchStatus, error: Error?) in
            guard error == nil else {
                print("\(#function) error \(error!)")
                return
            }
        }
    }
    
    func intForKey(key: String) -> Int {
        FIRRemoteConfig.remoteConfig().value(forKey: key)
        
        return 1
    }
    
}

struct FRCKey {
    static let experiment = "experiment"
}
