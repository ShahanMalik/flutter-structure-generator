# Script to create professional folder structure for Flutter apps (framework-agnostic)

# Ensure we're in the project root (where pubspec.yaml is)
if (-not (Test-Path "pubspec.yaml")) {
    Write-Error "Please run this script from your Flutter project root directory (where pubspec.yaml is located)"
    exit 1
}

# Create the folder structure
$folders = @(
    # Core functionality
    "lib/core/constants",
    "lib/core/errors",
    "lib/core/network",
    "lib/core/storage",
    "lib/core/theme",
    "lib/core/utils",
    
    # Features using clean architecture
    "lib/features/auth/data",
    "lib/features/auth/domain",
    "lib/features/auth/presentation/screens",
    "lib/features/auth/presentation/widgets",
    
    "lib/features/home/data",
    "lib/features/home/domain",
    "lib/features/home/presentation/screens",
    "lib/features/home/presentation/widgets",
    
    "lib/features/profile/data",
    "lib/features/profile/domain",
    "lib/features/profile/presentation/screens",
    "lib/features/profile/presentation/widgets",
    
    # Shared components
    "lib/shared/widgets",
    "lib/shared/models",
    "lib/shared/services",
    
    # App infrastructure
    "lib/navigation",
    "lib/localization",
    "lib/config",
    "lib/di"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Host "Created $folder"
    }
}

# Create empty .gitkeep files to track empty directories in git
foreach ($folder in $folders) {
    $gitkeepFile = Join-Path $folder ".gitkeep"
    if (-not (Test-Path $gitkeepFile)) {
        New-Item -ItemType File -Path $gitkeepFile -Force | Out-Null
    }
}

# Create empty placeholder files for important structures (without content)
$placeholderFiles = @(
    "lib/navigation/app_router.dart",
    "lib/features/home/presentation/screens/home_screen.dart",
    "lib/core/theme/app_theme.dart",
    "lib/config/app_config.dart"
)

foreach ($file in $placeholderFiles) {
    if (-not (Test-Path $file)) {
        New-Item -ItemType File -Path $file -Force | Out-Null
        Write-Host "Created empty placeholder file: $file"
    }
}


Write-Host ""
Write-Host "+---------------------------------------------------------------+"
Write-Host "|                       Setup Complete                          |"
Write-Host "|                                                               |"
Write-Host "|  Project structure has been created successfully!             |"
Write-Host "|                                                               |"
Write-Host "|  You can now safely delete this script file if you wish.      |"
Write-Host "|                                                               |"
Write-Host "+---------------------------------------------------------------+"
