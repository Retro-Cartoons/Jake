//
//  NibHeaderView.swift
//  JakeExampleProject
//
//  Created by Ferhan Akkan on 21.07.2021.
//

import UIKit
import Jake

final class NibHeaderView: JakeTableViewHeader {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var button: UIButton! {
    didSet {
      button.setTitle("Open", for: .normal)
      button.setTitle("Close", for: .selected)
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    section = nil
    titleLabel.text = nil
    button.isSelected = false
  }
  
  override class func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func expandedSection(_ section: Int) {
    super.expandedSection(section)
    
    button.isSelected = self.section == section
  }
  
  func refreshWith(_ title: String, isExpanded: Bool) {
    titleLabel.text = title
    button.isSelected = isExpanded
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    button.isSelected = !button.isSelected
    collapseOrExpandTrigger()
  }
}
