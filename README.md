# Node-Creator

# 🚀 Node Project Auto-Generator (create-node.sh)

A customizable **Bash script** that automatically generates a complete Node.js project structure with Express, Mongoose, routing setup, middleware, environment configuration, and developer tools.

This script is ideal for developers who want to **quickly bootstrap Node.js/Express projects** without manually creating folders and files every time.

---

## ✨ Features

✔ Automatically creates a new project folder  
✔ Initializes `npm`  
✔ Creates common folder structure:  

src/
├── routes/
├── controllers/
├── middleware/
├── models/
└── config/


✔ Generates production-ready `app.js` and `server.js`  
✔ Auto-creates:  
- `.env`  
- `.gitignore`  
- Basic route files (`user.js`, `auth.js`)  
✔ Installs common dependencies:
  - express  
  - dotenv  
  - cors  
  - mongoose  
✔ Installs dev dependencies:
  - nodemon  
  - eslint  
  - prettier  
✔ Automatically adds `npm start` and `npm run dev` scripts  
✔ Supports **extra packages via CLI arguments**

---

## 📥 Installation

Clone the repository:

```sh
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
cd YOUR_REPOSITORY
