//
//  PokemonCell.swift
//  MVC
//
//  Created by Mauricio Casillas on 29/07/23.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    
    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokemonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
