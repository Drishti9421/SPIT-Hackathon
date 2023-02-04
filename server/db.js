const mongoose = require("mongoose");

mongoose.connect(
  "mongodb+srv://mangodb:mangodb@cluster0.eud9kav.mongodb.net/?retryWrites=true&w=majority",
  () => {
    console.log("Connected to Mongo");
  }
);
