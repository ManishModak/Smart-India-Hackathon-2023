# Smart India Hackathon - Rescue Coordination Application

## Overview

This Flutter application is designed to help rescue agencies coordinate their efforts during disasters. The app centralizes information, displays it on an interactive map, and provides communication tools to enhance collaboration.

## Features

- **Central Database:** Register rescue agencies with details like location, contact information, and expertise.
- **Interactive Map:** View all registered agencies on a map with filters for specific criteria.
- **Communication Tools:** Send alerts, requests, and collaborate on shared resources.
- **Security:** Ensure data privacy and access control for authorized users only.

## Screenshots

Include screenshots of your app to give users a visual understanding of what the app looks like.

### Home Page
![Home Page](./screenshots/home_page.png)

### Login Page
![Login Page](./screenshots/login_page.png)

### Help Page
![Help Page](./screenshots/help_page.png)

**How to Add Screenshots:**
1. **Take Screenshots:** Capture screenshots of your app using a device or an emulator.
2. **Organize Screenshots:** Create a folder named `screenshots` in the root of your project directory.
3. **Add to GitHub:** Place the screenshots inside this folder.
4. **Reference in README:** Use Markdown syntax to add the screenshots to your README file. The format is:
   ```markdown
   ![Alt Text](./screenshots/filename.png)
   ```

## Getting Started

### Prerequisites

- **Flutter SDK:** Install Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install).
- **Android Studio or VS Code:** Set up your preferred IDE with Flutter and Dart plugins.

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/rescue-coordination-app.git
   cd rescue-coordination-app
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

### Project Structure

Explain the project structure briefly:
- `lib/` - Contains the main codebase for the Flutter application.
- `screens/` - Contains different screen widgets.
- `models/` - Contains data models.
- `services/` - Contains services for API calls, database interactions, etc.
- `widgets/` - Contains reusable UI components.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add YourFeature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a Pull Request.
