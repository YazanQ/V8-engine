
# V8Engine Kit

Generic Micro-services Framework compatible with All Apple OS

<p align="justify">
    <img src="https://img.shields.io/badge/Swift-6-orange.svg" />
    <img src="https://img.shields.io/badge/Platforms-iOS%20%7C%20watchOS-blue.svg?style=flat" />
</p>

## Tools
- [Brew](https://github.com/Homebrew/brew) - The missing package manager for macOS.
- [SPM](https://swift.org/package-manager) - A tool for automating the distribution of Swift code and is integrated into the swift compiler.
- [Resolver](https://github.com/hmlongco/Resolver) - An ultralight Dependency Injection / Service Locator framework for Swift 5.x on iOS.

You can see all of them in `Package.swift` file.

## Targets

Overview for each Target

- **APIClient**: <br />
    Injectable API Layer can be used in any project
- **FirebaseClient**: <br />
    Layers built-in with Firebase to help add any Firebase technology with simple steps
- **Configuration**: <br />
    Scripts and custom configuration for the Env and the project (GitHooks, SwiftGen... etc)
- **Core**: <br />
    Engines, Core Protocols and layers for the development.
- **Store**: <br />
    how we will save the data locally or remotely
- **UI**: <br />
    extensions, layers, customization and all the common and useful technology for UI are here


## Environment Variables

To run this project, you will need to do the following:

- (Some Case) sometimes your mac will deny any custom scripts to run locally, so you will need to do the following in the files scripts:
    
    1- Navigate in each file in  Configuration e.x (cd Source/Configuration/GitHooks)
    
    2- run the following Terminal command: `chomd u+x` this will allow the scripts to run and configure the evn in xcode (e.x: `chmod u+x install.sh)`

After that you ready to go.

PLEASE NOTE: This framework is not only for one project, so any modification or service we need to add we should do it generically and it should be reused and able to customize in the project.

## Installation

### Dependencies

Install Kit with SPM

```bash
  dependencies: [
        .package(url: "https://github.com/YazanQ/V8-engine.git", branch: "main")
    ]
```
    
