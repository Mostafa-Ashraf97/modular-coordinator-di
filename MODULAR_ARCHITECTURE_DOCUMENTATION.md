# Modular Architecture Documentation

## Overview
This document provides a comprehensive guide to the modular architecture of the Coordinator-based iOS application. The project is structured using Swift Package Manager (SPM) with local packages, following a feature-based modularization approach with dependency injection using Swinject.

## Architecture Principles

### 1. **Feature-Based Modularization**
- Each major feature is a separate SPM package
- Features are self-contained with their own dependencies
- No cross-feature dependencies (except through Common)

### 2. **Dependency Injection Pattern**
- Uses Swinject for dependency injection
- Each package has its own Assembly class for dependency registration
- Factories use Resolver to resolve dependencies directly

### 3. **Coordinator Pattern**
- Navigation logic separated from view logic
- Parent-Child coordinator relationships
- Router handles navigation mechanics

### 4. **MVVM + Coordinator Architecture**
- ViewModels handle business logic
- Interactors handle data operations
- Coordinators handle navigation flow

## Package Structure

### Main App Target
```
Coordinator/
├── App/                           # App-specific files
├── Assembly/                      # Main app assembly
│   └── AppCoordinatorAssembly.swift
├── Assets.xcassets/              # App assets
├── Coordinators/                 # Main app coordinators
│   ├── AppCoordinator.swift
│   ├── AppCoordinatorFactory.swift
│   ├── AppCoordinatorFactoryProtocol.swift
│   └── AppCoordinatorProtocol.swift
└── Supporting Files/             # App lifecycle files
    ├── AppDelegate.swift
    ├── Info.plist
    └── SceneDelegate.swift
```

### Packages Directory
```
Packages/
├── Common/                       # Shared protocols and utilities
├── Authentication/               # Authentication feature
├── Home/                        # Home feature
├── Profile/                     # Profile feature
├── Settings/                    # Settings feature
└── Splash/                      # Splash feature
```

## Package Details

### 1. Common Package
**Purpose**: Shared protocols, models, and utilities used across all features.

**Dependencies**: Swinject

**Structure**:
```
Common/
├── Package.swift
└── Sources/
    └── Common/
        ├── Extensions/
        │   └── NavigationControllerExt.swift
        ├── Models/
        │   └── User.swift
        ├── Protocols/
        │   ├── Container/                    # Empty (container protocols removed)
        │   ├── Coordinators/
        │   │   ├── AppCoordinatorProtocol.swift
        │   │   ├── Authentication/
        │   │   │   └── LoginCoordinatorActions.swift
        │   │   ├── AuthFlowCoordinatorProtocol.swift
        │   │   ├── HomeFlowCoordinatorProtocol.swift
        │   │   ├── ProfileFlowCoordinatorProtocol.swift
        │   │   └── SettingsFlowCoordinatorProtocol.swift
        │   ├── Core/
        │   │   ├── ChildCoordinator.swift
        │   │   ├── Coordinator.swift
        │   │   ├── CoordinatorFinishDelegate.swift
        │   │   └── ParentCoordinator.swift
        │   ├── Factories/
        │   │   ├── Authentication/
        │   │   │   ├── ForgotPasswordViewControllerFactoryProtocol.swift
        │   │   │   ├── LoginViewControllerFactoryProtocol.swift
        │   │   │   └── RegistrationViewControllerFactoryProtocol.swift
        │   │   ├── Coordinator/
        │   │   │   ├── App/
        │   │   │   │   └── AppCoordinatorFactoryProtocol.swift
        │   │   │   ├── Authentication/
        │   │   │   │   └── AuthCoordinatorFactoryProtocol.swift
        │   │   │   ├── Home/
        │   │   │   │   └── HomepageCoordinatorFactoryProtocol.swift
        │   │   │   ├── Profile/
        │   │   │   │   └── ProfileCoordinatorFactoryProtocol.swift
        │   │   │   ├── Settings/
        │   │   │   │   └── SettingsCoordinatorFactoryProtocol.swift
        │   │   │   └── Splash/
        │   │   ├── Home/
        │   │   │   └── HomepageViewControllerFactoryProtocol.swift
        │   │   ├── Profile/
        │   │   │   ├── ProfileDetailsViewControllerFactoryProtocol.swift
        │   │   │   └── ProfileViewControllerFactoryProtocol.swift
        │   │   ├── Settings/
        │   │   │   ├── NotificationSettingsViewControllerFactoryProtocol.swift
        │   │   │   └── SettingsViewControllerFactoryProtocol.swift
        │   │   └── Splash/
        │   │       └── SplashViewControllerFactoryProtocol.swift
        │   ├── Interactors/
        │   │   └── SplashInteractorProtocol.swift
        │   └── Router/
        │       └── Router.swift
        └── Router/
            └── NavigationRouter.swift
```

