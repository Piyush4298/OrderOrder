# OrderOrder

OrderOrder is a basic food ordering iOS application built using UIKit. The app provides a seamless onboarding experience for users and allows them to explore a variety of food options, including categories of food, chef's special dishes, and popular items.
All the food data is fetched from the free backend API at [yummie.glitch.me](https://yummie.glitch.me/).

## Features

- **Onboarding Flow**: A smooth and engaging onboarding experience for first-time users.
- **Food Categories**: Browse food based on different categories.
- **Chef's Special**: Discover unique dishes curated by the chef.
- **Popular Dishes**: See what others are ordering the most.
- **Responsive UI**: Built with UIKit for a native iOS experience.
- **Generic Network Layer**: Utilizes a generic API call mechanism in the network layer for flexibility and code reusability.

## Screenshots

|  |  |
|-----------------|-----------------|
| ![Simulator Screenshot - iPhone 15 Plus - 2024-08-24 at 23 43 28](https://github.com/user-attachments/assets/45a7aeaa-b8df-49fd-a538-c9a2e48b6228) | ![Simulator Screenshot - iPhone 15 Plus - 2024-08-24 at 23 43 36](https://github.com/user-attachments/assets/21e92d2f-da73-45c0-8e06-be8354a273a5) |
| ![Simulator Screenshot - iPhone 15 Plus - 2024-08-24 at 23 43 32](https://github.com/user-attachments/assets/61303c47-5021-402b-924d-d995d0743cd4) | ![Simulator Screenshot - iPhone 15 Plus - 2024-08-24 at 23 42 19](https://github.com/user-attachments/assets/be15afce-7cf5-48a4-8eb1-dcb56886270c) |
| ![Simulator Screenshot - iPhone 15 Plus - 2024-08-24 at 23 41 57](https://github.com/user-attachments/assets/4138c3c4-6062-44b4-84d5-11ea27b8bcec) | ![Simulator Screenshot - iPhone 15 Plus - 2024-08-24 at 23 42 54](https://github.com/user-attachments/assets/2f0393ff-cd19-4122-8bb3-0c01a40153ac) |
|  ![Simulator Screenshot - iPhone 15 Plus - 2024-08-24 at 23 42 58](https://github.com/user-attachments/assets/8a7bda0d-ea20-4da2-b1ed-42dd121fc9f5) |

## Onboarding DEMO 

https://github.com/user-attachments/assets/0e49bde9-5c85-4d80-ba6a-dfae114df5e8

## App walkthrough

https://drive.google.com/file/d/1KcwPuDLnI8EaqgJDa9ZjFdS3dh42R7bp/view?usp=sharing


## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/Piyush4298/OrderOrder.git
    ```
2. Navigate to the project directory:
    ```bash
    cd OrderOrder
    ```
3. Install the required dependencies using CocoaPods:
    ```bash
    pod install
    ```
4. Open the `.xcworkspace` file in Xcode:
    ```bash
    open OrderOrder.xcworkspace
    ```
5. Build and run the app on your iOS device or simulator.

## Dependencies

The following third-party libraries are used in this project:

- **[Kingfisher](https://github.com/onevcat/Kingfisher)**: A powerful library for downloading and caching images from the web.
- **[ProgressHUD](https://github.com/relatedcode/ProgressHUD)**: A lightweight and easy-to-use HUD for displaying progress indicators.
- **[IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager)**: An elegant solution to handle the keyboard in iOS apps without requiring additional code.

## API

All the data used in the app is fetched from the following free API:

- **Base URL**: `https://yummie.glitch.me/`

## Network Layer

The network layer in OrderOrder is designed with flexibility and reusability in mind. It uses a generic API call mechanism that makes it easy to handle various API requests with minimal code repetition.
