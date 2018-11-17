# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "k636174-jekyll"
  spec.version       = "0.1.0"
  spec.authors       = ["Shinji Kaneko"]
  spec.email         = ["shinji@k636174.net"]

  spec.summary       = "Blog template for k636174"
  spec.homepage      = "https://blog.k636174.net/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 3.8"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.0"
end
