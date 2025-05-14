# Firebase Auth Riverpod Package

A reusable and testable Firebase Authentication wrapper using Riverpod for clean architecture in Flutter.

## Features
- Email/Password Sign-in and Registration
- Callbacks for login/register success and failure
- Riverpod providers for state management

## Usage
```dart
ref.read(authRepositoryProvider).signInWithEmail(
  email: 'example@email.com',
  password: 'password123',
  onSuccess: (user) => print("Logged in: ${user.email}"),
  onFailure: (error) => print("Error: $error"),
);
```
