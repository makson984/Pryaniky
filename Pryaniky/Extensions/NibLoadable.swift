//
//  NibLoadable.swift
//  SimpleList
//
//  Created by Максон on 18.02.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
  
  static var nib: UINib  { get }
  static var id : String { get }
}

extension NibLoadable {
  
  static var nib: UINib {
    return UINib(nibName: id, bundle: nil)
  }
  
  static var id: String {
    return String(describing: self)
  }
}