**Key Files**:
- **Core Protocols**: `ChildCoordinator`, `ParentCoordinator`, `Coordinator`, `CoordinatorFinishDelegate`
- **Router**: `Router` protocol and `NavigationRouter` implementation
- **Factory Protocols**: All view controller and coordinator factory protocols
- **Models**: Shared data models like `User`

### 2. Authentication Package
**Purpose**: Handles user authentication flow (login, registration, forgot password).

**Dependencies**: Common, Swinject

**Structure**:
```
Authentication/
├── Package.swift
└── Sources/
    └── Authentication/
        ├── AuthAssembly.swift              # Swinject assembly
        ├── ForgotPassword/
        │   ├── Coordinators/
        │   │   └── ForgotPasswordCoordinatorActions.swift
        │   ├── Factories/
        │   │   └── ForgotPasswordViewControllerFactory.swift
        │   ├── Interactors/
        │   │   └── ForgotPasswordInteractor.swift
        │   ├── ViewModels/
        │   │   └── ForgotPasswordViewModel.swift
        │   └── Views/
        │       └── ForgotPasswordView.swift
        ├── Login/
        │   ├── Coordinators/
        │   │   └── LoginCoordinatorActions.swift
        │   ├── Factories/
        │   │   └── LoginViewControllerFactory.swift
        │   ├── Interactors/
        │   │   └── LoginInteractor.swift
        │   ├── ViewModels/
        │   │   └── LoginViewModel.swift
        │   └── Views/
        │       └── LoginView.swift
        ├── Registration/
        │   ├── Coordinators/
        │   │   └── RegistrationCoordinatorActions.swift
        │   ├── Factories/
        │   │   └── RegistrationViewControllerFactory.swift
        │   ├── Interactors/
        │   │   └── RegistrationInteractor.swift
        │   ├── ViewModels/
        │   │   └── RegistrationViewModel.swift
        │   └── Views/
        │       └── RegisterView.swift
        └── Shared/
            ├── Container/                  # Empty (container protocols removed)
            ├── Coordinator/
            │   ├── AuthCoordinator.swift
            │   └── AuthCoordinatorFactory.swift
            └── Repository/
                ├── AuthRepository.swift
                └── AuthRepositoryProtocol.swift
```

**Key Features**:
- **Feature-based subfolders**: Login, Registration, ForgotPassword
- **Layer-based subfolders**: Within each feature (Coordinators, Factories, Interactors, ViewModels, Views)
- **Shared components**: Common coordinator and repository logic
- **Swinject Assembly**: `AuthAssembly` registers all dependencies

### 3. Home Package
**Purpose**: Main home screen and navigation hub.

**Dependencies**: Common, Profile, Settings, Swinject

**Structure**:
```
Home/
├── Package.swift
└── Sources/
    ├── Home/
    │   ├── Container/                     # Empty (container protocols removed)
    │   ├── CoordinatorActions/
    │   │   └── HomepageCoordinatorActions.swift
    │   ├── Factories/
    │   │   └── HomepageViewControllerFactory.swift
    │   ├── Interactors/
    │   │   └── HomepageInteractor.swift
    │   ├── ViewModels/
    │   │   └── HomepageViewModel.swift
    │   └── Views/
    │       └── HomepageView.swift
    ├── HomepageAssembly.swift            # Swinject assembly
    ├── HomepageCoordinator.swift
    └── HomepageCoordinatorFactory.swift
```

