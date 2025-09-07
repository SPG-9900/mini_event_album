# Mini Event Album

A Flutter application that demonstrates UI, API integration, state management, and Git workflow for a mini event album.

## Features

- **Authentication Screen**: "Continue with Google" button with simulated login and loading indicator.
- **Event List**: Scrollable list of events, displaying event names and album thumbnails.
- **Albums & Photos**: Grid view of photos within an album, with a full-screen photo viewer and a like button.

## Technical Details

- **Framework**: Flutter
- **UI**: Material Design components
- **State Management**: Riverpod
- **API Integration**: Data fetched from a static JSON file (`assets/data/mock_data.json`)

## Getting Started

### Prerequisites

- Flutter SDK installed. Follow the instructions [here](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd mini_event_album
   ```
2. Get Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## Mock API Details

The application uses a static JSON file located at `assets/data/mock_data.json` to simulate API responses. This file contains a list of events, each with an `id`, `createdAt`, `name`, `thumbnail` URL, and a list of `photos` URLs.

Example structure of `mock_data.json`:

```json
[
  {
    "id": "1",
    "createdAt": "2025-09-06T18:00:00Z",
    "name": "Event Name #1",
    "thumbnail": "https://picsum.photos/200/300?random=1",
    "photos": [
      "https://picsum.photos/300/300?random=1",
      "https://picsum.photos/300/300?random=2"
    ]
  }
]
```

## Folder Structure

```
lib/
├── core/             # Core functionalities like theme
│   └── theme/
├── features/         # Feature-specific modules (e.g., events, likes)
│   ├── events/
│   │   ├── models/
│   │   ├── providers/
│   │   └── repositories/
│   └── likes/
│       └── providers/
├── Screens/          # UI screens
│   ├── album_screen.dart
│   ├── auth_screen.dart
│   ├── event_screen.dart
│   ├── loading_screen.dart
│   ├── main_navigation_screen.dart
│   ├── photo_screen.dart
│   └── profile_screen.dart
├── shared/           # Shared widgets and providers
│   ├── providers/
│   └── widgets/
└── main.dart         # Main entry point of the application
```
