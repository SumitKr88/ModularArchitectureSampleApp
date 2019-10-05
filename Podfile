# sources
source 'https://github.com/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# global config
platform :ios, '11.0'
use_frameworks!
workspace 'ModularizeApp'

# methods to ensure the same version of each library is used across targets
def networkAndParsingPods
  pod 'JSONUtilities', '5.0.0'
  pod 'Alamofire', '~> 5.0.0-beta.5'
end

def uiPods
  pod 'MBProgressHUD', '~> 1.1.0'
end

def project_path(projectName)
  return "./Features/#{projectName}/#{projectName}"
end

target 'ModularizeApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for ModularizeApp
  networkAndParsingPods
  uiPods
  target 'ModularizeAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ModularizeAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end

target 'Core' do
  project project_path("Core")
  networkAndParsingPods
  target 'CoreTests' do
  end
end

target 'Feature1' do
  project project_path("Feature1")
  uiPods
  target 'Feature1Tests' do
  end
end

target 'Feature2' do
  project project_path("Feature2")
  networkAndParsingPods
  target 'Feature2Tests' do
  end
end

target 'UI' do
  project project_path("UI")
  uiPods
  target 'UITests' do
  end
end
