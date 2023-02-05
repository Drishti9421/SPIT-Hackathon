const express = require("express");
const router = express.Router();
const events = require("../models/event.model");
const users = require("../models/user.model");
const fetchUser = require("../middleware/fetchUser");
const cpool = require("../models/carPool.model");

router.post("/createpool", fetchUser, async (req, res) => {
  try {
    let success = false;

    let event = await cpool.create({
      addedby: req.user.id,
    });

    success = true;
    res.status(200).json({ event });
  } catch (err) {
    console.log(err);
    res.json({ status: "error", error: err });
  }
});

module.exports = router;
