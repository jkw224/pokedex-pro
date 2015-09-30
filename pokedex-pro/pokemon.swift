//
//  pokemon.swift
//  pokedex-pro
//
//  Created by Jonathan Wood on 9/19/15.
//  Copyright © 2015 Jonathan Wood. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _pokedexId: Int!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLvl: String!
    private var _pokemonURL: String!
    
    init (name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description

    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }

    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionTxt: String {
        if _nextEvolutionTxt == nil {
            _nextEvolutionTxt = ""
        }
        return _nextEvolutionTxt
    }
    
    var nextEvolutionId: String {
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nextEvolutionLvl: String {
        if _nextEvolutionLvl == nil {
             _nextEvolutionLvl = ""
        }
        return _nextEvolutionLvl
    }
    
    var pokemonURL: String {
        if _pokemonURL == nil {
            _pokemonURL = ""
        }
        return _pokemonURL
    }
    
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET, url).responseJSON { (request: NSURLRequest?, response: NSHTTPURLResponse?, result: Result<AnyObject>) -> Void in
        
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    if let typeName = types[0]["name"] {
                        self._type = typeName.capitalizedString
                    }
                    
                    if types.count > 1 {
                        for var x = 1; x < types.count; x++ {
                            if let typeName = types[x]["name"] {
                                self._type! += "/\(typeName.capitalizedString)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                
                // parsing info from dictionaries in Json
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, nsurl).responseJSON { (request: NSURLRequest?, response: NSHTTPURLResponse?, result: Result<AnyObject>) -> Void in
                            
                            if let descDict = result.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                }
                            }
                            
                            completed()
                        }
                    } else {
                        self._description = "N/A"
                    }
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0 {
                    if let evoName = evolutions[0]["to"] as? String {
                        
                        // can't support mega pokemon right now
                        // api still has mega data
                        if evoName.rangeOfString("mega") == nil {
                            self._nextEvolutionTxt = evoName
                        }
                    }
                    
                    if let uri = evolutions[0]["resource_uri"] as? String {
                        //getting pokemon number (to call correct img) out of resource_uri
                        let mochUri = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon", withString: "")
                        let pokemonNum = mochUri.stringByReplacingOccurrencesOfString("/", withString: "")
                        
                        self._nextEvolutionId = pokemonNum
                    }
                    
                    if let evoLvl = evolutions[0]["level"] as? Int {
                        self._nextEvolutionLvl = "\(evoLvl)"
                    }
                }
            }
        }
    }
}
