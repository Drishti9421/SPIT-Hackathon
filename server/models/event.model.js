const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const eventSchema = new Schema({
  title: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
    unique: true,
  },
  date: {
    type: Date,
    required: true,
  },
  time: {
    type: String,
    required: true,
 },
 image: {
    data: Buffer,
    contentType: String,
 },
 categories: {
    type: String,
 },
 venue: {
    type: String,
    required: true,
 },
 addedby: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  
});

const events = mongoose.model("User", eventSchema);

module.exports = events;
