#
# Be sure to run `pod lib lint DBHelp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DBHelp'
  s.version          = '0.2.1'
  s.summary          = 'sql expression handle'

  s.description      = <<-DESC
DBHelp helps me to handle sql expression
                       DESC

  s.homepage         = 'https://github.com/wzc5670594/DBHelp'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wzc5670594' => '18511234520@163.com' }
  s.source           = { :git => 'https://github.com/wzc5670594/DBHelp.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DBHelp/**/*'
  
  # s.resource_bundles = {
  #   'DBHelp' => ['DBHelp/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
