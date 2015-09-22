Pod::Spec.new do |s|
  s.name         = 'GSLabel'
  s.version      = '1.0.0'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/GSLabel'
  s.source       = { :git => 'https://github.com/GyazSquare/GSLabel.git', :tag => '1.0.0' }
  s.summary      = 'A UILabel subclass supporting content insets written in Swift.'
  s.ios.deployment_target = '7.0'
  s.requires_arc  = true
  s.source_files  = 'GSLabel/*.{swift}'
end
