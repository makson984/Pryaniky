//
//  StartBuilder.swift
//  Pryaniky
//
//  Created by Максон on 15.07.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import Foundation

class StartBuilder {
  
  func build() -> StartViewController {
    let viewController = StartViewController()
    let serviceUrl = ServiceUrl()
    let networkService = NetworkService()
    let presenter = StartPresenter(view: viewController,
                                   serviceUrl: serviceUrl,
                                   networkService: networkService)
    viewController.presenter = presenter
    return viewController
  }
}
