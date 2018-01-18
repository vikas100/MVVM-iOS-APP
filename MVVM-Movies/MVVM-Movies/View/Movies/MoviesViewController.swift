//
//  MoviesViewController.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovies(type: .Popular) {
            let indexPath = IndexPath(item: AppConstants.Movies.popularRow, section: AppConstants.Movies.section)
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
        viewModel.getMovies(type: .TopRate) {
            let indexPath = IndexPath(item: AppConstants.Movies.topRateRow, section: AppConstants.Movies.section)
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
        viewModel.getMovies(type: .Upcoming) {
            let indexPath = IndexPath(item: AppConstants.Movies.upcomingRow, section: AppConstants.Movies.section)
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.stringRepresentation) as! CustomCell
        viewModel.setTableViewCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  AppConstants.Movies.numberOfRows
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return AppConstants.Movies.numberOfSections
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(AppConstants.Movies.heightForRow)
    }
}
