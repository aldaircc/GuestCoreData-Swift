//
//  Router.swift
//  GuestsCoreData
//
//  Created by Aldair Raul Cosetito Coral on 11/3/20.
//

import UIKit

protocol Router {
    var navigation: UINavigationController { get }
    var rootView: UIViewController? { get }
    func present(_ module: Showable)
    func push(_ module: Showable, animated: Bool, completion: (()-> Void)?)
    func pop(animated: Bool)
}
