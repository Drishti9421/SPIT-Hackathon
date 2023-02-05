const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const poolSchema = new Schema({
  addedby: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  participants: {
    type: [mongoose.Schema.Types.ObjectId],
    ref: "User",
  },
  isOver: {
    type: Boolean,
    default: false,
  },
});

const cpool = mongoose.model("CarPool", poolSchema);

module.exports = cpool;
