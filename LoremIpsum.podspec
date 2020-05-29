Pod::Spec.new do |s|
  s.name         = "LoremIpsum"
  s.version      = "2.0.0"
  s.summary      = "A lightweight lorem ipsum and image placeholders generator for Objective-C."
  s.homepage     = "https://github.com/lukaskubanek/LoremIpsum"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { "Lukas Kubanek" => "lukas.kubanek@me.com" }
  s.source       = { :git => "https://github.com/lukaskubanek/LoremIpsum.git",
                     :tag => "v#{s.version}" }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.7'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.source_files = 'Sources/LoremIpsum/**/*.{h,m}'
  s.public_header_files = 'Sources/LoremIpsum/include/*.h'
  s.requires_arc = true
end
