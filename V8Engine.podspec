Pod::Spec.new do |s|
  s.name           = 'V8Engine'
  s.module_name    = 'V8Engine'
  s.version        = '1.0.0'
  s.summary        = 'A Swift package for all iOS applications.'
  s.homepage       = 'https://github.com/YazanQ/V8-engine'
  s.license        = { type: 'MIT', file: 'LICENSE.md' }
  s.author         = { 'Author' => 'Yazan Qaisi' }
  s.source         = { git: 'https://github.com/YazanQ/V8-engine.git', tag: s.version.to_s }
  s.preserve_paths = [
    'Sources/Configuration/GitHooks/install.sh',
    'Sources/Configuration/GitHooks/pre-commit.sh',
    'Sources/Configuration/SwiftFormat/format.sh',
    'Sources/Configuration/SwiftFormat/.swiftformat',
    'Sources/Configuration/SwiftGen/generate.sh',
    'Sources/Configuration/SwiftGen/swiftgen.yml',
    'Sources/Configuration/SwiftGen/l10n-template.stencil',
    'Sources/Configuration/SwiftLint/lint.sh',
    'Sources/Configuration/SwiftLint/.swiftlint.yml',
    'Sources/Configuration/Xcode/xcode-settings.sh'
  ]
end