**Key Features**:
- **Parent Coordinator**: Can navigate to Profile and Settings
- **Cross-feature dependencies**: Depends on Profile and Settings packages
- **Assembly**: `HomepageAssembly` registers dependencies

### 4. Profile Package
**Purpose**: User profile management.

**Dependencies**: Common, Swinject

**Structure**:
```
Profile/
├── Package.swift
└── Sources/
    └── Profile/
        ├── Container/                    # Empty (container protocols removed)
        ├── Profile/
        │   ├── CoordinatorActions/
        │   │   └── ProfileCoordinatorActions.swift
        │   ├── Factories/
        │   │   └── ProfileViewControllerFactory.swift
        │   ├── Interactors/
        │   │   └── ProfileInteractor.swift
        │   ├── ViewModels/
        │   │   └── ProfileViewModel.swift
        │   └── Views/
        │       └── ProfileView.swift
        ├── ProfileDetails/
        │   ├── Factories/
        │   │   └── ProfileDetailsViewControllerFactory.swift
        │   ├── ViewModels/
        │   │   └── ProfileDetailsViewModel.swift
        │   └── Views/
        │       └── ProfileDetailsView.swift
        ├── ProfileAssembly.swift         # Swinject assembly
        ├── ProfileCoordinator.swift
        └── ProfileCoordinatorFactory.swift
```

**Key Features**:
- **Multiple screens**: Profile and ProfileDetails
- **Feature-based organization**: Each screen has its own folder
- **Assembly**: `ProfileAssembly` registers dependencies

### 5. Settings Package
**Purpose**: App settings and configuration.

**Dependencies**: Common, Swinject

**Structure**:
```
Settings/
├── Package.swift
└── Sources/
    ├── NotificationSettings/
    │   ├── Factories/
    │   │   └── NotificationSettingsViewControllerFactory.swift
    │   ├── ViewModels/
    │   │   └── NotificationSettingsViewModel.swift
    │   └── Views/
    │       └── NotificationSettingsView.swift
    ├── Settings/
    │   ├── Container/                   # Empty (container protocols removed)
    │   ├── CoordinatorActions/
    │   │   └── SettingsCoordinatorActions.swift
    │   ├── Factories/
    │   │   └── SettingsViewControllerFactory.swift
    │   ├── Interactors/
    │   │   └── SettingsInteractor.swift
    │   ├── ViewModels/
    │   │   └── SettingsViewModel.swift
    │   └── Views/
    │       └── SettingsView.swift
    ├── SettingsAssembly.swift           # Swinject assembly
    ├── SettingsCoordinator.swift
    └── SettingsCoordinatorFactory.swift
```

**Key Features**:
- **Multiple screens**: Settings and NotificationSettings
- **Feature-based organization**: Each screen has its own folder
- **Assembly**: `SettingsAssembly` registers dependencies

### 6. Splash Package
**Purpose**: App launch screen and initial routing logic.

**Dependencies**: Common, Swinject

**Structure**:
```
Splash/
├── Package.swift
└── Sources/
    ├── Splash/
    │   ├── Container/                   # Empty (container protocols removed)
    │   ├── CoordinatorActions/
    │   │   └── SplashCoordinatorActions.swift
    │   ├── Factories/
    │   │   └── SplashViewControllerFactory.swift
    │   ├── Interactors/
    │   │   └── SplashInteractor.swift
    │   ├── ViewModels/
    │   │   └── SplashViewModel.swift
    │   └── Views/
    │       └── SplashView.swift
    └── SplashAssembly.swift             # Swinject assembly
```

**Key Features**:
- **Single screen**: Splash screen
- **Initial routing**: Determines whether to show auth or home
- **Assembly**: `SplashAssembly` registers dependencies

