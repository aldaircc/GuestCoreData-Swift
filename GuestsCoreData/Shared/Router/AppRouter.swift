//
//  AppRouter.swift
//  GuestsCoreData
//
//  Created by Aldair Raul Cosetito Coral on 11/3/20.
//

import UIKit

class AppRouter: Router {
    var navigation: UINavigationController
    
    var rootView: UIViewController? {
        return navigation.viewControllers.first
    }
    
    var completions : [UIViewController: (()-> Void)]
    
    init(presenter: UINavigationController) {
        self.navigation = presenter
        self.completions = [:]
    }
    
    func toShowable() -> UIViewController {
        return navigation
    }
    
    func present(_ module: Showable) {
        self.navigation.present(module.toShowable(),
                                animated: true,
                                completion: nil)
    }
    
    func push(_ module: Showable, animated: Bool, completion: (() -> Void)?) {
        let controller = module.toShowable()
        
        guard controller is UINavigationController == false else{
            return
        }
        
        if let completion = completion {
            self.completions[controller] = completion
        }
        
        self.navigation.pushViewController(controller, animated: animated)
    }
    
    func pop(animated: Bool) {
        if let controller = self.navigation.popViewController(animated: animated) {
            runCompletion(controller: controller)
        }
    }
    
    func runCompletion(controller: UIViewController) {
        guard let completion = completions[controller] else {
            return
        }
        completion()
        self.completions.removeValue(forKey: controller)
    }
    
}
