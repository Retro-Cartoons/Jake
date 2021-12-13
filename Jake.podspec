Pod::Spec.new do |s|
  s.name             = 'Jake'
  s.version          = '1.0.0'
  s.summary          = 'An easy wat to use expandable table view'
  s.description      = <<-DESC
  Jake is a smooth expandable table view written in Swift for iOS developers.
  Integrate it easily and make your table views expandable!
                       DESC

  s.homepage         = 'https://github.com/Retro-Cartoons/Jake'
  s.screenshots     = 'https://i.im.ge/2021/08/19/P547c.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Retro Cartoons' => 'ferhanakkan@gmail.com' }
  s.source           = { :git => 'https://github.com/Retro-Cartoons/Jake.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/Jake/**/*'
end
