//
//  ProgrammaticVC.swift
//  JakeExampleProject
//
//  Created by Ferhan Akkan on 21.07.2021.
//

import UIKit
import Jake

final class ProgrammaticVC: UIViewController {
  
  private lazy var jakeTableView: JakeTableView = {
    let tableView = JakeTableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.delegate = self
    tableView.registerCells([ProgrammaticJakeCell.self])
    tableView.autoCollapse = true
    tableView.hasSeparator = false
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setLayout()
    
    jakeTableView.reloadTableViewWith(data: [
      ["1","2","3","4"],
      ["1","2","3","4"],
      ["1","2","3","4"],
      ["1","2","3","4"],
      ["1","2","3","4"]
    ])
  }
}

// MARK: - Layout

extension ProgrammaticVC {
  
  private func setLayout() {
    title = "Programmatic Example"
    view.backgroundColor = .white
    
    view.addSubview(jakeTableView)
    NSLayoutConstraint.activate([
      jakeTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      jakeTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      jakeTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      jakeTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

// MARK: - TableView Delegate & DataSource

extension ProgrammaticVC: JakeTableViewDelegateAndDatasourceProtocol {
  
  func jakeTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, data: [[Any]]) -> UITableViewCell {
    guard let data = data as? [[String]] else { return UITableViewCell()}
    let cell = tableView.dequeueReusableCell(withIdentifier: ProgrammaticJakeCell.description()) as? ProgrammaticJakeCell
    cell?.refreshTitleWith(title: data[indexPath.section][indexPath.row])
    return cell ?? UITableViewCell()
  }
  
  func jakeTableView(_ tableView: UITableView, viewForHeaderInSection section: Int, isExpanded: Bool) -> JakeTableViewHeader? {
    let view = ProgrammaticHeaderView()
    view.section = section
    view.refreshWith("Section \(section)", isExpended: isExpanded)
    return view
  }
  
  func jakeTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  //  Optional
  //  func jakeTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  //    return 300
  //  }
  
  //  Optional
  //  func jakeTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
  //    switch section {
  //    case 0:
  //      return 10
  //    case 1:
  //      return 30
  //    case 2:
  //      return 50
  //    case 3:
  //      return 90
  //    case 4:
  //      return 300
  //    default:
  //      return UITableView.automaticDimension
  //    }
  //  }
}
