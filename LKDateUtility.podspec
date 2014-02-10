Pod::Spec.new do |s|
  s.name         = "LKDateUtility"
  s.version      = "0.9.9"
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
  s.resource = "Resources/LKDateUtility-Resources.bundle"

  def s.post_install(target)
    puts "\nGenerating LKDateUtility resources bundle\n".yellow if config.verbose?
    Dir.chdir File.join(config.project_pods_root, 'LKDateUtility') do
      command = "xcodebuild -project LKDateUtility.xcodeproj -target LKDateUtility-Resources CONFIGURATION_BUILD_DIR=../Resources"
      command << " 2>&1 > /dev/null" unless config.verbose?
      unless system(command)
        raise ::Pod::Informative, "Failed to generate LKDateUtility resources bundle"
      end
    end

    File.open(File.join(config.project_pods_root, target.target_definition.copy_resources_script_name), 'a') do |file|
      file.puts "install_resource 'Resources/LKDateUtility-Resources.bundle'"
    end
  end
end

