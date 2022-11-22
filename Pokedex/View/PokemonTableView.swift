import UIKit


    class pokemonPlaceHolderViewController: UIViewController {
        
        var toReciveImageName : String?
        
        lazy var progImageView: UIImageView = {
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = .systemBlue
            imageView.contentMode = .scaleAspectFit
            return imageView
            
        }()
        
        lazy var infoLabel: UILabel = {
            
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = .systemRed
            label.numberOfLines = 0
            label.text = "PK"
            label.textAlignment = .center
            return label
        }()
        
        lazy var infoLabel2: UILabel = {
            
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = .systemMint
            label.numberOfLines = 0
            label.text = "PK"
            label.textAlignment = .center
            return label
        }()
        
        lazy var infoLabel3: UILabel = {
            
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = .systemTeal
            label.numberOfLines = 0
            label.text = "PK"
            label.textAlignment = .center
            return label
        }()
        
        lazy var infoText: UITextView = {
            
            let text = UITextView (frame: .zero)
            text.translatesAutoresizingMaskIntoConstraints = false
            text.backgroundColor = .systemFill
            text.font = UIFont.systemFont(ofSize: 17)
            text.isScrollEnabled = true
            text.text = "PK"
            return text
        }()
        
        var nameString: String = ""
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        
        init() {
            super.init(nibName: nil, bundle: nil)
            self.createTheView()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func createTheView (){
            self.view.backgroundColor = .white
            self.title = "Details"
            
            
            let table2 = UITableView(frame : .zero)
            table2.translatesAutoresizingMaskIntoConstraints = false
            table2.backgroundColor = .white
            
            self.view.addSubview(table2)
            
            table2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
            table2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            table2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            table2.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
            
            table2.addSubview(self.infoLabel)
            table2.addSubview(self.infoLabel2)
            table2.addSubview(self.infoLabel3)
            table2.addSubview(self.progImageView)
            table2.addSubview(self.infoText)
            
            infoLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
            infoLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            infoLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            infoLabel.bottomAnchor.constraint(equalTo: self.progImageView.topAnchor, constant: 0).isActive = true
            infoLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
            infoLabel2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            infoLabel2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            infoLabel2.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
            infoLabel3.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            infoLabel3.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            infoLabel3.topAnchor.constraint(equalTo: self.infoLabel2.bottomAnchor, constant: 0).isActive = true
            infoLabel3.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
            infoText.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            infoText.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            infoText.topAnchor.constraint(equalTo: self.infoLabel3.bottomAnchor, constant: 0).isActive = true
            infoText.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true


            progImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            progImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            progImageView.bottomAnchor.constraint(equalTo: self.infoLabel2.topAnchor, constant: 0).isActive = true
            progImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
            progImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true


        }

    }
