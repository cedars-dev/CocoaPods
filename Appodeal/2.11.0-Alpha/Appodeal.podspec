Pod::Spec.new do |spec|
  spec.name         = "Appodeal"
  spec.version      = "2.11.0-Alpha"
  spec.summary      = "Appodeal iOS Framework"
  spec.description  = <<-DESC
    Appodeal’s supply-side platform is designed and built by veteran publishers,for publishers. Appodeal is not an ad network; it is a new approach to monetizing for publishers.
  The platform is a large auction house, accompanied by a mediation layer, that exposes a publisher’s inventory to all available buyers on the market via relationships with every major ad network, RTB exchange, and DSP. Appodeal showcases publisher inventory to the advertiser, and offers the highest rate in real time.
  Appodeal’s goal is to cater to the needs of the publisher, not the advertiser, so you always know that you’re in good hands.
                   DESC
  spec.homepage     = "https://appodeal.com"
  spec.license      = { :type => "Appodeal Privacy Policy", :file => "Appodeal-#{spec.version}/LICENSE.md" }
  spec.author       = { "Appodeal, Inc" => "https://appodeal.com" }
 
  spec.platform     = :ios, "10.0"
  spec.source       = { :http => "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/Modular/Appodeal/#{spec.version}/Appodeal.zip" }

  spec.requires_arc = true

  spec.vendored_frameworks = "Appodeal-#{spec.version}/Appodeal.xcframework", "Appodeal-#{spec.version}/AppodealMediationCoreObjC.xcframework", "Appodeal-#{spec.version}/StackAPI.xcframework"
  spec.libraries = "c++", "z"
  spec.swift_versions = "4.0", "4.2", "5.0"

  spec.dependency "StackModules", "~> 1.1.7"
  spec.dependency "StackAnalytics", "~> 1.2.0"
  spec.dependency "StackIAB", "~> 1.5.0"
  spec.dependency "Protobuf", "~> 3.19"

  spec.pod_target_xcconfig = {
    "VALID_ARCHS[sdk=iphoneos*]": "arm64 armv7",
    "VALID_ARCHS[sdk=iphonesimulator*]": "x86_64"
  }

  spec.user_target_xcconfig = {
    "OTHER_LDFLAGS": '-lObjC'
  }
end
