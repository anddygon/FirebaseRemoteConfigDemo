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
    let fetchInterval: TimeInterval
    static let shared = FRC()
    
    
    init() {
        #if DEBUG
            fetchInterval = 30
            if let debugSetting = FIRRemoteConfigSettings(developerModeEnabled: true) {
                FIRRemoteConfig.remoteConfig().configSettings = debugSetting
            }
        #else
            fetchInterval = 30 * 60
        #endif
        FIRRemoteConfig.remoteConfig().activateFetched()
        setDefaultValues()
        fetchRemoteValues()
    }
    
    func setDefaultValues() {
        let defaults: [String: NSObject] = [
            "experiment" : 1 as NSObject,
            "test": "" as NSObject
        ]
        FIRRemoteConfig.remoteConfig().setDefaults(defaults)
    }
    
    func fetchRemoteValues() {
        FIRRemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchInterval) { (status: FIRRemoteConfigFetchStatus, error: Error?) in
            guard error == nil else {
                print("\(#function) error \(error!)")
                return
            }
            
            print("===========拉取 Firebase Remote Config 数据完成===========")
        }
    }
    
    func intForKey(key: FRCKey) -> Int? {
        let i = FIRRemoteConfig.remoteConfig().configValue(forKey: key.rawValue).numberValue?.intValue
        return i
    }
    
    func dictForKey(key: FRCKey) -> [String: Any]? {
        let string = FIRRemoteConfig.remoteConfig().configValue(forKey: key.rawValue).stringValue
        return string?.toDictionary()
    }
    
}

enum FRCKey: String {
    case experiment
    case test
}
