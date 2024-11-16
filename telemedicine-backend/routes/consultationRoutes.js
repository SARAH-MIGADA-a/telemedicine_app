const express = require('express');
const Consultation = require('../models/consultation');
const Appointment = require('../models/appointment');
const router = express.Router();

// Add consultation details (notes, prescriptions, diagnosis)
router.post('/add/:appointmentId', async (req, res) => {
  const { doctorNotes, prescriptions, diagnosis } = req.body;
  const { appointmentId } = req.params;

  // Check if the appointment exists
  const appointment = await Appointment.findById(appointmentId);
  if (!appointment) {
    return res.status(404).json({ message: 'Appointment not found' });
  }

  // Create new consultation entry
  const newConsultation = new Consultation({
    appointmentId,
    doctorNotes,
    prescriptions,
    diagnosis,
  });

  try {
    // Save consultation data
    await newConsultation.save();

    // Update appointment status to 'completed'
    appointment.status = 'completed';
    await appointment.save();

    res.status(201).json({ message: 'Consultation details added successfully' });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Get consultation details for a specific appointment
router.get('/:appointmentId', async (req, res) => {
  const { appointmentId } = req.params;

  try {
    const consultation = await Consultation.findOne({ appointmentId }).populate('appointmentId');
    if (!consultation) {
      return res.status(404).json({ message: 'Consultation details not found' });
    }

    res.json(consultation);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Optional: Get all consultations for a patient or doctor (can be used to fetch all consultations by doctor or patient)
router.get('/user/:userId', async (req, res) => {
  const { userId } = req.params;

  try {
    const consultations = await Consultation.find({
      'appointmentId.patientId': userId,
    }).populate('appointmentId');

    res.json(consultations);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
