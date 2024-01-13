//
//  SceneDelegate.swift
//  iOS12-HW11-Mikhailova-Olga
//
//  Created by mbpro2.0/16/512 on 11.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        self.window = window
        
        
        //window = UIWindow(windowScene: windowScene)
       // let viewController = ViewController()
       // window?.rootViewController = viewController
        
    }
}
