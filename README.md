# 📱 Daily Quote App (AI-Native Build)

> **"A case study in Agentic Engineering using Google Stitch & Project IDX."**

[![Flutter](https://img.shields.io/badge/Built_with-Flutter-blue?style=flat-square)](https://flutter.dev)
[![AI Stack](https://img.shields.io/badge/AI_Stack-Stitch_%7C_Antigravity_%7C_Gemini-purple?style=flat-square)](https://idx.google.com)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)]()

## 🎥 Video Walkthrough (The "Must Watch")
**[Watch the 4-Minute Agentic Workflow Demo on Loom](https://www.loom.com/share/25c2192415d9458797b2711d5ef4a668)**
*Highlight: Watch how I used visual feedback loops to fix UI hallucinations in real-time.*

## 📥 Download the App
**[Download Android APK (Google Drive)](https://drive.google.com/file/d/1hfIS53F6HLAAsYb351ON81u1W4vVSnis/view?usp=sharing)**
*(Compatible with Android 10+)*

---

## 🤖 The "AI-First" Approach
This project was not just "coded" with AI; it was **architected** using a full Google AI stack. My goal was to act as the Product Manager while the Agents handled the implementation.

### **1. Generative Design (Google Stitch)**
I used **Stitch** to generate a "Serene Glassmorphism" design system.
* **The Challenge:** The AI initially "hallucinated" a 4-icon navigation bar, despite the requirement for only two features.
* **The Fix:** I used iterative prompting to force a custom "Floating Capsule" layout, unifying the Home and Favorites screens into a single design language.
* **[View Live Design Project on Google Stitch](https://stitch.withgoogle.com/projects/16536448688771002389)**

### **2. Agentic IDE (Google Antigravity / Project IDX)**
Instead of writing boilerplate, I treated the IDE as an Agent:
* **Environment as Code:** I prompted the Agent to configure the `.idx/dev.nix` file, automatically setting up the Flutter SDK and Android Emulator infrastructure.
* **Multimodal Context:** I fed the high-fidelity Stitch screenshots directly into **Gemini 1.5 Pro**, instructing it to replicate the "Frosted Glass" UI pixel-for-pixel.
* **Visual Debugging:** When the initial build lacked the blur effect on the navbar, I didn't edit the CSS/Dart manually. I pasted a screenshot of the bug back to the Agent, which self-corrected the `BackdropFilter` widget implementation.

---

## 🛠 Tech Stack
* **Framework:** Flutter (Dart)
* **AI Model:** Gemini 1.5 Pro / 2.0 Flash
* **State Management:** `provider`
* **Persistence:** `shared_preferences` (Local storage for Favorites)
* **Networking:** `http` (ZenQuotes API)
* **Utilities:** `share_plus` (System share sheet), `google_fonts`

---

## 🚀 Setup & Installation

**Prerequisite:** This project is optimized for **Project IDX**, but runs locally with Flutter installed.

### Option A: Run in Project IDX (Cloud)
1.  Fork this repo.
2.  Open in [Google Project IDX](https://idx.google.com/).
3.  The `.idx/dev.nix` file will automatically install Flutter and Android extensions.
4.  Accept the "Android Emulator" terms when prompted.
5.  Press `F5` or click "Run Android".

### Option B: Run Locally
```bash
# 1. Clone the repository
git clone [https://github.com/vivekTiw120303/daily_quote_app.git](https://github.com/vivekTiw120303/daily_quote_app.git)

# 2. Install dependencies
flutter pub get

# 3. Run on connected device
flutter run
```

✨ Features
1. Daily Inspiration: Fetches random quotes from the ZenQuotes API with error handling.
2. Glassmorphism UI: Custom-built "Frosted Glass" cards and navigation bar.
3. Favorites System: Save quotes locally; data persists across app restarts.
4. Social Sharing: Native share sheet integration to send quotes to other apps.
5. Adaptive Layout: Masonry-style grid for the Favorites list.

Submitted by Vivek Tiwari
