//
//  GuestsCoordinator.swift
//  GuestsCoreData
//
//  Created by Aldair Raul Cosetito Coral on 11/3/20.
//

import UIKit

class GuestsCoordinator: Coordinator {
    
    let presenter: Router //UINavigationController
    var guestsView: GuestsView?
    
    init(presenter: Router) {
        self.presenter = presenter
    }
    
    func start() {
        let guestsView = GuestsView()
        guestsView.title = "Guests List"
        self.presenter.push(guestsView.toShowable(),
                            animated: true,
                            completion: nil)
        self.guestsView = guestsView
    }
}
