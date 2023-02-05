var jwt = require("jsonwebtoken");
const JWT_SECRET = "hetvi";

const fetchUser = (req, res, next) => {
  console.log("innn");
  const token = req.header("auth-token");
  if (!token) {
    res.status(401).send({ error: "Error occured" });
  }
  try {
    console.log("in");
    const data = jwt.verify(token, JWT_SECRET);
    console.log(data);
    req.user = data.user;
    next();
  } catch (error) {
    res.status(401).send({ error: "Error occured" });
  }
};

module.exports = fetchUser;
