//
//  AppDelegate.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private(set) var appCoordinator: AppCoordinator!
}

// MARK: - App Launch

extension AppDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        appCoordinator = AppCoordinator()
        Env = .productionEnvironment
        configureNavigationBar()
        appCoordinator.start()
        return true
    }
}

// MARK: - Navigation Bar

extension AppDelegate {
    private func configureNavigationBar() {
        let navigationBarAppearance = UINavigationBar.appearance()
        let largeTitleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.palette(.primaryTextColour),
        ]
        navigationBarAppearance.largeTitleTextAttributes = largeTitleAttributes
        navigationBarAppearance.barTintColor = .palette(.backgroundColour)
        
        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.palette(.primaryTextColour)
        ]
        navigationBarAppearance.titleTextAttributes = titleTextAttributes
    }
}
