//
//  SceneDelegate.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
        let commands: [Command] = [
            ERCoordinatorCommand(windowScene: windowScene)
        ]
        
        commands.forEach {$0.execute() }
    }
}
