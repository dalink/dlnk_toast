require_relative "lib/dlnk_toast/version"

Gem::Specification.new do |spec|
  spec.name        = "dlnk_toast"
  spec.version     = DlnkToast::VERSION
  spec.authors     = ["Cyril"]
  spec.email       = ["contact@dlnk.fr"]
  spec.homepage    = "https://github.com/cyril/dlnk_toast"
  spec.summary     = "Hotwire toast notifications for Rails"
  spec.description = "Flash-based toast notifications using Stimulus and vanilla CSS for Rails 7+ applications"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata = {
    "rubygems_mfa_required" => "true",
    "homepage_uri"          => spec.homepage,
    "source_code_uri"       => "#{spec.homepage}.git",
    "bug_tracker_uri"       => "#{spec.homepage}/issues",
    "changelog_uri"         => "#{spec.homepage}/blob/main/CHANGELOG.md"
  }

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["app/**/*", "config/**/*", "lib/**/*", "LICENSE*", "README*", "CHANGELOG*", "*.md"]
  end

  spec.add_dependency "railties", ">= 7.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rails", ">= 7.0"
end
