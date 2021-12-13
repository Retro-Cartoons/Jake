//
//  NibHeaderNonAutoCollapse.swift
//  Example
//
//  Created by Ferhan Akkan on 2.10.2021.
//

import UIKit
import Jake

final class NibHeaderNonAutoCollapse: JakeTableViewHeader {
  
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
  
  func refreshWith(_ title: String, isExpanded: Bool) {
    titleLabel.text = title
    button.isSelected = isExpanded
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    button.isSelected = !button.isSelected
    collapseOrExpandTrigger()
  }
}
