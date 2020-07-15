//
//  UIImageView+Extensions.swift
//  Pryaniky
//
//  Created by Максон on 14.07.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import UIKit

extension UIImageView {

    func loadImage(urlString: String?) {
      guard let urlString = urlString else { return }
      guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async { [weak self] in
          guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
              self?.image = UIImage(data: data)
            }
        }
    }
}
