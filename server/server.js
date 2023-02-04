const express = require("express");
require("./db");
const cors = require("cors");
const app = express();

const userRouter = require("./routes/user.route");
const eventRouter = require("./routes/event.route");

app.use(cors());
app.use(express.json());
app.use(userRouter);
app.use(eventRouter);

const port = 5000;

app.get("/", (req, res) => res.send("Hello World!"));
app.listen(port, () => console.log(`Example app listening on port ${port}!`));
