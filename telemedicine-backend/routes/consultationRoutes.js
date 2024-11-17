const express = require('express');
const Consultation = require('../models/consultation');
const router = express.Router();

// Get all consultations
router.get('/', async (req, res) => {
  try {
    const consultations = await Consultation.find().populate('patient');
    res.status(200).json(consultations);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// Create a new consultation
router.post('/', async (req, res) => {
  const { patient, doctor, date, time, notes } = req.body;

  const consultation = new Consultation({
    patient,
    doctor,
    date,
    time,
    notes,
  });

  try {
    const savedConsultation = await consultation.save();
    res.status(201).json(savedConsultation);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

// Update a consultation
router.put('/:id', async (req, res) => {
  try {
    const updatedConsultation = await Consultation.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.status(200).json(updatedConsultation);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

// Delete a consultation
router.delete('/:id', async (req, res) => {
  try {
    await Consultation.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Consultation deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

module.exports = router;
