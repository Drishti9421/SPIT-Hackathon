const express = require("express");
const router = express.Router();
const { body, validationResult } = require("express-validator");
const bcrypt = require("bcryptjs");
var jwt = require("jsonwebtoken");
const multer = require("multer");
const fs = require("fs");
var path = require("path");
const events = require("../models/event.model");

var storage = multer.diskStorage({
  destination: "uploads",
  filename: (req, file, cb) => {
    cb(null, Date.now() + ".jpg");
  },
});

var upload = multer({ storage: storage });

router.post("/registerevent", upload.single("image"), async (req, res) => {
  try {
    let success = false;
    let dir = __dirname.split("\\");
    dir.pop();
    dir = dir.join("\\");
    console.log(req.body);
    let event = await events.create({
      title: req.body.title,
      description: req.body.description,
      date: req.body.date,
      time: req.body.time,
      image: {
        data: fs.readFileSync(
          path.join(dir + "\\uploads\\" + req.file.filename)
        ),
        contentType: "image/jpg",
      },
      categories: req.body.categories,
      venue: req.body.venue,
      addedby: req.body.addedby,
      isOver: false,
    });

    success = true;
    res.json({ success });
  } catch (err) {
    console.log(err);
    res.json({ status: "error", error: err });
  }
});

module.exports = router;
