# **🌟 Rails Assignment API**  
🚀 A **scalable and RESTful API** built using **Ruby on Rails**, implementing **JWT authentication, CRUD operations for events, and image upload functionality**.  

## **🔹 Overview**  
This project demonstrates:  
✅ **User authentication** using **Devise & JWT**  
✅ **Event Management API** with full **CRUD support**  
✅ **Image upload feature** using **Active Storage**  
✅ **Secure API requests** with JWT-based authentication  
✅ **RESTful architecture** following best practices  

## **🔒 User Authentication (JWT-Based)**  
This project uses **JWT (JSON Web Token)** for secure authentication. Users can **sign up & log in** to receive a token, which is required for all authenticated requests.  

### **🛠 API Endpoints**  
| Method | Endpoint  | Description |
|--------|----------|-------------|
| **POST** | `/signup` | Register a new user |
| **POST** | `/login`  | Authenticate & get JWT token |

**🔹 Usage:**  
- Send a request with `{ "email": "test@example.com", "password": "password" }`  
- On successful login, you'll receive a **JWT token**  
- Use this token in **Authorization Header** for protected routes  

---

## **🏟 Event Management API**  
Users can create, update, delete, and view events. **Only authenticated users** can access these APIs.  

### **🛠 API Endpoints**  
| Method | Endpoint       | Description |
|--------|---------------|-------------|
| **GET**  | `/events`     | List all events |
| **POST** | `/events`     | Create a new event |
| **GET**  | `/events/:id` | View event details |
| **PUT**  | `/events/:id` | Update an event |
| **DELETE** | `/events/:id` | Delete an event |

**🔹 Example Request (Create Event)**  
```json
{
  "title": "New Event",
  "description": "This is a test event",
  "date": "2025-12-01"
}
```

---

## **📸 Image Upload API**  
Users can upload a profile image via the API.  

### **🛠 API Endpoint**  
| Method | Endpoint | Description |
|--------|----------|-------------|
| **POST** | `/users/:id/upload_image` | Upload profile image |

**🔹 Usage:**  
- Send a **multipart/form-data** request with an **image file**  
- The uploaded image is stored and can be retrieved via URL  


## **🚀 API Testing with Postman**  
1️⃣ Start the server with `rails s`  
2️⃣ Open **Postman**  
3️⃣ Set **Authorization: Bearer <your_token>**  
4️⃣ Use the API endpoints listed above  


## **📌 Tech Stack & Tools Used**  
✅ **Ruby on Rails** – Web framework  
✅ **Devise + JWT** – Authentication  
✅ **Active Storage** – Image uploads  
✅ **PostgreSQL** – Database  

## **📩 Contact**  
👤 **Developer:** Pooja Chhillar  
📧 Email: `poojachhillar111@gmail.com`  



