//
//  JakeTableViewDelegate.swift
//  
//
//  Created by Ferhan Akkan on 4.09.2021.
//

#if os(iOS)

import UIKit

final class JakeTableViewDelegate : NSObject, UITableViewDelegate, UITableViewDataSource {
  
  var expandSections: Set<Int> = []
  var tableViewData: [[Any]] = []
  
  var collapseOrExpandSection: ((Int) -> ())?
  
  weak var delegate: JakeTableViewDelegateAndDatasourceProtocol?
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return delegate?.jakeTableView(tableView, heightForRowAt: indexPath) ?? UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    delegate?.jakeTableView(tableView, didSelectRowAt: indexPath)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return delegate?.jakeTableView(tableView,
                                   cellForRowAt: indexPath,
                                   data: tableViewData) ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let isExpanded: Bool = expandSections.contains(section)
    let view = delegate?.jakeTableView(tableView, viewForHeaderInSection: section, isExpanded: isExpanded)
    view?.delegate = self
    return view
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.tableViewData.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !expandSections.contains(section) {
      return 0
    }
    return self.tableViewData[section].count
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return delegate?.jakeTableView(tableView, heightForHeaderInSection: section) ?? UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView(frame: .zero)
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return .leastNormalMagnitude
  }
  
  func headerExpanded(tableView: UITableView?, section: Int) {
    guard let tableView = tableView else { return }
    let sectionCount = tableView.numberOfSections
    for index in 0...sectionCount {
      let header = tableView.headerView(forSection: index) as? JakeTableViewHeader
      header?.expandedSection(section)
    }
  }
}

// MARK: - JakeTableViewDelegate

extension JakeTableViewDelegate: JakeTableViewHeaderProtocol {
  func collapseOrExpandTriggeredFor(_ section: Int) {
    collapseOrExpandSection?(section)
  }
}

#endif
