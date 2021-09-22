//
//  ViewController.swift
//  UnsplashFotoSearch
//
//  Created by Стас Жингель on 21.09.2021.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    let searchTextField = UITextField()
    let searchButton = UIButton()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStackView()
        
    }
    

    @objc private func didTapButton() {
        guard searchTextField.text != "" else {return}
        let collectionView = resultViewController()
        navigationController?.pushViewController(collectionView, animated: true)
        collectionView.searchingText = searchTextField.text!
    }
    
    
    //MARK: - setup functions
    fileprivate func setUpTextField() {
        searchTextField.placeholder = "Enter text here"
        searchTextField.font = UIFont.systemFont(ofSize: 15)
        searchTextField.borderStyle = UITextField.BorderStyle.roundedRect
        searchTextField.autocorrectionType = UITextAutocorrectionType.no
        searchTextField.keyboardType = UIKeyboardType.default
        searchTextField.returnKeyType = UIReturnKeyType.done
        searchTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        searchTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        searchTextField.delegate = self
    }
    
    fileprivate func setUpSearchButton(stackView: UIView) {
        searchButton.setTitle("Search", for: .normal)
        searchButton.backgroundColor = .gray
        stackView.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: view.bounds.width/2).isActive = true
        searchButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func setupStackView() {
        navigationItem.title = "Search Image"
        let stackView = UIStackView(arrangedSubviews: [searchTextField, searchButton], axis: .horizontal, spacing: 0)
        setUpTextField()
        setUpSearchButton(stackView: stackView)
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
}

