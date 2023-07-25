## Generate
### How to generate Icon App 

```
    flutter pub run flutter_launcher_icons:main
```

### Model, api retrofit

```
    flutter pub run build_runner build
```

### Delete conflicting outputs

```
    flutter packages pub run build_runner build --delete-conflicting-outputs
```

OR

```
      flutter packages pub run build_runner build -d
```

### Build filter (one directory special)

*Example lib\123\file.dart

```
    flutter packages pub run build_runner build --build-filter="lib/123/**"
```