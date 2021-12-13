//
//  HomeVC.swift
//  JakeExampleProject
//
//  Created by Ferhan Akkan on 21.07.2021.
//

import UIKit

final class HomeVC: UIViewController {
  
  private var rowTitles = ["Programmatic","Xib","Storyboard"]
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.tableFooterView = UIView(frame: .zero)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setLayout()
    tableView.reloadData()
  }
}

// MARK: - Layout

extension HomeVC {
  
  private func setLayout() {
    view.backgroundColor = .white
    
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ])
  }
}

// MARK: - TableView Delegate & DataSource

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description())
    cell?.accessoryType = .disclosureIndicator
    cell?.textLabel?.text = rowTitles[indexPath.row]
    return cell ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    self.showControllerWith(row: indexPath.row)
  }
}

// MARK: - Logic

extension HomeVC {
  
  private func showControllerWith(row: Int) {
    switch row {
    case 0:
      show(ProgrammaticVC(), sender: nil)
      
    case 1:
      guard let vc = UINib(nibName: "NibController", bundle: .main).instantiate(withOwner: self, options: nil).first as? NibController else { break }
      self.show(vc, sender: nil)
      
      
    case 2:
      let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "StoryboardVC")
      self.show(vc, sender: nil)
      
    default:
      break
    }
  }
}
