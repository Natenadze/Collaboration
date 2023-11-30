import UIKit

final class SpecieController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel = SpecieViewModel()
    
    private let cityNameTextField = {
        let textField = UITextField()
        textField.placeholder = "city"
        textField.setLeftPaddingPoints(10)
        textField.font = .systemFont(ofSize: 15)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.cornerRadius = 15
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }()
    
    private let showInfoButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("SHOW INFO", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.layer.cornerRadius = 15
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private var cityID: Int = 0
    
    var cityName: String = ""
    
    private let tableView = UITableView()
    
    private let stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    

    
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupStackView()
        setupTableView()
        showInfoButtonAction()
        addDelegate()
    }
    
    // MARK: - Private Methods
    
    private func addViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(cityNameTextField)
        stackView.addArrangedSubview(showInfoButton)
        stackView.addArrangedSubview(tableView)
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
    }
    
    private func setupTableView() {
        registerTableViewCells()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerTableViewCells() {
        tableView.register(SpecieTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func showInfoButtonAction() {
        showInfoButton.addAction(UIAction(handler: { [weak self] action  in
            guard let self else { return }
            self.cityName = self.cityNameTextField.text ?? ""
            print(self.cityName)
            viewModel.fetchCity(cityName: cityName)
        }), for: .touchUpInside)
    }
    
    private func addDelegate() {
        viewModel.delegate = self
    }
    
}


// MARK: - Extensions

extension SpecieController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

extension SpecieController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpecieTableViewCell
        return cell
    }
    
}

private extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension SpecieController: SpecieViewModelDelegate {
    func cityFetched(_ city: City) {
        cityID = city.id
        print(cityID)
    }
    
}

