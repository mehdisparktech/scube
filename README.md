# Scube - Control & Monitoring System

<div align="center">
  <img src="assets/images/scube_logo.png" alt="Scube Logo" width="120" height="120">
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.10.3-blue.svg)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-3.10.3-blue.svg)](https://dart.dev/)
  [![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
</div>

## 📖 Overview

**Scube** is a modern Flutter-based solar energy control and monitoring system that enables real-time tracking of power generation, performance metrics, and energy statistics for solar plants. Built with Clean Architecture principles and powered by Riverpod, it provides intuitive dashboards with interactive charts, weather integration, and comprehensive analytics for efficient solar plant management.

### Key Highlights

- 🌞 **Real-time Solar Monitoring** - Live tracking of AC power, plant generation, and performance metrics
- 📊 **Data Visualization** - Interactive charts and graphs for energy analytics
- 🌡️ **Weather Integration** - Temperature, wind speed, and solar irradiation data
- 📱 **Cross-platform** - Runs seamlessly on Android, iOS, Web, and Desktop
- 🏗️ **Clean Architecture** - Maintainable and scalable codebase following best practices
- ⚡ **State Management** - Powered by Riverpod for reactive state management

## ✨ Features

### 🎯 Core Features

- **Authentication System**
  - Secure login with token-based authentication
  - Session management with persistent storage
  
- **Dashboard**
  - Real-time power monitoring (AC Power, Plant Generation)
  - Performance Ratio tracking (Live PR, Cumulative PR)
  - Energy statistics (Total Energy, Today Energy, Return PV)
  - Weather data visualization (Temperature, Wind Speed, Irradiation)
  - Comparative analytics (Yesterday vs Today metrics)
  
- **Advanced Monitoring**
  - Donut charts for power distribution
  - Source/Load toggle views
  - Multi-source monitoring (Solar, Generator, Natural Gas, Water Process)
  - Plant summary and analysis tools

- **User Interface**
  - Responsive design with Flutter ScreenUtil
  - Material Design 3 components
  - Smooth animations and transitions
  - Custom theme with gradient support
  - SVG and PNG asset support

## 🛠️ Tech Stack

### Core Technologies

| Category | Technology | Version |
|----------|-----------|---------|
| **Framework** | Flutter | 3.10.3 |
| **Language** | Dart | 3.10.3 |
| **State Management** | Riverpod | 3.2.0 |
| **Routing** | GoRouter | 17.0.1 |
| **HTTP Client** | Dio | 5.8.0+1 |
| **Local Storage** | SharedPreferences | 2.5.3 |

### Key Dependencies

```yaml
# State Management
flutter_riverpod: ^3.2.0
riverpod_annotation: ^4.0.1

# Networking
dio: ^5.8.0+1
pretty_dio_logger: ^1.4.0

# UI & Design
flutter_screenutil: ^5.9.3
flutter_svg: ^2.2.0
google_fonts: ^6.2.1
cached_network_image: ^3.4.1
fluentui_system_icons: ^1.1.273

# Utilities
equatable: ^2.0.8
mime: ^2.0.0
```

## 🏗️ Architecture

The project follows **Clean Architecture** principles with a feature-based structure:

```
lib/
├── app/
│   ├── core/              # Core functionality
│   │   ├── config/        # App configuration (API endpoints)
│   │   ├── constants/     # App-wide constants (colors, images, strings)
│   │   ├── notifier/      # Base notifier and state classes
│   │   ├── services/      # Core services (storage, etc.)
│   │   └── utils/         # Utility functions and helpers
│   │
│   ├── features/          # Feature modules
│   │   ├── auth/          # Authentication feature
│   │   ├── dashboard/     # Dashboard feature
│   │   └── splash/        # Splash screen feature
│   │
│   ├── route/             # Navigation configuration
│   ├── shared/            # Shared components
│   └── theme/             # App theming
│
└── main.dart              # Application entry point
```

### Feature Structure

Each feature follows a layered architecture:

```
feature/
├── data/
│   ├── datasources/       # Remote and local data sources
│   ├── models/            # Data models (DTOs)
│   ├── mappers/           # Model-Entity mappers
│   └── repositories/      # Repository implementations
│
├── domain/
│   ├── entity/            # Business entities
│   ├── repository/        # Repository interfaces
│   └── usecase/           # Business logic use cases
│
└── presentation/
    ├── provider/          # Riverpod providers
    │   ├── notifier/      # State notifiers
    │   └── state/         # State classes
    ├── screen/            # UI screens
    └── widget/            # Feature-specific widgets
```

## 📁 Project Structure

```
scube/
├── assets/
│   ├── images/            # PNG/JPG images
│   └── icons/             # SVG icons
│
├── lib/
│   └── app/               # Application code
│
├── android/               # Android platform files
├── ios/                   # iOS platform files
├── web/                   # Web platform files
├── linux/                 # Linux platform files
├── macos/                 # macOS platform files
└── windows/               # Windows platform files
```

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (>= 3.10.3)
- **Dart SDK** (>= 3.10.3)
- **Android Studio** / **VS Code** with Flutter extensions
- **Xcode** (for iOS development, macOS only)
- **Git**

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd scube
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### Android

1. Open `android/app/build.gradle.kts`
2. Configure signing keys for release builds
3. Set minimum SDK version (check `android/app/build.gradle.kts`)

#### iOS

1. Navigate to `ios/` directory
2. Run `pod install`
3. Configure signing in Xcode

#### Web

1. Enable web support:

   ```bash
   flutter config --enable-web
   ```

2. Run:

   ```bash
   flutter run -d chrome
   ```

## ⚙️ Configuration

### API Configuration

Update the API endpoints in `lib/app/core/config/api/api_end_point.dart`:

```dart
class ApiEndPoint {
  static const baseUrl = "http://your-api-url.com/api/v1/";
  static const imageUrl = "http://your-api-url.com";
  static const socketUrl = "http://your-api-url.com";
}
```

### Environment Variables

For different environments (dev, staging, production), consider using:

- `flutter_dotenv` package
- Environment-specific configuration files

## 📱 Usage

### Authentication

1. Launch the app
2. Enter your credentials on the login screen
3. The app will automatically navigate to the dashboard upon successful authentication

### Dashboard Navigation

- **Primary Dashboard**: View main metrics and statistics
- **Secondary Dashboard**: Detailed analytics with charts and source/load toggles
- **Analysis Tools**: Access various analysis and reporting features

### Features Access

- Tap on grid items to access different monitoring features:
  - Analysis Pro
  - Generator Monitoring
  - Plant Summary
  - Natural Gas Monitoring
  - Water Process Monitoring

## 🧪 Testing

Run tests with:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 🎨 Theming

The app uses a custom theme defined in `lib/app/theme/light_theme.dart`. Key color constants are available in `lib/app/core/constants/app_colors.dart`:

- Primary: `#0096FC`
- Gradient Colors: `#2E63F7` to `#B982D9`
- Background: `#F5F5F5`

## 📦 Building for Production

### Android

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style

- Follow Flutter's official style guide
- Use `flutter_lints` for linting (already configured)
- Write meaningful commit messages
- Add comments for complex logic

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Authors

- **Your Name** - *Initial work* - [YourGitHub](https://github.com/yourusername)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod team for excellent state management
- All open-source contributors whose packages made this project possible

## 📞 Support

For support, email <your-email@example.com> or open an issue in the repository.

---

<div align="center">
  Made with ❤️ using Flutter
</div>
