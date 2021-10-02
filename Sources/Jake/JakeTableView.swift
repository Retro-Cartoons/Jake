//
//  JakeTableView.swift
//  
//
//  Created by Ferhan Akkan on 4.09.2021.
//

#if os(iOS)

import UIKit

@IBDesignable
public final class JakeTableView: UIView {
  
  public override var backgroundColor: UIColor? {
    didSet {
      self.tableView?.backgroundColor = backgroundColor
    }
  }
  
  /// Determines tableView DataSource and Delegate
  public weak var delegate: JakeTableViewDelegateAndDatasourceProtocol? {
    didSet {
      jakeTableViewDelegate.delegate = delegate
    }
  }
  
  /// Determines tableView separator style.
  @IBInspectable
  public var hasSeparator: Bool = true {
    didSet {
      DispatchQueue.main.async {
        self.tableView?.separatorStyle = self.hasSeparator ? .singleLine : .none
      }
    }
  }
  
  /// Determines tableView sections will collapse when other section selected.
  @IBInspectable
  public var autoCollapse: Bool = true
  
  private var cellsProgramattic: [UITableViewCell.Type] = []
  private var cellsNib: [(UINib, String)] = []
  private var jakeTableViewDelegate: JakeTableViewDelegate = JakeTableViewDelegate()
  
  private var tableView: UITableView?
  
  // MARK: - Initilizer
  
  init() {
    super.init(frame: .zero)
    
    tableViewInitilize()
    setDelegate()
    setLayout()
    tableView?.reloadData()
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    tableViewInitilize()
    setDelegate()
    setLayout()
    tableView?.reloadData()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    tableViewInitilize()
    setDelegate()
    setLayout()
    tableView?.reloadData()
  }
}

// MARK: - Layout

extension JakeTableView {
  
  private func setLayout() {
    guard let tableView = tableView else { return }
    self.subviews.forEach({ $0.removeFromSuperview() })
    addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: self.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
  }
}

// MARK: - TableView

extension JakeTableView {
  
  private func tableViewInitilize() {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.tableFooterView = UIView(frame: .zero)
    tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.1))
    
    DispatchQueue.main.async {
      tableView.separatorStyle = self.hasSeparator ? .singleLine : .none
      tableView.backgroundColor = self.backgroundColor
    }
    
    cellsNib.forEach { nib in
      tableView.register(nib.0, forCellReuseIdentifier: nib.1)
    }
    
    cellsProgramattic.forEach { cell in
      tableView.register(cell.self, forCellReuseIdentifier: cell.description())
    }
    
    self.tableView = tableView
  }
  
  private func setDelegate() {
    tableView?.delegate = jakeTableViewDelegate
    tableView?.dataSource = jakeTableViewDelegate
  }
  
  public func registerCells(_ cells: [UITableViewCell.Type]) {
    self.cellsProgramattic = cells
    for cell in cells {
      tableView?.register(cell.self, forCellReuseIdentifier: cell.description())
    }
  }
  
  public func registerCells(_ cells: [(UINib, String)]) {
    self.cellsNib = cells
    for cell in cellsNib {
      self.tableView?.register(cell.0, forCellReuseIdentifier: cell.1)
    }
  }
  
  public func reloadTableViewWith(data: [[Any]]) {
    self.jakeTableViewDelegate.tableViewData = data
    self.jakeTableViewDelegate.collapseOrExpandSection = { [weak self] section in
      self?.collapsOrExpande(section)
    }
    self.tableView?.reloadData()
  }
}

// MARK: - Logic

extension JakeTableView {
  private func collapsOrExpande(_ section: Int) {
    
    let shouldCollapse = jakeTableViewDelegate.expandSections.contains(section)
    
    if shouldCollapse {
      jakeTableViewDelegate.expandSections.remove(section)
      self.tableView?.deleteRows(at: indexPathsFor(section: section),
                                 with: .fade)
    } else {
      jakeTableViewDelegate.headerExpanded(tableView: tableView,
                                           section: section)
      jakeTableViewDelegate.expandSections.insert(section)
      self.tableView?.insertRows(at: indexPathsFor(section: section),
                                 with: .fade)
    }
    
    if autoCollapse {
      for i in 0...jakeTableViewDelegate.tableViewData.count-1 {
        if jakeTableViewDelegate.expandSections.contains(i) && section != i {
          jakeTableViewDelegate.expandSections.remove(i)
          self.tableView?.deleteRows(at: indexPathsFor(section: i),with: .fade)
        }
      }
    }
  }
  
  private func indexPathsFor(section: Int) -> [IndexPath] {
    var indexPaths = [IndexPath]()
    
    for row in 0..<jakeTableViewDelegate.tableViewData[section].count {
      indexPaths.append(IndexPath(row: row,
                                  section: section))
    }
    return indexPaths
  }
}

#endif
