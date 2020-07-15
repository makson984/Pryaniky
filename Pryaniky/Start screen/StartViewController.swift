//
//  StartViewController.swift
//  Pryaniky
//
//  Created by Максон on 14.07.2020.
//  Copyright © 2020 MaksonInc. All rights reserved.
//

import UIKit

protocol StartViewProtocol: class {
  func success()
  func failure(message: String)
}

class StartViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.dataSource = self
      tableView.delegate   = self
      tableView.register(TextCell.nib, forCellReuseIdentifier: TextCell.id)
      tableView.register(ImageCell.nib, forCellReuseIdentifier: ImageCell.id)
    }
  }
  
  @IBOutlet private weak var spinner: UIActivityIndicatorView!
  
  var presenter: StartPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    spinner.startAnimating()
    presenter.getData()
  }
}

extension StartViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return presenter.numberOfRows()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfRowsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let name = presenter.viewNameForIndexPath(indexPath: indexPath)
    let data = presenter.dataForViewName(name: name)
    let type = presenter.cellTypeForIndexPath(indexPath: indexPath)
    switch type {
    case .image:
      let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.id, for: indexPath) as! ImageCell
      cell.setIcon(urlstring: data?.data.url)
      return cell
    case .variant:
      let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.id, for: indexPath) as! TextCell
      cell.set(text: data?.data.variants?[indexPath.row].text)
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.id, for: indexPath) as! TextCell
      cell.set(text: data?.data.text)
      return cell
    }
  }
}

extension StartViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let name = presenter.viewNameForIndexPath(indexPath: indexPath)
    let data = presenter.dataForViewName(name: name)
    let type = presenter.cellTypeForIndexPath(indexPath: indexPath)
    switch type {
    case .variant:
      let variant = data?.data.variants?[indexPath.row].id
      showEmptyAlert(message: "id =  \(variant ?? 0)")
    default:
      showEmptyAlert(message: data?.name)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let type = presenter.cellTypeForIndexPath(indexPath: indexPath)
    switch type {
    case .image: return 120
    default:     return UITableView.automaticDimension
    }
  }
}

extension StartViewController: StartViewProtocol {
  
  func success() {
    spinner.stopAnimating()
    tableView.reloadData()
  }
  
  func failure(message: String) {
    spinner.stopAnimating()
    showEmptyAlert(message: message)
  }
}

