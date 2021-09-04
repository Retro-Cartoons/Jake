//
//  ProgrammaticHeaderView.swift
//  JakeExampleProject
//
//  Created by Ferhan Akkan on 21.07.2021.
//

import UIKit
import Jake

final class ProgrammaticHeaderView: JakeTableViewHeader {
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Open", for: .normal)
    button.setTitle("Close", for: .selected)
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    return button
  }()
  
  override init() {
    super.init()
    
    layout()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    section = nil
    titleLabel.text = nil
    button.isSelected = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func expandedSection(_ section: Int) {
    super.expandedSection(section)
    
    button.isSelected = self.section == section
  }
  
  private func layout() {
    addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
    ])
    
    addSubview(button)
    NSLayoutConstraint.activate([
      button.widthAnchor.constraint(equalToConstant: 50),
      button.heightAnchor.constraint(equalToConstant: 30),
      button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      button.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
    ])
  }
  
  func refreshWith(_ title: String, isExpended: Bool) {
    titleLabel.text = title
    button.isSelected = isExpended
  }
  
  @objc private func buttonPressed(_ sender: Any) {
    button.isSelected = !button.isSelected
    collapseOrExpandTrigger()
  }
}
