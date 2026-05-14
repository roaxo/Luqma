# 🥙 Luqma

> Arabic food delivery UI — smooth navigation, live maps, and RTL-first design.

---

## About

Luqma is a Flutter UI project for an Arabic food delivery experience. It features full RTL support with Arabic typography, interactive map-based delivery tracking using both Google Maps and MapLibre GL, and a polished component-driven interface with carousels, rating systems, and image picking.

---

## Tech Stack

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/State-GetX-blueviolet?style=flat)
![Google Maps](https://img.shields.io/badge/Maps-Google%20Maps%20%2B%20MapLibre-4285F4?style=flat)

---

## Highlights

- **Dual map integration** — `google_maps_flutter` for delivery flow + `maplibre_gl` for custom tile rendering and OpenStreetMap support
- **Custom map markers** via `custom_map_markers`, allowing branded food/location pins on the map
- **RTL-native UI** — built with `Noto Kufi Arabic` font family (Regular → ExtraBold) for authentic Arabic typography
- **Rich UI components** — horizontal carousels (`carousel_slider`), star ratings (`flutter_rating_bar`), and image upload (`image_picker`)
- **Location-aware** — real-time user location via `geolocator` with timezone handling via `flutter_timezone`

---

## State Management

**GetX `^4.7.3`** — used for reactive state, navigation, and dependency injection across the app.

---

## Map Integration

| Package | Role |
|---|---|
| `google_maps_flutter ^2.14.0` | Primary delivery map with markers and routes |
| `maplibre_gl ^0.25.0` | OpenStreetMap tile rendering, custom map styles |
| `custom_map_markers ^0.0.2+1` | Custom-styled location/food pins on map |
| `geolocator ^14.0.2` | Live user location tracking |

---

## Notable Packages

| Package | Purpose |
|---|---|
| `carousel_slider ^5.1.1` | Featured items / category banners |
| `flutter_rating_bar ^4.0.1` | Restaurant & item star ratings |
| `image_picker ^1.2.1` | Profile / food image upload |
| `flutter_easyloading ^3.0.5` | Loading overlays |
| `shared_preferences ^2.1.2` | Lightweight local persistence |
| `intl ^0.19.0` | Date/number localization |
| `flutter_timezone ^5.0.1` | Timezone-aware scheduling |

---

## Getting Started

```bash
git clone https://github.com/roaxo/Luqma.git
cd Luqma
flutter pub get
flutter run
```

> Requires Flutter SDK `^3.9.2`. Add your Google Maps API key to `AndroidManifest.xml` and `AppDelegate.swift` before running.

---

