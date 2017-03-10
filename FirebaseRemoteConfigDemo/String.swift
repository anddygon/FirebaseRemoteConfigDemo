//
//  String.swift
//  FirebaseRemoteConfigDemo
//
//  Created by xiaoP on 2017/3/10.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import Foundation

extension String {
    
    func toDictionary() -> [String : Any]? {
        guard let data = self.data(using: .utf8) else {
            print("\(self) 转为data失败")
            return nil
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
            return json
        } catch let error {
            print(error)
            return nil
        }
    }
    
}
