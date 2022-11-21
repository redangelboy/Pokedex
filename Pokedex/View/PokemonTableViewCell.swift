//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Cesar Rojas on 11/16/22.
//

import Foundation
import UIKit

class pokemonTableViewCell: UITableViewCell {
    
    lazy var pokeImage: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = .systemRed
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        

        return imageView
    }()
    
    lazy var pokeTopLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .systemCyan
        label.textColor = .black
        label.text = "prueba"
        return label
    }()
    
    lazy var pokeMedLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.backgroundColor = .magenta
        label.textColor = .black

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUICell(){
        let name = self.pokeTopLabel
        let name2 = self.pokeMedLabel
        let image = self.pokeImage
        
        name.backgroundColor = .systemPink
        contentView.addSubview(name)
     
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 1).isActive = true
        name.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100).isActive = true
        name.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -2).isActive = true
        name.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -28).isActive = true
        name.heightAnchor.constraint(equalToConstant: 50).isActive = true
        name.text = "another name"


        name2.backgroundColor = .systemPurple
        contentView.addSubview(name2)
        name2.translatesAutoresizingMaskIntoConstraints = false
        name2.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 2).isActive = true
        name2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        name2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100).isActive = true
        name2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
        name2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1).isActive = true
        name2.text = "another name"
        
        
//        image.backgroundColor = .red
//        image.image?.performSelector(inBackground: "Pokeball", with: image)
        image.image = UIImage(named: "Pokeball")
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2).isActive = true
        image.trailingAnchor.constraint(equalTo: name.leadingAnchor, constant: -2).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1).isActive = true
        image.heightAnchor.constraint(equalToConstant: 110).isActive = true
        image.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
    }
    
    
}
