//
//  APIController.swift
//  Pokedex
//
//  Created by Tobi Kuyoro on 22/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import Foundation

class APIController: NSObject {

    @objc(sharedController) static let shared = APIController()

    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!

    var pokedex: [Pokemon] = []

    // MARK: - Networking

    @objc func fetchAllPokemon(completion: @escaping ([Pokemon]?, Error?) -> Void) {
        let request = URLRequest(url: baseURL)

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                NSLog("Error with request to fetch pokemon: \(error)")
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError())
                return
            }

            do {
                guard let pokemonJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                    let resultsJSON = pokemonJSON["results"] as? [[String: String]] else { throw NSError() }

                for result in resultsJSON {
                    let pokemon = Pokemon(dictionary: result)
                    self.pokedex.append(pokemon)
                    completion(self.pokedex, nil)
                }
            } catch {
                NSLog("Error decoding pokemon results: \(error)")
                completion(nil, error)
                return
            }
        }.resume()
    }
}