## Dependency Injection Architecture

### Swinject Assembly Pattern
Each package has an Assembly class that conforms to Swinject's `Assembly` protocol:

```swift
public final class XxxAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        registerInteractors(in: container)
        registerViewControllerFactories(in: container)
        registerCoordinatorFactory(in: container)
    }
    
    // Private registration methods...
}
```

### Factory Pattern with Resolver
All factories that need dependencies use a `Resolver` property:

```swift
public final class XxxViewControllerFactory: XxxViewControllerFactoryProtocol {
    private let resolver: Resolver
    
    public init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    public func makeXxxViewController(coordinator: XxxCoordinatorActions) -> UIViewController {
        let interactor = resolver.resolve(XxxInteractorProtocol.self)!
        // ... rest of implementation
    }
}
```

### Main App Assembly Loading
The main app loads all assemblies in `SceneDelegate`:

```swift
private func loadAssembler() {
    let featureModules: [Assembly] = [
        AuthAssembly(),
        ProfileAssembly(),
        SettingsAssembly(),
        SplashAssembly(),
        HomepageAssembly()
    ]
    
    let appModules: [Assembly] = [
        AppCoordinatorAssembly()
    ]
    
    appAssembler = Assembler()
    appAssembler.apply(assemblies: featureModules + appModules)
}
```

## Key Architectural Decisions

### 1. **No Container Protocols**
- Removed all container protocol abstractions
- Factories resolve dependencies directly using Swinject Resolver
- Cleaner, more direct dependency injection

### 2. **Feature-Based Organization**
- Each major feature is a separate SPM package
- Within each feature, screens are organized by feature name
- Within each screen, files are organized by layer (Coordinators, Factories, etc.)

### 3. **Protocol-First Design**
- All factory protocols defined in Common package
- Concrete implementations in respective feature packages
- Clear separation of interface and implementation

### 4. **Coordinator Pattern Implementation**
- Parent-Child coordinator relationships
- Router handles navigation mechanics
- Coordinators handle flow logic

### 5. **MVVM + Coordinator**
- ViewModels handle business logic
- Interactors handle data operations
- Views are SwiftUI-based
- Coordinators handle navigation

## Package Dependencies

```
Common (no dependencies on other packages)
├── Swinject

Authentication
├── Common
└── Swinject

Profile
├── Common
└── Swinject

Settings
├── Common
└── Swinject

Splash
├── Common
└── Swinject

Home
├── Common
├── Profile
├── Settings
└── Swinject

Main App
├── Common
├── Authentication
├── Home
├── Profile
├── Settings
├── Splash
└── Swinject
```

## File Naming Conventions

### Protocols
- `XxxProtocol.swift` - Interface definitions
- `XxxCoordinatorActions.swift` - Coordinator action protocols
- `XxxViewControllerFactoryProtocol.swift` - Factory protocols

### Implementations
- `XxxCoordinator.swift` - Coordinator implementations
- `XxxViewControllerFactory.swift` - Factory implementations
- `XxxInteractor.swift` - Business logic implementations
- `XxxViewModel.swift` - View model implementations
- `XxxView.swift` - SwiftUI view implementations

### Assemblies
- `XxxAssembly.swift` - Swinject assembly classes

## Migration Guide

To replicate this structure in another project:

1. **Create SPM Packages**: Create local packages for each feature
2. **Set up Common Package**: Define all shared protocols and models
3. **Implement Swinject Assembly**: Create assembly classes for dependency injection
4. **Organize by Feature**: Use feature-based organization within packages
5. **Use Resolver Pattern**: Implement factories with Resolver dependency injection
6. **Define Protocols in Common**: Keep all factory and coordinator protocols in Common
7. **Implement Coordinator Pattern**: Use parent-child coordinator relationships
8. **Remove Container Protocols**: Use direct Resolver injection instead

This architecture provides a clean, maintainable, and scalable structure for iOS applications using the Coordinator pattern with Swift Package Manager.
