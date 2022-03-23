//
//  AppDelegate.swift
//  SampleApp
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let contactList = ContactListConfigurator()
        let navigation = UINavigationController(rootViewController: contactList.createModule())
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = navigation
        self.window = window
        
        return true
    }
    
}
