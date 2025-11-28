# Node-Creator

# 🚀 Node Project Auto-Generator (create-node.sh)

A customizable **Bash script** that automatically generates a complete Node.js project structure with Express, Mongoose, routing setup, middleware, environment configuration, and developer tools.

This script is ideal for developers who want to **quickly bootstrap Node.js/Express projects** without manually creating folders and files every time.

---

📥 Quick Installation Guide
1️⃣ Install Git Bash (Windows Only)

Windows users:
👉 https://git-scm.com/install/

(macOS/Linux already have a terminal)

2️⃣ Download or Clone Node-Creator
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git

3️⃣ Move the Script

Place create-node.sh in the folder where you want to create Node.js projects
(e.g., move it to D:/).

4️⃣ Make It Executable
chmod +x create-node.sh

5️⃣ Create a Project

Basic:

./create-node.sh myproject


With extra packages:

./create-node.sh myproject bcrypt jsonwebtoken express-validator

📦 Auto-Installed Packages

Installed automatically — don’t install manually.

Dependencies: express, dotenv, cors, mongoose
Dev deps: nodemon, eslint, prettier

6️⃣ Start the Project
cd myproject
npm run dev
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

