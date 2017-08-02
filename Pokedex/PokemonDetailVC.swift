//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Geoffrey Gonzales on 7/28/17.
//  Copyright © 2017 astra. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController
{
        
        var pokemon : Pokemon!
        
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var mainImage: UIImageView!
        @IBOutlet weak var descriptionLabel: UILabel!
        @IBOutlet weak var typeLabel: UILabel!
        @IBOutlet weak var defenceLabel: UILabel!
        @IBOutlet weak var heightLabel: UILabel!
        @IBOutlet weak var idLabel: UILabel!
        @IBOutlet weak var weightLabel: UILabel!
        @IBOutlet weak var attackLabel: UILabel!
        @IBOutlet weak var currentEvoImage: UIImageView!
        @IBOutlet weak var nextEvoImage: UIImageView!
        @IBOutlet weak var evoLabel: UILabel!
        
        
        override func viewDidLoad() {
                
                super.viewDidLoad()
                
                nameLabel.text = pokemon.name.capitalized
                
                let img = UIImage(named: "\(pokemon.pokedexID)")
                
                mainImage.image = img
                currentEvoImage.image = img
                idLabel.text = "\(pokemon.pokedexID)"
                
                pokemon.downloadPokemonDetail {
                        
                        self.updateUI()
                        
                }
                
        }
        
        func updateUI() {
                
                attackLabel.text = pokemon.attack
                defenceLabel.text = pokemon.defense
                heightLabel.text = pokemon.height
                weightLabel.text = pokemon.weight
                typeLabel.text = pokemon.type
                descriptionLabel.text = pokemon.description
                
                if pokemon.nextEvolutionID == "" {
                        evoLabel.text = "No Evolutions"
                        nextEvoImage.isHidden = true
                } else {
                        
                        nextEvoImage.isHidden = false
                        nextEvoImage.image = UIImage(named: pokemon.nextEvolutionID)
                        
                        let str = "Next Evolution : \(pokemon.nextEvolutionName) = LVL \(pokemon.nextEvolutionLevel)"
                        evoLabel.text = str
                }
        }
        
        @IBAction func backButtonPressed(_ sender: Any) {
                
                dismiss(animated: true, completion: nil)
                
        }
        
        
        
}
