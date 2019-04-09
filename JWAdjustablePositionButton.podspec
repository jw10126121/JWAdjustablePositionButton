#
# Be sure to run `pod lib lint JWAdjustablePositionButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'JWAdjustablePositionButton'
    s.version          = '0.0.3'
    s.summary          = 'JWAdjustablePositionButton.可调整图片与文字位置的按钮'
    s.homepage         = 'https://github.com/jw10126121/JWAdjustablePositionButton'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'jw10126121' => '10126121@qq.com' }
    s.source           = { :git => 'https://github.com/jw10126121/JWAdjustablePositionButton.git', :tag => s.version.to_s }
    s.source_files = 'JWAdjustablePositionButton/Classes/**/*.swift'
    s.ios.deployment_target = '9.0'
    s.swift_versions = ['4.2', '5.0']
end
