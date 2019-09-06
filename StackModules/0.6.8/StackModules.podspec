Pod::Spec.new do |s|
  s.name         = "StackModules"
  s.version      = "0.6.8"
  s.summary      = "Supported modules for Stack iOS products"

  s.description  = <<-DESC
                   Supported modules for Stack iOS products. Used in Appodeal, BidMachine and DataCore
                   DESC

  s.homepage     = "http://www.appodeal.com"


  s.license      = { :type => 'GPL 3.0', :file => 'LICENSE' }
  s.author       = { "Stack" => "http://www.explorestack.com" }

  s.platform     = :ios, '9.0'
  s.source       = { :http => "https://s3-us-west-1.amazonaws.com/appodeal-ios/StackModules/v#{s.version}/StackModules.zip" }

  s.default_subspec = "StackUIKit"
  s.swift_version = '4.2'
  
  s.subspec 'StackFoundation' do |ss|
    ss.vendored_frameworks = 'StackFoundation.framework'
    ss.library = 'z'
    ss.frameworks = 'SafariServices', 'StoreKit', 'WebKit', 'CoreTelephony', 'SystemConfiguration', 'AdSupport', 'CoreLocation'
  end

  s.subspec 'StackUIKit'  do |ss|
    ss.vendored_frameworks = 'StackUIKit.framework'
    ss.dependency'StackModules/StackFoundation'
  end

  s.subspec 'StackConsentDialog'  do |ss|
    ss.vendored_frameworks = 'StackConsentDialog.framework'
    ss.source_files = 'Dummy.swift'
    ss.dependency 'StackModules/StackFoundation'
    ss.dependency 'StackModules/StackUIKit'
    ss.dependency 'PersonalizedAdConsent', '~> 1.0'
  end
end
