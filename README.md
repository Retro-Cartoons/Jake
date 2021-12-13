# Jake

[![CI Status](https://github.com/Retro-Cartoons/Jake/workflows/Jake%20CI/badge.svg?branch=main)](https://github.com/Retro-Cartoons/Jake/actions)
[![Version](https://img.shields.io/cocoapods/v/Jake.svg)](https://cocoapods.org/pods/Jake)
[![SPM](https://img.shields.io/badge/spm-compatible-brightgreen.svg)](https://swift.org/package-manager)
[![License](https://img.shields.io/cocoapods/l/Jake.svg)](https://github.com/Retro-Cartoons/Jake/blob/main/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/Jake.svg)](https://github.com/Retro-Cartoons/Jake)

## Contents

- [Demo](#demo)
- [Requirements](#requirements)
- [Installation](#installation)
  - [Cocoapods](#cocoapods)
  - [SPM](#swift-package-manager)
- [Usage](#usage)
  - [XIB](#xib)
  - [Programmatically](#programmatically)
- [License](#license)

## Demo

[![P547c.gif](https://i.im.ge/2021/08/19/P547c.gif)](https://im.ge/i/P547c)

## Requirements

- iOS 11.0+
- Xcode 11+
- Swift 5.3+

## Installation

### Cocoapods

Jake is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Jake'
```

### Swift Package Manager

1. File > Swift Packages > Add Package Dependency
2. Add `https://github.com/Retro-Cartoons/Jake.git`

_OR_

Update `dependencies` in `Package.swift`
```swift
dependencies: [
    .package(url: "https://github.com/Retro-Cartoons/Jake.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

**JakeTableView Properties**
```swift
var delegate: JakeTableViewDelegateAndDatasourceProtocol?
var hasSeparator: Bool = true // Set's separators is removed behind cells. When is set false removes separators.
var autoCollapse: Bool = true // When selected section expand other sections collapse automatically.
```

**JakeTableViewHeader Properties & Functions**
```swift
public var delegate: JakeTableViewHeaderProtocol?
public var section: Int?

public func expandedSection(_ section: Int) // When you want to use the autocollapse feature, it shows which header is expanded into the header.
public func collapseOrExpandTrigger() // It allows you to collapse and expand operations in the header.
```

### XIB

![StoryboardImplementation](https://live.staticflickr.com/65535/51387454199_aeb2553b77.jpg)


### Programmatically

```swift
private lazy var jakeTableView: JakeTableView = {
  let tableView = JakeTableView()
  tableView.translatesAutoresizingMaskIntoConstraints = false
  tableView.delegate = self
  tableView.registerCells([ProgrammaticJakeCell.self])
  tableView.autoCollapse = true
  tableView.hasSeparator = false
  return tableView
}()
```

### How To Use

Let look step by step how to use Jake. 

We have to import Jake package to our class.

```swift
import Jake
```

Secondly we have to implement JakeTableViewDelegateAndDatasourceProtocol protocol to our ViewController. 

```swift
class ViewController: UIViewController, JakeTableViewDelegateAndDatasourceProtocol { }
```

After this steps we have to set our delegate.

```swift
class ViewController: UIViewController, JakeTableViewDelegateAndDatasourceProtocol {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    jakeTableView.delegate = self
  }
}
```

Now let's look our functions comes with Jake.

```swift
class ViewController: UIViewController, JakeTableViewDelegateAndDatasourceProtocol {

  func jakeTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, data: [[Any]]) -> UITableViewCell {
    guard let data = data as? [[String (Depends on your model)]] else { return UITableViewCell() }
    
    // Programatic Cell example
    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description)
    return cell ?? UITableViewCell()
    
    // Nib Cell Example ("cellID" was define when you register your nib cell in tableView)
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? NibCellTableViewCell
    cell?.refreshTitleWith(title: data[indexPath.section][indexPath.row])
    return cell ?? UITableViewCell()
  }

  // You have to inherit JakeTableViewHeader instead of UIView for your custom header view. isExpended property is inserted for reusable actions.
  func jakeTableView(_ tableView: UITableView, viewForHeaderInSection section: Int, isExpanded: Bool) -> JakeTableViewHeader? {
    let view = JakeTableViewHeader() 
    view.section = section
    return view
  }

  func jakeTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

  // Optional (It works automatic dimension when not implemented.)
  func jakeTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 300
  }

  // Optional (It works automatic dimension when not implemented.)
  func jakeTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0:
      return 50
    default:
      return UITableView.automaticDimension
    }
  }
}
```

And finally how to register our cells and reload data.

```swift
class ViewController: UIViewController, JakeTableViewDelegateAndDatasourceProtocol {

  func registerCell() {
  
    // Nib example
    jakeTableView.registerCells([
      (UINib(nibName: "NibCellTableViewCell", bundle: .main), "cellId") 
    ])
    
    // Programmatic example
    jakeTableView.registerCells([ProgrammaticJakeCell.self])
  }
  
  func reloadData() {
    // You can reload datas ,in format [[Any]]
    jakeTableView.reloadTableViewWith(data: [
      ["1","2","3","4"],
      ["1","2","3","4"],
      ["1","2","3","4"],
      ["1","2","3","4"],
      ["1","2","3","4"]
    ])
  }
}
```

## License

Jake is available under the MIT license. See the LICENSE file for more info.
