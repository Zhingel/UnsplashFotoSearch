//
//  Cell.swift
//  UnsplashFotoSearch
//
//  Created by Стас Жингель on 21.09.2021.
//

import UIKit
import SDWebImage

class ImageCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    func configure(with urlString: String) {
        guard let url = URL(string: urlString) else {return}
        self.imageView.sd_setImage(with: url, completed: nil)
         
    }
}
