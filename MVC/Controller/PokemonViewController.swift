//
//  PokemonViewController.swift
//  MVC
//
//  Created by Mauricio Casillas on 29/07/23.
//

import UIKit

class PokemonViewController: UIViewController {
    
    let dataManager = PokemonDataManager()
    @IBOutlet var pokemonTable: UITableView!
    var selectedPokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.fetch()
    }
}

extension PokemonViewController: UITableViewDataSource, UITableViewDelegate{
    // maneja el número de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.countPokemons()
    }
    
    // se le pasa la celda que quiero que pinte PokemonCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        let pokemon = dataManager.getPokemon(at: indexPath.row)
        cell.pokemonImage.image = UIImage(named: pokemon.image)
        cell.pokemonLabel.text = pokemon.name
        
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pokemons"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.init(60.0)
    }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIImageView.init(image: UIImage(named: "Pokemon"))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected", indexPath.row)
        selectedPokemon = dataManager.getPokemon(at: indexPath.row)
        self.performSegue(withIdentifier: "Detail", sender: Self.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PokemonDetailController
        destination.receivedPokemon = selectedPokemon
    }
}
