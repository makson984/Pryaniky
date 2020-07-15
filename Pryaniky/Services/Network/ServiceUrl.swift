//
//  ServiceUrl.swift
//  Covid-19App
//
//  Created by Максон on 07.04.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import Alamofire

struct ServiceUrl {
  
  enum Key: String {
    case all, countries
  }
  
  var path = "https://pryaniky.com/static/json/sample.json"
  var method: HTTPMethod = .get
  var parameters: Parameters?
  var headers: HTTPHeaders?
  
  func append(key: Key) -> ServiceUrl {
    var result = self
    result.path += "/\(key.rawValue)"
    return result
  }
}
