# Nomad Journal 🌍✈️

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Design](https://img.shields.io/badge/Design-High%20Fidelity-ff69b4?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey?style=for-the-badge)

> **Immersive Travel Storytelling.**

Nomad Journal is a high-fidelity mobile application designed to bridge the gap between utility and editorial design. Unlike standard travel trackers, Nomad focuses on the *narrative* of the journey, utilizing custom parallax scrolling architectures, interactive map plotting, and magazine-style typography.

Built entirely with **Flutter**, this project demonstrates advanced UI composition, sliver animations, and a responsive "Dark Mode" aesthetic.

---

## 📸 Interface Preview

| **Dashboard** |
|:---:|
| <img src="assets/Nomad UI.png" width="250" /> |

## 🚀 Key Features

* **Editorial UI System:** A typography-first design approach using **Playfair Display** (Serif) for headings and **Lato** (Sans-Serif) for body text to mimic high-end travel magazines.
* **Sliver Parallax Engine:** Custom `SliverAppBar` implementation that creates depth by moving background images at a slower speed than foreground content during scrolling.
* **Interactive Map Layers:** A stylized dark-mode map widget (`Stack` + `Positioned`) with custom plotting pins and floating action overlays.
* **Multimedia Cards:** "Live Photo" style widgets that simulate video playback integration within the timeline.
* **Sunset Theme:** A carefully calibrated dark theme (`#121212`) with "Sunset Orange" (`#FF6B35`) accents for visual warmth.

---

## 🛠 Tech Stack

* **Framework:** Flutter (v3.x)
* **Language:** Dart
* **Packages:**
    * `google_fonts`: For custom typography.
    * `iconsax`: For modern, outlined iconography.
* **Architecture:** Monolithic MVP (Single-file architecture for rapid prototyping and easy code review).

---

## ⚡ Getting Started

This project is a self-contained UI prototype. You can run the entire application from the `main.dart` file without complex backend setup.

### Prerequisites
* Flutter SDK installed
* VS Code or Android Studio
* iOS Simulator or Android Emulator

### Installation

1.  **Clone the repository**
    ```bash
    git clone [https://github.com/FakhareArjumand/nomad-journal-flutter.git](https://github.com/FakhareArjumand/nomad-journal-flutter.git)
    ```

2.  **Navigate to project directory**
    ```bash
    cd nomad-journal-flutter
    ```

3.  **Install dependencies**
    ```bash
    flutter pub get
    ```

4.  **Run the app**
    ```bash
    flutter run lib/main.dart
    ```

---

## 📂 Project Structure

```text
lib/
└── main.dart           # Contains all UI logic, Theme Data, and Slivers
assets/                 # Static images for the README (Screenshots)
android/                # Android native configuration
ios/                    # iOS native configuration
```
## 👤 Author

**Fakhar e Arjumand**
* 💻 **Flutter Developer & UI/UX Designer**
* 🌐 **GitHub:** https://github.com/FakhareArjumand
* 👔 **LinkedIn:** https://www.linkedin.com/in/fakhar-e-arjumand-b9a1bb319/
* 📧 **Contact:** fakharearjumand.work@gmail.com

---
