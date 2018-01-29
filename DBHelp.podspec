#
# Be sure to run `pod lib lint DBHelp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DBHelp'
  s.version          = '0.2.2'
  s.summary          = 'sql语句生成'

  s.description      = <<-DESC
DBHelp helps to handle sql expression.
sql语句生成.
                       DESC

  s.homepage         = 'https://github.com/wzc5670594/DBHelp'


  s.author           = { 'Ray' => 'ray_wzc@163.com' }
  s.source           = { :git => 'https://github.com/wzc5670594/DBHelp.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'DBHelp/**/*'

# s.license          = { :type => 'MIT', :file => 'LICENSE' }

end
