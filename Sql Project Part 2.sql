-- Hospital Management System SQL Project
-- Part 2 SQL Queries 

-- 1 Find all patients born after the year 2000

SELECT * 
FROM patients
WHERE YEAR(dob) > 2000;

-- 2 Find all prescriptions for patient_id 5

SELECT * 
FROM prescriptions 
WHERE patient_id = 5;

-- 3 Show the number of appointments per month

SELECT MONTH(appointment_date) as month, COUNT(*) as total_appointments
FROM appointments
GROUP BY MONTH(appointment_date)
ORDER BY month;

-- 4 List all medications that include the keywords 'pain' or 'infection'

SELECT * FROM medications
WHERE description LIKE '%pain%' OR description LIKE '%infection%';

-- 5 Show all doctors with their hospital name

SELECT d.doctor_id, d.doctor_name, h.hospital_name
FROM doctors d
JOIN hospitals h ON d.hospital_id = h.hospital_id
order by d.doctor_id;

-- 6 Find names, phones and appointment_dates of all patients with appointments in August 2025

SELECT p.patient_name, p.phone_number, a.appointment_date
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
WHERE month(a.appointment_date) = 8 AND YEAR(a.appointment_date) = 2025;

-- 7 Show all room numbers and their capacities from the Neurology departments

SELECT r.room_no, r.capacity
FROM rooms r
JOIN departments d ON r.department_id = d.department_id
WHERE d.department_name = 'Neurology'
order by r.room_no;

-- 8 Count how many doctors work in each hospital

SELECT h.hospital_name, COUNT(d.doctor_id) AS doctor_count
FROM hospitals h
LEFT JOIN doctors d ON h.hospital_id = d.hospital_id
GROUP BY h.hospital_name;

-- 9 Find patients who have more than 3 appointments

SELECT p.patient_id, p.patient_name, COUNT(a.appointment_id) AS total_appointments
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.patient_name
HAVING COUNT(a.appointment_id) > 3;

-- 10 List appointments with patient and doctor names

SELECT a.appointment_id, p.patient_name, d.doctor_name, a.appointment_date, a.reason
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_id;


