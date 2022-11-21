
import UIKit

class PokemonViewController: UIViewController {
    
    lazy var pokemonTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.prefetchDataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
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
        
        pokemonTableView.register(pokemonTableViewCell.self, forCellReuseIdentifier: "viewCell")
        
        self.pokemonTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.pokemonTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.pokemonTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.pokemonTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
    }
    
    func requestNextPage() {
        
//        if self.pokemones.count > 132 { return }
        
        self.network.fetchPageResults(with: path + "?offset=\(self.offset)&limit=\(self.limit)") { pag in
            guard let pag = pag else { return }
            self.offset += self.limit
//            switch pag{
//            case .some(let page):
                self.pokemones.append(contentsOf: pag.results)
                
                
                DispatchQueue.main.async {
                    
                    self.pokemonTableView.reloadData()
                    
//                }
//            case .failure(let error):
//                self.presentNetworkErrorAlert(error: error)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "viewCell", for: indexPath) as? pokemonTableViewCell else { return UITableViewCell()}
        
        
        
        print(indexPath)
        self.network.fetchPageResults(with: path + "?offset=\(self.offset)&limit=\(self.limit)" ) { (page: PageResults?) in
            
            
//            guard let page = page else {
//                print("caught in page fetch")
//                return }

            
        self.network.fetchPageResults(with: self.pokemones[indexPath.row].url){ (res: Pokemon?) in
                DispatchQueue.main.async {
                

                    cell.pokeTopLabel.text = (res?.name)
                    cell.pokeTopLabel.backgroundColor = .systemCyan
            
                
//                    cell.pokeMedLabel.text = "algo"
                    cell.pokeMedLabel.text = "Type: \(res?.types?.compactMap { $0.type.name }.joined(separator: " , ") ?? "")"
                
                    
                    guard let spriteRes = res?.sprites.frontDefault else {return}
                    print(spriteRes)
                    self.network.fetchImageData(path: (spriteRes)) { data in
                        
                        DispatchQueue.main.async {
                            guard let data = data else {return}
                            print(data)
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
    
    // MARK: "New" way to do Pagination in UIKit
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.pokemones.count - 1, section: 0)
        guard indexPaths.contains(lastIndexPath) else { return }
        self.requestNextPage()
        print("Algo ********************************************************"
        )
    }
    
}

