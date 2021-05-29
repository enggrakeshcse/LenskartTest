//
//  DetailsViewController.swift
//  LenskartTest
//
//  Created by Mac Admin on 29/05/21.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var languageText: UILabel!
    var movie : Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }

    private func setData() {
        if let movie = movie {
            if let image = movie.posterPath {
                let urlString = baseImage + image
                let url = URL(string: urlString)
                imageView.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
            }
            titileLabel.text = movie.title
            subTitleLabel.text = movie.originalTitle
            languageText.text = movie.originalLanguage
        }
        
    }
}
