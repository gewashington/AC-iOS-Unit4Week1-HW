//
//  AppDelegate.swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by C4Q  on 12/14/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //User Defaults
        let userDefaults = UserDefaults.standard
        var savedCategory = ["savedCategory": "Travel" ]
        userDefaults.register(defaults: savedCategory)
        
        
        //source: https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = UIColor.black
        navigationBarAppearance.barTintColor = UIColor.black
        // change navigation item title color
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: UIFont(name: "Caviar Dreams", size: 30) ??
                UIFont.systemFont(ofSize: 30)]
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Caviar Dreams", size: 30) ?? UIFont.systemFont(ofSize: 30)]
        
        //        navigationBarAppearance.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Caviar Dreams", size: 16.0)!, NSAttributedStringKey.foregroundColor: UIColor.white]
        //        navigationBarAppearance
        
        //Change tab bar:
        //source: http://www.alphansotech.com/blogs/customize-tab-bar-ios-using-swift/
        //other way: https://peterwitham.com/swift-archives/how-to-change-the-ios-tab-bar-colors/ ; simpler but doesn't work!!!
        let tbController = self.window!.rootViewController as! UITabBarController
        tbController.tabBar.barTintColor = UIColor.black
        //come back to fix
        //        tbController.tabBar.unselectedItemTintColor = UIColor.gray
        //        tbController.tabBar.selectedItem?.badgeColor = UIColor.red
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

