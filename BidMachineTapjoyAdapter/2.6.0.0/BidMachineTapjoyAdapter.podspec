Pod::Spec.new do |spec|
  sourceName               = "BidMachineTapjoyAdapter"
  adapterPath              = "0"
  sdkPath                  = "2.6.0"
  networkVersion           = "12.11.1"

  spec.name                = "#{sourceName}"
  spec.version             = "#{sdkPath}.#{adapterPath}"
  spec.summary             = "Bidmachine adapter for Tapjoy"

  spec.homepage            = "https://bidmachine.io"
  spec.license             = { :type => 'Commercial', :text => 'https://bidmachine.io/sdk-license-agreement/' }
  spec.author              = { "Stack" => "https://explorestack.com/bidmachine/" }

  spec.platform            = :ios, "12.0"
  spec.swift_version       = "5.1"

  spec.pod_target_xcconfig = {
    "VALID_ARCHS": "arm64 x86_64",
    "VALID_ARCHS[sdk=iphoneos*]": "arm64",
    "VALID_ARCHS[sdk=iphonesimulator*]": "arm64 x86_64"
  }
  spec.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

  spec.source = { :http => "https://s3-us-west-1.amazonaws.com/appodeal-ios/BidMachineAdaptors/#{sourceName}/#{spec.version}/#{sourceName}.zip" }
  spec.vendored_frameworks = "#{sourceName}.xcframework"

  spec.dependency "BidMachine", "~> #{sdkPath}.0"
  spec.dependency "TapjoySDK", "#{networkVersion}"
end
