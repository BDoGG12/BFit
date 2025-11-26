# 🏋️‍♂️ BFit — Body Fat Calculator & AI Fitness Insights for iPhone

**BFit** is a beautifully designed **iOS app built with SwiftUI** that helps users estimate their **body fat percentage** using standard formulas.  
The core experience is intentionally simple — no accounts, no complexity, just fast results.

Users who want deeper guidance can unlock **BFit Premium**, which provides personalized **AI-powered fitness insights, meal suggestions, and weekly improvement tips** based on their body fat results.

---

## 📱 Features

### Free Features
- **Body Fat Calculator** — Estimate your body fat percentage instantly using height, weight, age, and gender.  
- **BMI Calculator** — Optional BMI interpretation for added context.  
- **Simple UI** — Clean and intuitive SwiftUI design optimized for iPhone.  
- **Instant Results** — Real-time calculations as you adjust your inputs.  
- **Data Privacy** — All calculations happen locally on your device.

### 🔒 BFit Premium (In-App Subscription)
Unlock deeper insights powered by the OpenAI API:

- **AI Body Insights** — Understand what your estimated body fat means for health, performance, and physique.  
- **AI Meal Suggestions** — Suggested foods, macro guidance, and simple meal outlines tailored to your goals.  
- **AI Fitness Recommendations** — Training ideas and weekly strategies to help you improve.  
- **Weekly Optimization Tips** — Actionable guidance for your next 7 days.  
- **Save Unlimited Measurements** — Stored locally on-device. No login required.

---

## 🧠 Inspiration

Most people want a quick, no-hassle way to understand their body composition without complicated tools or gym machines.  
**BFit** makes that possible — giving anyone a fast, accurate, and meaningful look at their fitness in seconds.

The goal was to design a calculator that feels **elegant**, **modern**, and **helpful**, while offering optional AI intelligence for users who want personalized guidance.

---

## 🧩 Architecture

Built using **MVVM (Model-View-ViewModel)** for scalability and clean separation of logic:

- `Model` — Handles BMI and body fat calculations.  
- `ViewModel` — Manages input validation, computed results, and API triggers for Premium insights.  
- `View` — Fully built in **SwiftUI** with reactive UI updates.  
- `Services` —  
  - `OpenAIService` for AI-generated insights  
  - `PurchaseManager` for RevenueCat subscription handling  

---

## ⚙️ Tech Stack

- **SwiftUI**  
- **Combine**  
- **MVVM Architecture**  
- **RevenueCat** (In-App Purchases)  
- **OpenAI API** (AI Fitness Insights)  
- **UserDefaults** (Local-only storage)  
- **Xcode 16+**  
- **iOS 17+**

---

## 🚀 Getting Started

### Prerequisites
- macOS Sonoma or later  
- Xcode 16+  
- iOS 17 Simulator or physical device  

### Installation
1. Clone the repository  
   ```bash
   git clone https://github.com/BDoGG12/BFit.git
2. Open the project in Xcode
3. Build and run the project (Cmd + R)

## 👨‍💻 Author
Benjamin Do

iOS Developer & Martial Artist

📍 Vernon Hills, IL

GitHub: https://github.com/BDoGG12

TikTok: @karate_mechanic
