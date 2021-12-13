//
//  JakeTableViewHeader.swift
//  
//
//  Created by Ferhan Akkan on 4.09.2021.
//

#if os(iOS)
import UIKit

@IBDesignable
open class JakeTableViewHeader: UITableViewHeaderFooterView {
  
  @IBInspectable
  open var colorBackground: UIColor = .white {
    didSet {
      self.setBackgroundColor(colorBackground)
    }
  }
  
  public var delegate: JakeTableViewHeaderProtocol?
  public var section: Int?
  
  public init() {
    super.init(reuseIdentifier: "")
    setBackgroundColor(.white)
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    setBackgroundColor(.white)
  }
  
  public func collapseOrExpandTrigger() {
    guard let section = section else { return }
    delegate?.collapseOrExpandTriggeredFor(section)
  }
  
  open func expandedSection(_ section: Int) {
    
  }
  
  public func setBackgroundColor(_ color: UIColor) {
    let view = UIView(frame: self.bounds)
    view.backgroundColor = color
    self.backgroundView = view
  }
}

#endif
