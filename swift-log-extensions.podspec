Pod::Spec.new do |spec|
  spec.name         = "swift-log-extensions"
  spec.version      = "1.0.0"
  spec.summary      = "swift log with tags"

  spec.description  = <<-DESC
  Utility wrapper around swift log providing tags
                   DESC

  spec.homepage     = "https://github.com/swaglive/swift-log-extensions"

  spec.license      = "MIT"  
  spec.author             = { "yu840915" => "yu840915@gmail.com" }

  spec.swift_version = "5.0"
  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "10.13"

  spec.source       = { :git => "https://github.com/swaglive/swift-log-extensions.git", :tag => "1.0.0" }
  spec.source_files  = "LoggingExtensions/**/*.swift"
  spec.dependency 'Logging', '~> 1.4'

end
