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
    var vcsArray = [UIViewController]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mountainVC = storyboard.instantiateViewController(withIdentifier: "mountainsVC") as! MountainsVC
        let spaceVC = storyboard.instantiateViewController(withIdentifier: "spaceVC") as! SpaceVC
        let oceanVC = storyboard.instantiateViewController(withIdentifier: "oceanVC") as! OceanVC
        vcsArray = [mountainVC, spaceVC,  oceanVC]
        
        
        return true
    }
    
    enum ShortcutType : String {
        case mountains = "mountains"
        case space = "space"
        case ocean = "ocean"
        
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVC = window?.rootViewController as! UINavigationController
            navVC.setViewControllers(vcsArray, animated: false)
            
            switch type {
            case ShortcutType.space.rawValue:
                navVC.popToViewController(vcsArray[1], animated: true)
                completionHandler(true)
            case ShortcutType.ocean.rawValue:
                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
            default:
                navVC.popToRootViewController(animated: true)
                completionHandler(true)
            }
        }
        
        completionHandler(false)
       
    }


}

