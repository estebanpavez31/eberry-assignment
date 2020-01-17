//
//  Extensions.swift
//  EberryAssignment
//
//  Class with functinos that extend the class itself, to add new funciontalities
//
//  Created by Esteban Pavez on 2020-01-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Hide the keyboard when the user taps outside of it
    func hideKeyboardWhenTappedAround() -> UITapGestureRecognizer? {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        return tap
    }

    /// Hides the keyboard manually
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
