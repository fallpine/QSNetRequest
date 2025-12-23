Pod::Spec.new do |spec|
  spec.name         = "QSNetRequest"
  spec.version      = "1.0.1"
  spec.summary      = "网络请求工具类"
  spec.description  = "基于Alamofire的网络请求工具类"
  spec.homepage     = "https://github.com/fallpine/QSNetRequest"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "QiuSongChen" => "791589545@qq.com" }
  spec.ios.deployment_target     = "15.0"
  spec.watchos.deployment_target = "8.0"
  spec.source       = { :git => "https://github.com/fallpine/QSNetRequest.git", :tag => "#{spec.version}" }
  spec.swift_version = '5'
  spec.source_files  = "QSNetRequest/QSNetRequest/Tool/*.{swift}"
  spec.dependency "QSJsonParser"
  spec.dependency "Alamofire"
end
