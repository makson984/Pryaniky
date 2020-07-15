//
//  Models.swift
//  Pryaniky
//
//  Created by Максон on 14.07.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import Foundation

class Response: Decodable {
  let view: [String]
  let data: [TypeData]
}

class TypeData: Decodable {
  let name: String
  let data: InternalData
}

class InternalData: Decodable {
  let text: String?
  let url: String?
  let selectedId: Int?
  let variants: [Variant]?
}

class Variant: Decodable {
  let id: Int
  let text: String
}
