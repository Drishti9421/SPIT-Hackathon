const express = require("express");
const users = require("../models/user.model");
const router = express.Router();
const { body, validationResult } = require("express-validator");
const bcrypt = require("bcryptjs");
var jwt = require("jsonwebtoken");
const fetchUser = require("../middleware/fetchUser");

router.post(
  "/registeruser",
  [body("email").isEmail(), body("password").isLength({ min: 5 })],
  async (req, res) => {
    let success = false;
    try {
      let user = await users.findOne({ email: req.body.email });

      if (user) {
        res.status(400).json({ success, error: "Email ID already used" });
      }

      const salt = await bcrypt.genSalt(10);
      const secPass = await bcrypt.hash(req.body.password, salt);

      user = await users.create({
        name: req.body.name,
        email: req.body.email,
        password: secPass,
        address: req.body.address,
        number: req.body.number,
      });
      const data = {
        user: {
          id: user.id,
        },
      };

      const authToken = jwt.sign(data, "hetvi");

      success = true;
      res.json({ success, authToken });
    } catch (err) {
      console.log(err);
      res.json({ status: "error", error: err });
    }
  }
);

router.post(
  "/loginuser",
  [body("email").isEmail(), body("password").isLength({ min: 5 })],
  async (req, res) => {
    let success = false;
    try {
      console.log(req.body.email);
      let user = await users.findOne({ email: req.body.email });

      if (!user) {
        res.status(400).json({ success, error: "Email ID does not exist" });
      } else {
        const checkPass = bcrypt.compareSync(req.body.password, user.password);
        if (checkPass) {
          const data = {
            user: {
              id: user.id,
            },
          };
          const authToken = jwt.sign(data, "hetvi");
          success = true;
          res.json({ success, authToken });
        }
      }
    } catch (err) {
      console.log(err);
      res.json({ status: "error", error: err });
    }
  }
);

router.get("/getUserId", fetchUser, async (req, res) => {
  try {
    const user = await users.findOne({ _id: req.user.id });
    res.json(user);
  } catch (err) {
    console.log(err);
    res.status(500).send("Some error occured");
  }
});

router.get("/getAllUsers", fetchUser, async (req, res) => {
  try {
    const curr = await users.findOne({ _id: req.user.id });
    const user = await users.find({
      _id: { $ne: req.user.id, $nin: curr.friends },
    });
    console.log(user);
    res.json(user);
  } catch (err) {
    console.log(err);
    res.status(500).send("Some error occured");
  }
});

router.post("/addFriend", fetchUser, async (req, res) => {
  console.log(req.body, req.headers);
  try {
    const user = await users.findOneAndUpdate(
      { _id: req.user.id },
      { $push: { friends: req.body.id } }
    );
    res.json(user);
  } catch (err) {
    console.log(err);
    res.status(500).send("Some error occured");
  }
});

router.post("/getPoints", fetchUser, async (req, res) => {
  try {
    const user = await users.findOneAndUpdate(
      { _id: req.user.id },
      { $inc: { points: req.body.point } }
    );
    res.json(user);
  } catch (err) {
    console.log(err);
    res.status(500).send("Some error occured");
  }
});

module.exports = router;
