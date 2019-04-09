#
# Be sure to run `pod lib lint JWAdjustablePositionButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JWAdjustablePositionButton'
  s.version          = '0.0.1'
  s.summary          = 'JWAdjustablePositionButton.可调整图片与文字位置的按钮'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  JWAdjustablePositionButton:自定义按钮。
  可调整图片与文字的位置和间距
  
                       DESC

  s.homepage         = 'https://github.com/jw10126121/JWAdjustablePositionButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jw10126121' => '10126121@qq.com' }
  s.source           = { :git => 'https://github.com/jw10126121/JWAdjustablePositionButton.git', :tag => "#{spec.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'JWAdjustablePositionButton/Classes/**/*.swift'
  
  # s.resource_bundles = {
  #   'JWAdjustablePositionButton' => ['JWAdjustablePositionButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
