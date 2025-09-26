# 🌬️ air_quality_app

A Flutter-based **Air Quality Monitoring application** that allows users to check real-time air quality data, track historical values, and save preferences locally.  
Built using **Flutter**, **BLoC**, **Dio**, and **Hive** for local storage.

---

## 🚀 Features

- 🌐 Fetch real-time air quality data from APIs using `dio`
- 📊 Display historical trends and statistics
- 💾 Save favorite locations locally using Hive
- 🔄 State management with **BLoC/Cubit**
- ⚡ Fast, lightweight, and offline-ready
- 🛠️ Modular and scalable architecture

---

## 📦 Dependencies

Key packages used in this project:

- [`dio`](https://pub.dev/packages/dio) → Networking for API requests
- [`flutter_pretty_dio_logger`](https://pub.dev/packages/flutter_pretty_dio_logger) → Dio request logging
- [`bloc`](https://pub.dev/packages/bloc) → State management
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) → Flutter integration for BLoC
- [`go_router`](https://pub.dev/packages/go_router) → Navigation
- [`hive`](https://pub.dev/packages/hive) → Local database for storing preferences
- [`hive_flutter`](https://pub.dev/packages/hive_flutter) → Flutter integration for Hive
- [`equatable`](https://pub.dev/packages/equatable) → Simplifies value comparisons for state management
- [`intl`](https://pub.dev/packages/intl) → Date and time formatting
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) → iOS-style icons

---

## 🏗️ Project Structure

- `core/` → Services, constants, API utilities, Hive setup
- `features/` → Air quality modules (models, UI, BLoC, Hive adapters)
- `shared/` → Common widgets, themes, and helper functions
- `main.dart` → Application entry point

---

## 📱 Download APK

👉 [Click here to download air_quality_app APK](https://github.com/Pugalesh-KM/air_quality_app/blob/main/assets/apk/air_quality_app.apk)


---

## ▶️ Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/Pugalesh-KM/air_quality_app.git
cd air_quality_app
