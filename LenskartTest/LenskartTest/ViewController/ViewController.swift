//
//  ViewController.swift
//  LenskartTest
//
//  Created by Mac Admin on 29/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    var movies: MoviesResponse?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        tableView.register(ProductsTableViewCell.cellNib, forCellReuseIdentifier: ProductsTableViewCell.cellIdentifier)
    }
    
    private func getData() {
        let servicesManager = ServiceManager()
        servicesManager.getData { [weak self] (data) in
            self?.movies = data
            self?.tableView.reloadData()
        }
    }
    private func goToDetailPage(_ _index: Int) {
        let viewController = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        viewController.movie = movies?.data[_index]
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.cellIdentifier, for: indexPath) as? ProductsTableViewCell {
            cell.configure(movie: movies?.data[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailPage(indexPath.row)
    }
}
