//
//  JakeTableViewDelegateAndDatasourceProtocol.swift
//  
//
//  Created by Ferhan Akkan on 4.09.2021.
//

#if os(iOS)
import UIKit

public protocol JakeTableViewDelegateAndDatasourceProtocol: AnyObject {
  func jakeTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
  func jakeTableView(_ tableView: UITableView, viewForHeaderInSection section: Int, isExpanded: Bool) -> JakeTableViewHeader?
  func jakeTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, data: [[Any]]) -> UITableViewCell
  func jakeTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
  func jakeTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
}

public extension JakeTableViewDelegateAndDatasourceProtocol {
  func jakeTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func jakeTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

#endif
