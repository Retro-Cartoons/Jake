//
//  StoryboardVC.swift
//  JakeExampleProject
//
//  Created by Ferhan Akkan on 21.07.2021.
//

import UIKit
import Jake

final class StoryboardVC: UIViewController {
  
  @IBOutlet weak var jakeTableView: JakeTableView! {
    didSet {
      jakeTableView.delegate = self
      jakeTableView.registerCells([
        (UINib(nibName: "NibCellTableViewCell", bundle: .main), "cellID")
      ])
      jakeTableView.reloadTableViewWith(data: [
        ["1","2","3","4"],
        ["1","2","3","4"],
        ["1","2","3","4"],
        ["1","2","3","4"],
        ["1","2","3","4"]
      ])
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Storyboard Example"
  }
}

extension StoryboardVC: JakeTableViewDelegateAndDatasourceProtocol {
  
  func jakeTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func jakeTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, data: [[Any]]) -> UITableViewCell {
    guard let data = data as? [[String]] else { return UITableViewCell() }
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? NibCellTableViewCell
    cell?.refreshTitleWith(title: data[indexPath.section][indexPath.row])
    return cell ?? UITableViewCell()
  }
  
  func jakeTableView(_ tableView: UITableView, viewForHeaderInSection section: Int, isExpanded: Bool) -> JakeTableViewHeader? {
    guard let view = UINib(nibName: "NibHeaderView", bundle: .main).instantiate(withOwner: self, options: nil).first as? NibHeaderView else { return JakeTableViewHeader() }
    view.section = section
    view.refreshWith("Section \(section)", isExpanded: isExpanded)
    return view
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
