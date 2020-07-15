//
//  Extensions+UIViewController.swift
//  SimpleList
//
//  Created by Максон on 01.03.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showEmptyAlert(message: String?) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
    alert.addAction(ok)
    present(alert, animated: true)
  }
}
