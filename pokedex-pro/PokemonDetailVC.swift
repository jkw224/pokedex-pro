//
//  PokeInfoVC.swift
//  pokedex-pro
//
//  Created by Jonathan Wood on 9/22/15.
//  Copyright © 2015 Jonathan Wood. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokeType: Pokemon!
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokeType.name
    }

    @IBAction func musicBtnPressed(sender: UIButton) {

    }

    @IBAction func backBtnPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}