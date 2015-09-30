//
//  PokeInfoVC.swift
//  pokedex-pro
//
//  Created by Jonathan Wood on 9/22/15.
//  Copyright © 2015 Jonathan Wood. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var pokeImg: UIImageView!
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!


    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        pokeImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            // this will be called after download is done
            self.updateUI()
            
            
        }
    }
    
    @IBAction func musicBtnPressed(sender: UIButton) {
        //trying to toggle music on Details View
        
    }

    @IBAction func backBtnPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateUI () {
        bioLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        idLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = pokemon.weight
        attackLbl.text = pokemon.attack
        evoLbl.text = "\(pokemon.nextEvolutionId)"
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolution"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
//                evoLbl.text = str
            }
        }
        
    }
    
    func downloadPokemon(pokemon: Pokemon) {
        
    }

}