const mongoose = require('mongoose');

const consultationSchema = new mongoose.Schema({
  appointmentId: { type: mongoose.Schema.Types.ObjectId, ref: 'Appointment', required: true },
  doctorNotes: { type: String, required: true },
  prescriptions: [{ type: String }],
  diagnosis: [{ type: String }],
}, { timestamps: true });

const Consultation = mongoose.model('Consultation', consultationSchema);

module.exports = Consultation;
