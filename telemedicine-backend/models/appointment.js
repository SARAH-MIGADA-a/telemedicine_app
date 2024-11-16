const mongoose = require('mongoose');

const appointmentSchema = new mongoose.Schema({
  patientId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  doctorId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  appointmentTime: { type: Date, required: true },
  status: { type: String, enum: ['pending', 'confirmed', 'completed'], default: 'pending' },
  notes: { type: String },  // Notes added by doctor after consultation
}, { timestamps: true });

const Appointment = mongoose.model('Appointment', appointmentSchema);

module.exports = Appointment;
