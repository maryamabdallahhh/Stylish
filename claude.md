# Stylish App — Claude Rules

## Stack
- Flutter 3.x, Dart
- State: flutter_bloc (Cubit only, no Bloc)
- Architecture: MVVM + Clean Architecture (data / domain / presentation)
- HTTP: Dio with interceptors
- DI: get_it + injectable
- Navigation: go_router
- Responsive: flutter_screenutil (ALL sizes must use .w .h .sp .r)
- Error handling: dartz (Either<Failure, T>)

## Rules
- Never use StatefulWidget — use Cubit
- Never hardcode colors — always use AppColors
- Never hardcode text styles — always use AppTextStyles
- Never hardcode sizes — always use flutter_screenutil (.w / .h / .sp)
- Every feature follows: data/ domain/ presentation/ structure
- Every Cubit has states: Initial, Loading, Success, Error
- Repositories are always abstract in domain, implemented in data
- Use freezed for models and states
- Use injectable for get_it registrationnl

## Design tokens
- Primary: #F83758
- Background: #FFFFFF
- Surface: #FFFFFF
- Text primary: #000000
- Text hint: #676767

## Folder structure
lib/
├── core/
├── features/
│   └── feature_name/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── shared/