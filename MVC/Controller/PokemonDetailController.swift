//
//  PokemonDetailController.swift
//  MVC
//
//  Created by Mauricio Casillas on 29/07/23.
//

import UIKit

class PokemonDetailController: UIViewController {
    
    var receivedPokemon: Pokemon?
    
    @IBOutlet var detailPokemonName: UILabel!
    @IBOutlet var detailPokemonImage: UIImageView!
    @IBOutlet var detailAbility: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailPokemonName.text = receivedPokemon?.name
        detailPokemonImage.image = UIImage(named: receivedPokemon!.image)
        detailAbility.text = receivedPokemon?.ability
    }
    
    @IBAction func returnList(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
