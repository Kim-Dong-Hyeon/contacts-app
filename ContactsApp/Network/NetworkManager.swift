//
//  NetworkManager.swift
//  ContactsApp
//
//  Created by 김동현 on 7/17/24.
//

import Foundation

class NetworkManager {
  
  static let shared = NetworkManager()
  
  // 서버 데이터를 불러오는 메서드
  private func fetchData<T: Decodable>(url: URL, completion: @escaping (T?) -> Void) {
    let session = URLSession(configuration: .default)
    session.dataTask(with: URLRequest(url: url)) { data, response, error in
      guard let data, error == nil else {
        print("데이터 로드 실패")
        completion(nil)
        return
      }
      // http status code 성공 범위는 200번대
      let successRange = 200..<300
      if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
          print("JSON 디코딩 실패")
          completion(nil)
          return
        }
        completion(decodedData)
      } else {
        print("응답 오류")
        completion(nil)
      }
    }.resume()
  }
  
  /// 포켓몬 이미지 URL을 가져오는 함수
  func fetchPokemonImage(id: Int, completion: @escaping (URL?) -> Void) {
    let urlString = "https://pokeapi.co/api/v2/pokemon/\(id)"
    guard let url = URL(string: urlString) else {
      completion(nil)
      return
    }
    
    fetchData(url: url) { (pokemonData: PokemonData?) in
      guard let imageUrlString = pokemonData?.sprites.frontDefault, let imageUrl = URL(string: imageUrlString) else {
        completion(nil)
        return
      }
      completion(imageUrl)
    }
  }
}
