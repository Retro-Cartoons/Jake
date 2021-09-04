Pod::Spec.new do |s|
  s.name             = 'Jake'
  s.version          = '0.1.0'
  s.summary          = 'Easiest way to use expandable tableView.'
  s.homepage         = 'https://github.com/Retro-Cartoons/Jake'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Retro Cartoons' => 'ferhanakkan@gmail.com' }
  s.source           = { :git => 'https://github.com/Retro-Cartoons/Jake.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/Jake/**/*'
end
