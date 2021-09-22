//
//  resultViewController.swift
//  UnsplashFotoSearch
//
//  Created by Стас Жингель on 21.09.2021.
//

import UIKit

class resultViewController: UIViewController {
    var results: [Result] = []
    let searchVC = SearchViewController()
    var myCollectionView: UICollectionView?
    var searchingText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
      }
    
//MARK: - setup Views
    fileprivate func setupCollectionView() {
        navigationItem.title = "Results"
        let view = UIView()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 110, height: 110)
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(ImageCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = UIColor.white
        view.addSubview(myCollectionView ?? UICollectionView())
        myCollectionView?.dataSource = self
        fetchPhotos(searchingText: searchingText)
        self.view = view
    }
    
//MARK: - Fetch Data
    func fetchPhotos(searchingText: String) {
        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(searchingText)&client_id=\(accessKey)"
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data,_,error) in
            guard let data = data, error == nil else {return}
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.myCollectionView?.reloadData()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}

//MARK: - extensions

extension resultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ImageCell
        let imageURLString = results[indexPath.row].urls.regular
        myCell.backgroundColor = .lightGray
        myCell.configure(with: imageURLString)
        return myCell
    }
}
