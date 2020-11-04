//
//  AppCoordinator.swift
//  GuestsCoreData
//
//  Created by Aldair Raul Cosetito Coral on 11/3/20.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let navigation: UINavigationController
    let appRouter: AppRouter
    
    init(window: UIWindow) {
        self.window = window
        self.navigation = UINavigationController()
        self.appRouter = AppRouter.init(presenter: navigation)
    }
    
    func start() {
        window.makeKeyAndVisible()
        window.rootViewController = appRouter.toShowable()
        let guestCoordinator = GuestsCoordinator(presenter: appRouter)
        guestCoordinator.start()
    }
}
