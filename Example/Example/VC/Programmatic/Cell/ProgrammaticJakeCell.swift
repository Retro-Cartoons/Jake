//
//  ProgrammaticJakeCell.swift
//  JakeExampleProject
//
//  Created by Ferhan Akkan on 21.07.2021.
//

import UIKit

final class ProgrammaticJakeCell: UITableViewCell {
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    titleLabel.text = nil
  }
  
  private func layout() {
    contentView.addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
    ])
  }
  
  func refreshTitleWith(title: String) {
    self.titleLabel.text = title
  }
}
