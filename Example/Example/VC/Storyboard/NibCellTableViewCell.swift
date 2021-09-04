//
//  NibCellTableViewCell.swift
//  JakeExampleProject
//
//  Created by Ferhan Akkan on 30.07.2021.
//

import UIKit

final class NibCellTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  override func prepareForReuse() {
    titleLabel.text = nil
  }
  
  func refreshTitleWith(title: String) {
    self.titleLabel.text = title
  }
}
