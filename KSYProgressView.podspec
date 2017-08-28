Pod::Spec.new do |s|
  s.name         = "KSYProgressView"
  s.version      = "1.0"
  s.summary      = "Prgoress bar support circle and line style."
  s.description  = "🚀 A progress bar has color animation, support circle and line style."
  s.homepage     = "https://github.com/huangdaxiaEX/KSYProgressView/"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "huangdaxia" => "527548875@qq.com" }
  s.source       = { :git => "https://github.com/huangdaxiaEX/KSYProgressView.git", :tag => "#{s.version}" }
  s.source_files = "KSYProgressView/KSYProgressView/Progress/*.{swift}"
  s.ios.deployment_target = '8.0'
end