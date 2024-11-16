const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  phone: { type: String, required: true },
  role: { type: String, enum: ['patient', 'doctor'], required: true },
  password: { type: String, required: true },  // Store hashed password
  profilePicture: { type: String },  // URL to profile picture
  medicalHistory: [{ type: String }],  // Only for patients
  specialties: [{ type: String }],  // Only for doctors
  availableTimes: [{ type: String }],  // Only for doctors
}, { timestamps: true });

const User = mongoose.model('User', userSchema);

module.exports = User;
