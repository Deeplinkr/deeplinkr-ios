Pod::Spec.new do |s|
  s.name         = "Deeplinkr"
  s.version      = "0.1.1"
  s.summary      = "Library for integrating with the Deeplinkr.com API"
  s.homepage     = "https://deeplinkr.com"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Sean McGary" => "sean@seanmcgary.com" }
  s.source       = { :git => "https://github.com/Deeplinkr/deeplinkr-ios.git", :tag => "v0.1.1" }
  s.source_files = "Deeplinkr"
  s.exclude_files = "Classes/Exclude"
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
  s.dependency "AFNetworking", "2.3.1"

end
