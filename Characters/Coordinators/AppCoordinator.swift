//
//  AppCoordinator.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds)) {
        self.window = window
    }
}

// MARK: - Initial Flow

extension AppCoordinator {
    func start() {
        let viewModel = CharacterListViewModel()
        let vc = CharacterListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: vc)
        setRootViewController(navigationController)
    }
}

// MARK: - Set Root View

extension AppCoordinator {
    private func setRootViewController(_ viewController: UIViewController, animated: Bool = true) {
        guard animated,
              window.rootViewController != nil
        else {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
}
