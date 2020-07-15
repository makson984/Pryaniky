//
//  TextCell.swift
//  Pryaniky
//
//  Created by Максон on 14.07.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell, NibLoadable {
  
  @IBOutlet private weak var label: UILabel!
  
  func set(text: String?) {
    label.text = text
  }
}
