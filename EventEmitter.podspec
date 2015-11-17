Pod::Spec.new do |spec|
  spec.name             = 'EventEmitter'
  spec.summary          = 'Node.js inspired EventEmitter for Objective C.'
  spec.version          = '0.1.2'
  spec.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE.txt' }
  spec.homepage         = 'https://github.com/jerolimov/EventEmitter'
  spec.author           = "Christoph Jerolimov"
  spec.social_media_url = "http://twitter.com/jerolimov"

  spec.source       = { :git => 'https://github.com/jerolimov/EventEmitter.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = "5.0"
  spec.osx.deployment_target = "10.7"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.source_files = 'EventEmitter/*.{h,m}'
end
