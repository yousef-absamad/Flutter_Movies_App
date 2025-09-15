# 🎬 Flutter Movies App

A movies application built with **Flutter** using **Clean Architecture** and clean code principles.  
The app allows users to browse the latest movies, popular movies, and top-rated movies, with detailed information and recommendations for similar movies.

---

## 🚀 Features

- **Home Screen**:
  - 🎥 **Now Playing**
  - 🌟 **Popular**
  - 🏆 **Top Rated**
- **See More Screen** to display more movies for *Popular* or *Top Rated* categories.
- **Movie Details Screen** with:
  - Full movie details (title, rating, overview, etc.)
  - **Recommendations**: similar movies related to the selected one.
- **Shimmer** effect while loading.
- **Carousel Slider** on the home screen.
- Smooth **animations** using animate_do.

---

## 🏗️ Architecture

The app follows **Clean Architecture**:

- **Data Layer**: handles API integration and JSON to model conversion.
- **Domain Layer**: contains entities and use cases.
- **Presentation Layer**: UI + state management using **BLoC**.

---

## 🛠️ Tech Stack

- **State Management**: BLoC
- **Dependency Injection**: get_it
- **Navigation**: go_router
- **Functional Programming**: dartz
- **Environment Variables**: flutter_dotenv (for API Key & Base URL)
- **UI Libraries**: shimmer, animate_do, carousel_slider

---

## 📸 Screenshots

<div style="display: flex; gap: 10px;">
  <img src="screenshots/home1.jpg" width="30%" />
  <img src="screenshots/home2.jpg" width="30%" />
  <img src="screenshots/popular.jpg" width="30%" />
</div>

<br/>

<div style="display: flex; gap: 10px;">
  <img src="screenshots/top_rated.jpg" width="30%" />
  <img src="screenshots/movie_details1.jpg" width="30%" />
  <img src="screenshots/movie_details2.jpg" width="30%" />
</div>

---

## 🎥 Watch the video on youtube

[![Watch the video](https://i.ytimg.com/vi/6Ig0fjouw0U/oar2.jpg?sqp=-oaymwEoCJUDENAFSFqQAgHyq4qpAxcIARUAAIhC2AEB4gEKCBgQAhgGOAFAAQ==&rs=AOn4CLDOJjbpJTGBObAf_xEMLILImM8G_w))](https://youtu.be/6Ig0fjouw0U?si=WrFhfLxQhMVI-acw )
