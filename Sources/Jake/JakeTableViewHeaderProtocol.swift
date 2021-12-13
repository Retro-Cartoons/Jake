//
//  JakeTableViewHeaderProtocol.swift
//  
//
//  Created by Ferhan Akkan on 4.09.2021.
//

#if os(iOS)
import UIKit

public protocol JakeTableViewHeaderProtocol: AnyObject {
  func collapseOrExpandTriggeredFor(_ section: Int)
}

#endif
