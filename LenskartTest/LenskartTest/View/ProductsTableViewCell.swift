//
//  ProductsTableViewCell.swift
//  GenorocityUserSwift
//
//  Created by Mac Admin on 29/05/21.
//  Copyright © 2021 Finoit. All rights reserved.
//

import UIKit
import SDWebImage

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var originalLanguageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var cellIdentifier: String {
        return String.init(describing: self)
    }
       
    static var cellNib: UINib {
        return UINib(nibName: self.cellIdentifier, bundle: nil)
    }
    
    func configure(movie: Movie?) {
        if let movie = movie {
        if let image = movie.posterPath {
            let urlString = baseImage + image
            posterImageView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: ""))
        }
        titleLabel.text = movie.title
        originalTitleLabel.text = movie.originalTitle
        originalLanguageLabel.text = movie.originalLanguage
    }
    }
    
}
