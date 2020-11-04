//
//  Showable.swift
//  GuestsCoreData
//
//  Created by Aldair Raul Cosetito Coral on 11/3/20.
//

import UIKit

protocol Showable {
    func toShowable() -> UIViewController
}

extension UIViewController: Showable {
    func toShowable() -> UIViewController {
        return self
    }
}
