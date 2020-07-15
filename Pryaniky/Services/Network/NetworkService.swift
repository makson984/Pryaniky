//
//  NetworkService.swift
//  Covid-19App
//
//  Created by Максон on 06.04.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import Alamofire

protocol Networking {
  func getData(serviceUrl: ServiceUrl,
               completion: @escaping ((AFDataResponse<Any>) -> Void))
}

class NetworkService: Networking {
  
  func getData(serviceUrl: ServiceUrl,
               completion: @escaping ((AFDataResponse<Any>) -> Void)) {
    DispatchQueue.global().async {
      let request = AF.request(serviceUrl.path,
                 method: serviceUrl.method,
                 parameters: serviceUrl.parameters,
                 encoding: JSONEncoding.default,
                 headers: serviceUrl.headers)
      request.responseJSON { response in
        DispatchQueue.main.async {
          completion(response)
        }
      }
    }
  }
}
