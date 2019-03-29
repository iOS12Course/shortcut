//
//  AppDelegate.swift
//  shortCut
//
//  Created by Ricardo Herrera Petit on 3/28/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let oceanShortcut = UIMutableApplicationShortcutItem(type: "\(String(describing: Bundle.main.bundleIdentifier)).ocean", localizedTitle: "Ocean", localizedSubtitle: nil, icon: UIApplicationShortcutIcon.init(templateImageName: "OceanShort"), userInfo: nil)
        
        application.shortcutItems = [oceanShortcut]
        return true
    }
    
    enum ShortcutType : String {
        case mountains = "mountains"
        case space = "space"
        case ocean = "ocean"
        
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVC = window?.rootViewController as! UITabBarController
            
            switch type {
            case ShortcutType.space.rawValue:
                navVC.selectedIndex = 1
                completionHandler(true)
            case ShortcutType.ocean.rawValue:
                navVC.selectedIndex = 2
                completionHandler(true)
            default:
                navVC.selectedIndex = 0
                completionHandler(true)
            }
        }
        
        completionHandler(false)
       
    }


}

