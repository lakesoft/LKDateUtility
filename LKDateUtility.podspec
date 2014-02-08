Pod::Spec.new do |s|
  s.name         = "LKDateUtility"
  s.version      = "0.9.2"
  s.summary      = "Date utility library"
  s.description  = <<-DESC
Date utility library.
                   DESC
  s.homepage     = "https://github.com/lakesoft/LKDateUtility"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Hiroshi Hashiguchi" => "xcatsan@mac.com" }
  s.source       = { :git => "https://github.com/lakesoft/LKDateUtility", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*'

end
