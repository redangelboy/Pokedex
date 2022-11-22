
import UIKit

class PokemonViewController: UIViewController {
    
    lazy var pokemonTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.prefetchDataSource = self
        table.register(PokemonTableViewCell.self, forCellReuseIdentifier: "Cell")
        table.delegate = self
        
        
        return table
    }()
    
    
    
    var offset: Int = 0
    let limit: Int = 30
    let path = "https://pokeapi.co/api/v2/pokemon"
    var currentPage: PageResults?
    
    let network: NetworkURLSessionManager
    var pokemons: [String] = []
    var pokemones: [NameLink] = []
    
    
    init(network: NetworkURLSessionManager = NetworkURLSessionManager()) {
        self.network = network
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.requestNextPage()
        
    }
    
    private func createUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.pokemonTableView)
        self.pokemonTableView.backgroundColor = .white
        
        self.pokemonTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.pokemonTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.pokemonTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.pokemonTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
    }
    
    func requestNextPage() {
        
        self.network.getResults(with: path + "?offset=\(self.offset)&limit=\(self.limit)") { pag in
            guard let pag = pag else { return }
            self.offset += self.limit
                self.pokemones.append(contentsOf: pag.results)
                
                
                DispatchQueue.main.async {
                    
                    self.pokemonTableView.reloadData()
                    
            }
            
            
        }
            
    }
}

extension PokemonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.pokemones.count >= 151 {
            return 151
        }
        return self.pokemones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PokemonTableViewCell else { return UITableViewCell()}
        
        
        
        print(indexPath)
        self.network.getResults(with: path + "?offset=\(self.offset)&limit=\(self.limit)" ) { (page: PageResults?) in
            
        self.network.fetchPageResults(with: self.pokemones[indexPath.row].url){ (res: Pokemon?) in
                DispatchQueue.main.async {
                

                    cell.pokeTopLabel.text = (res?.name)
                    cell.pokeTopLabel.backgroundColor = .systemCyan
                    cell.pokeMedLabel.text = "Type: \(res?.types?.compactMap { $0.type.name }.joined(separator: " , ") ?? "")"
                
                    
                    guard let spriteRes = res?.sprites.frontDefault else {return}
//                    print(spriteRes)
                    self.network.fetchImageData(path: (spriteRes)) { data in
                        
                        DispatchQueue.main.async {
                            guard let data = data else {return}
//                            print(data)
                            cell.pokeImage.image = UIImage(data: data)
                        }
                    }
                }
                
                
            }
            
            
        }
        return cell
    }
    
}

extension PokemonViewController: UITableViewDataSourcePrefetching {
    

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.pokemones.count - 1, section: 0)
        guard indexPaths.contains(lastIndexPath) else { return }
        self.requestNextPage()
    }
    
}

extension PokemonViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navController = pokemonPlaceHolderViewController()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PokemonTableViewCell else {return}

        
        self.network.fetchPageResults(with: self.pokemones[indexPath.row].url){ (res: Pokemon?) in
            DispatchQueue.main.async {
                
                guard let names = res?.name else {return}
                
                guard let abilis = res?.abilities else {return}
                let abilitys = abilis.compactMap({ $0.ability.name }).joined(separator: " , ")
                
                guard let movez = res?.moves else {return}
                let movezz = movez.compactMap({ $0.move.name}).joined(separator: " , ")
                
                navController.infoLabel.text =  ("Name: \(names)")
                navController.infoLabel2.text =  ("Type: \(res?.types?.compactMap { $0.type.name }.joined(separator: " , ") ?? "")")
                navController.infoLabel3.text = ("Abilities: \(abilitys)")
                navController.infoText.text = ("Moves: \(movezz)")

                guard let spriteRes = res?.sprites.frontDefault else {return}

                self.network.fetchImageData(path: (spriteRes)) { data in
                    DispatchQueue.main.async {
                        guard let data = data else {return}

                        navController.progImageView.image = UIImage(data: data)
                        self.navigationController?.pushViewController(navController, animated: true)
                        print("The selected path is \(indexPath)")
                    }

                }
            }
        }
    }
}
