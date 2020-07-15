//
//  ImageCell.swift
//  Pryaniky
//
//  Created by Максон on 14.07.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell, NibLoadable {
  
  @IBOutlet private weak var icon: UIImageView!
  
  func setIcon(urlstring: String?) {
    icon.loadImage(urlString: urlstring)
  }
}
