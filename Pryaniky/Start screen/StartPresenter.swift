//
//  StartPresenter.swift
//  Pryaniky
//
//  Created by Максон on 15.07.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import Foundation

protocol StartPresenterProtocol: class {
  func getData()
  func numberOfRows() -> Int
  func numberOfRowsInSection(section: Int) -> Int
  func cellTypeForIndexPath(indexPath: IndexPath) -> CellType
  func viewNameForIndexPath(indexPath: IndexPath) -> String
  func dataForViewName(name: String) -> TypeData?
}

class StartPresenter: StartPresenterProtocol {

  private let networkService: Networking
  private let serviceUrl: ServiceUrl
  private var response: Response?
  
  weak var view: StartViewProtocol?
  
  init(view: StartViewProtocol, serviceUrl: ServiceUrl, networkService: Networking) {
    self.view = view
    self.serviceUrl = serviceUrl
    self.networkService = networkService
  }
  
  private func cellType(data: InternalData?) -> CellType {
    if data?.url != nil      { return .image }
    else if data?.variants != nil { return .variant }
    else { return .text }
  }
  
  func numberOfRows() -> Int {
    return response?.view.count ?? 0
  }
  
  func numberOfRowsInSection(section: Int) -> Int {
    let name = response?.view[section]
    let data = response?.data.first(where: { $0.name == name })
    let type = cellType(data: data?.data)
    switch type {
    case .variant: return data?.data.variants?.count ?? 0
    default: return 1
    }
  }
  
  func cellTypeForIndexPath(indexPath: IndexPath) -> CellType {
    let name = response?.view[indexPath.section]
    let data = response?.data.first(where: { $0.name == name })
    let type = cellType(data: data?.data)
    return type
  }
  
  func viewNameForIndexPath(indexPath: IndexPath) -> String {
    return response?.view[indexPath.section] ?? ""
  }
  
  func dataForViewName(name: String) -> TypeData? {
    return response?.data.first(where: { $0.name == name }) 
  }
  
  func getData() {
    networkService.getData(serviceUrl: serviceUrl) { AFResponse in
      switch AFResponse.result {
      case .success(_):
        guard let data = AFResponse.data else { return }
        let response = try? JSONDecoder().decode(Response.self, from: data)
        self.response = response
        self.view?.success()
      case .failure(let error):
        self.view?.failure(message: error.localizedDescription)
      }
    }
  }
}
