#
# Be sure to run `pod lib lint ScryfallApiSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ScryfallApiSwift'
  s.version          = '0.1.0'
  s.summary          = 'A Swift wrapper for the Scryfall API'

  s.description      = <<-DESC
A Swift wrapper for the Scryfall REST API.  Allows you to search for cards, sets, symbols, etc.  This API is not affiliated with Magic the Gathering or Scryfall in any way.  The purpose is to be able to get information about Magic Cards and Magic Sets.

See https://scryfall.com/docs/api for the Scryfall REST API docs.
                       DESC

  s.homepage         = 'https://github.com/intere/ScryfallApiSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Eric Internicola' => 'intere@gmail.com' }
  s.source           = { :git => 'https://github.com/intere/ScryfallApiSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/intere'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ScryfallApiSwift' => ['ScryfallApiSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
