//
//  constants.swift
//  pokedex-pro
//
//  Created by Jonathan Wood on 9/25/15.
//  Copyright © 2015 Jonathan Wood. All rights reserved.
//

import Foundation

let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v1/pokemon/"  // as opposed to pokedex


typealias DownloadComplete = () -> ()  // aliasing our own custom closure
//this is saying: empty closure (no parameters, returning nothing)