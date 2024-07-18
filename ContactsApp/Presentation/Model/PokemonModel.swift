//
//  PokemonModel.swift
//  ContactsApp
//
//  Created by 김동현 on 7/17/24.
//

import Foundation

/// 포켓몬 데이터를 디코딩하기 위한 모델
struct PokemonData: Decodable {
  let sprites: Sprites
}

struct Sprites: Decodable {
  let frontDefault: String
  
  enum CodingKeys: String, CodingKey {
    case frontDefault = "front_default"
  }
}
