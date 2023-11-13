# SpotiFlutter Project

A great Flutter challenge for building an application consuming the Spotify Web API.

## Getting Started

- Rename the example.env file to .env and change the value for a real client ID and secret. You can
  get your own credentials by accessing the https://developer.spotify.com/dashboard and creating
  your own project. For more info: https://developer.spotify.com/documentation/web-api
  
- Configure redirect URIs to com.spotflutter.dev://callback in the project you created in the previous step.
  
- Run the project using the command bellow, depending the environment that you want:
  - Production: flutter run --flavor production -t lib/main_production.dart
  - Staging: flutter run --flavor staging -t lib/main_staging.dart
  - Development: flutter run --flavor development -t lib/main_development.dart
  
