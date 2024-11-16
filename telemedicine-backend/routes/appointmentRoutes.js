const express = require('express');
const Appointment = require('../models/appointment');
const router = express.Router();

// Book an appointment
router.post('/book', async (req, res) => {
  const { patientId, doctorId, appointmentTime } = req.body;

  const newAppointment = new Appointment({
    patientId, doctorId, appointmentTime
  });

  try {
    await newAppointment.save();
    res.status(201).json({ message: 'Appointment booked successfully' });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Get appointments by user
router.get('/:userId', async (req, res) => {
  const { userId } = req.params;
  const appointments = await Appointment.find({
    $or: [{ patientId: userId }, { doctorId: userId }]
  });

  res.json(appointments);
});

module.exports = router;
