#!/bin/bash

# Exit on error
set -e

# Project name
if [ -z "$1" ]; then
  echo "âš ï¸ No project name provided. Using default: node-project"
  PROJECT_NAME="node-project"
else
  PROJECT_NAME="$1"
fi

# Shift project name
shift

# Extra packages passed via CLI (can be empty)
EXTRA_PACKAGES="$@"

echo "í³ Creating project folder: $PROJECT_NAME"
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo "í³¦ Initializing npm..."
npm init -y >/dev/null

echo "í³‚ Creating folder structure..."
mkdir -p src/routes src/controllers src/middleware src/models src/config

# Create main app file
cat <<EOF > app.js
const express = require("express");
require("dotenv").config();
const mongoose = require("mongoose");

const userRoutes = require("./src/routes/user");
const authRoutes = require("./src/routes/auth");

const app = express();
const DB_URL = process.env.DB_URL;

app.use(express.json());
app.use("/user", userRoutes);
app.use("/auth", authRoutes);

// Middleware
function logger(req, res, next) {
  console.log("Request:", req.method, req.url);
  next();
}
app.use(logger);

// Global error handler
app.use((error, req, res, next) => {
  error.statusCode = error.statusCode || 500;
  error.status = error.status || "error";
  res.status(error.statusCode).json({
    status: error.statusCode,
    message: error.message,
  });
});

mongoose.connect(DB_URL)
  .then(() => console.log("MongoDB connected"))
  .catch((err) => console.log(err));

module.exports = app;
EOF

# Create server.js
cat <<EOF > server.js
require("dotenv").config();
const app = require("./app");

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => console.log("Server is running on port", PORT));
EOF

# Create route files
cat <<EOF > src/routes/user.js
const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.send("User Route Working");
});

module.exports = router;
EOF

cat <<EOF > src/routes/auth.js
const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.send("Auth Route Working");
});

module.exports = router;
EOF

# Create .env file
cat <<EOF > .env
PORT=3000
DB_URL=mongodb://localhost:27017/test
SECRET_TOKEN=abcd123
EOF

# Create .gitignore
cat <<EOF > .gitignore
node_modules
.env
EOF

echo "Installing packages..."
npm install express dotenv cors mongoose $EXTRA_PACKAGES

echo "Installing dev dependencies..."
npm install --save-dev nodemon eslint prettier

echo "Updating package.json scripts..."
npx npm-add-script -k "start" -v "node server.js"
npx npm-add-script -k "dev" -v "nodemon server.js"

