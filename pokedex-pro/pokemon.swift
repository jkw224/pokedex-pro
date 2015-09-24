//
//  pokemon.swift
//  pokedex-pro
//
//  Created by Jonathan Wood on 9/19/15.
//  Copyright © 2015 Jonathan Wood. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _description:  String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _pokedexID: Int!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionText: String!
    
    init (name: String, pokedexId: Int) {
        self._name = name
        self._pokedexID = pokedexId
    }
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
}
