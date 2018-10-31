#
# Be sure to run `pod lib lint ARPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ARPicker'
  s.version          = '1.0'
  s.summary          = 'ARPicker is a picker viewController which enables to select options with minimum effort'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"ARPicker is a picker viewController which enables to select options with minimum effort. This based on UIViewController and UIPicker. options list, cancel and done and current selected option are configurable."
                       DESC

  s.homepage         = 'https://github.com/AbdulRehmanWarraich/ARPicker.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AbdulRehman Warraich' => 'ar.warraich@outlook.com' }
  s.source           = { :git => 'https://github.com/AbdulRehmanWarraich/ARPicker.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ARPicker/Classes/**/*'
  s.swift_version = '4.2'
  
  # s.resource_bundles = {
  #   'ARPicker' => ['ARPicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
