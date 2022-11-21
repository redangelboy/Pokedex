/*

 1) Create a Model and decode data for list
 2) Create UI and integrate 1. to show Pokemon name
 3) Pagination
 4) Lazy fetcing Poke details
 5) On 4s callback, fetch image
 6) Image cacing and optimization
 7) Detail screen

*/

//Needed from Pokemon

//Sprite
//name
//type
//abilities
//moves

//Id
//Url

//TODO: setup -> make UI -> thursday , friday -> REMEMBER: 20 cells per page, limit = 20, offset = each page ; make variables offset & limit, each page call, add 20 to offset (offset += limit) ;, pagination FRIDAY BEGINNING, view controller FRIDAY AFTER PAGINATION. CALL POKEMON DETAILS


import Foundation


struct PageResults: Decodable {
    
    let next: String
    let previous: String?
    let results: [NameLink]
    
}

struct Pokemon: Decodable {
    
    let abilities: [Abilities]?
    let id: Int?
    let name: String
    let moves: [Moves]?
    let sprites: Sprites
    let types : [Types]?
    
}

struct Abilities : Decodable {
    
    let ability: NameLink
    
}

struct Moves: Decodable {
    
    let move: NameLink
    
}

struct Sprites : Decodable {
    
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        
        
    }
}

struct Types : Decodable {
    
    let type: NameLink
    
}

struct NameLink : Decodable {
    let name: String
    let url: String
    
}
