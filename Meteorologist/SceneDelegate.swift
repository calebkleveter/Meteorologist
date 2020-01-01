//
//  SceneDelegate.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 1/1/20.
//  Copyright © 2020 Caleb Kleveter. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

final class SceneDelegate: UIResponder, UISceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: MainView.start)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
