const express = require("express");
const router = express.Router();
const { body, validationResult } = require("express-validator");
const bcrypt = require("bcryptjs");
var jwt = require("jsonwebtoken");
const multer = require("multer");
const fs = require("fs");
var path = require("path");
const events = require("../models/event.model");
const users = require("../models/user.model");
const { findByIdAndUpdate } = require("../models/event.model");
const fetchUser = require("../middleware/fetchUser");

var storage = multer.diskStorage({
  destination: "uploads",
  filename: (req, file, cb) => {
    cb(null, Date.now() + ".jpg");
  },
});

var upload = multer({ storage: storage });

router.post("/registerevent", fetchUser, async (req, res) => {
  console.log(req.body);
  try {
    let success = false;
    let dir = __dirname.split("\\");
    dir.pop();
    dir = dir.join("\\");
    let event = await events.create({
      title: req.body.title,
      description: req.body.description,
      date: req.body.date,
      time: req.body.time,
      categories: req.body.categories,
      venue: req.body.venue,
      addedby: req.user.id,
      isOver: false,
    });

    success = true;
    res.status(200).json({ event });
  } catch (err) {
    console.log(err);
    res.json({ status: "error", error: err });
  }
});

router.get("/allEvents", async (req, res) => {
  try {
    const event = await events.find({ isOver: false });
    res.json(event);
  } catch (err) {
    console.log(err);
    res.status(500).send("Some error occured");
  }
});

router.post("/participate", fetchUser, async (req, res) => {
  try {
    const user = await users.findById(req.user.id);
    user.participating = req.body.eventid;
    // const event = await events.findById(req.body('event-id'))
    const event = await events.findOneAndUpdate(
      { _id: req.body.eventid },
      { $push: { participantid: req.user.id } }
    );
    res.send(event);
  } catch (error) {
    console.log(error);
    res.status(500).send("Some error occured");
  }
});

module.exports = router;
