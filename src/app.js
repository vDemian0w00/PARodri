import express from "express";
import cors from "cors";

import { PORT, SECRET_KEY } from "./config.js";

import { dirname, join } from "path";
import { fileURLToPath } from "url";

import session from "express-session";
import MySQLStore from "express-mysql-session";
import { pool } from "./DB/DB.js";

import usersRouter from "./routes/users.route.js";

const sessionStore = new MySQLStore({}, pool);

const app = express();

app.use(cors());

app.set("views", join(dirname(fileURLToPath(import.meta.url)), "views"));
app.set("view engine", "ejs");

const __dirname = dirname(fileURLToPath(import.meta.url));
const __public = join(__dirname, "../public");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(
  session({
    key: "cookie-session-key",
    saveUninitialized: false,
    resave: false,
    secret: SECRET_KEY,
    store: sessionStore,
  })
);

app.use(express.static(__public));

app.use("/api/users", usersRouter);

app.get(
  "/app",
  (req, res, next) => {
    app.locals.user = req.session.user;
    next();
  },
  (req, res) => {
    res.render("iAlu");
  }
);

app.get("/login", (req, res) => {
  const data = req.session.data;
  delete req.session.data;
  res.render("login", { data });
});

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
