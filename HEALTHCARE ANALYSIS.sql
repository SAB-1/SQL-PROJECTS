-- HEALTHCARE ANALYSIS
/* THIS PROJECT IS DESIGNED TO GIVE ANALYSIS ON HEALTHCARE DATABASE AND GIVE INSIGHT ABOUT THE HEALTH FACILITY AS A WHOLE */

-- PATIENT ANALYSIS
-- WHAT  IS THE AVERAGE AGE OF PATIENTS IN THE DATABASE
SELECT ROUND(AVG((year(now())- year(dob))), 1) AS `AVERAGE AGE` 
FROM patient;

-- WHICH STATE HAS THE HIGHEST NUMBER OF PATIENTS
SELECT DISTINCT state_code, COUNT(patient_id) as `NUMBER OF PATIENTS`
FROM patient
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- WHAT IS THE GENDER DISTRIBUTION OF PATIENTS IN THE  DATABASE
SELECT gender, COUNT(gender) AS `NUMBER OF PEOPLE`
FROM patient
GROUP BY 1
ORDER BY 2;

-- WHICH AGE GROUP (E.G 0-18, 19- 64, 65+) HAS THE MOST APPOINTMENTS
SELECT 
CASE 
	WHEN (year(now())- year(dob)) <= 18 THEN "TEENAGER"
    WHEN (year(now())- year(dob)) BETWEEN 19 AND 64 THEN "ADULT"
    WHEN (year(now())- year(dob)) >= 65 THEN "OLD AGE"
END AS `AGE GROUP`, COUNT(appointment_id) AS `NO OF APPOINTMENTS`
FROM patient P 
JOIN appointment A ON P.patient_id = A.patient_id
GROUP BY `AGE GROUP`
ORDER BY `NO OF APPOINTMENTS` DESC
LIMIT 1;

-- DOCTOR ANALYSIS
-- WHICH DOCTOR HAS THE MOST APPOINTMENT SCHEDULE
SELECT `name`, COUNT(appointment_id) 
FROM doctor D 
JOIN appointment A ON D.doctor_id = A.doctor_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--  WHAT IS THE DISTRIBUTION OF DOCTORS BY SPECIALITY
SELECT S.name,  COUNT(doctor_id) AS `NO OF DOCTORS`
FROM doctor D 
LEFT JOIN speciality S ON D.speciality_id = S.speciality_id
GROUP BY 1
ORDER BY 2 DESC;

-- WHICH DOCTOR HAS THE  HIGHEST NUMBER OF PRESCRIPTIONS WRITTEN
SELECT D.`name`, COUNT(prescription_id) AS `NO OF PRESCRIPTIONS`
FROM doctor D
JOIN appointment A ON D.doctor_id = A.doctor_id
JOIN prescription P ON A.appointment_id = P.appointment_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- WHAT IS THE AVERAGE NUMBER OF APPOINTMENTS PER DOCTOR PER MONTH
SELECT  AVG(`NO OF APPOINTMENTS`)
FROM (
SELECT `name`, count(appointment_id) AS `NO OF APPOINTMENTS`, month(appointment_date)
FROM appointment
JOIN doctor D ON appointment.doctor_id = D.doctor_id
GROUP BY 1,3) AS `COUNT`;


-- APPOINTMENT ANALYSIS
-- WHAT IS THE MOST COMMON APPOINTMENT STATUS
SELECT status, count(status) AS NUMBERS
FROM appointment
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- WHICH DAY OF THE WEEK HAS THE MOST APPOINTMENTS SCHEDULED
SELECT dayname(appointment_date) AS `DAYS OF THE WEEK`, count(appointment_id) AS `NO OF APPOINTMENTS`
FROM appointment
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- WHAT IS THE AVERAGE NUMBER OF APPOINTMENTS PER PATIENT PER YEAR
SELECT AVG(NO_OF_APPOINTMENTS)
FROM ( SELECT A.patient_id, count(A.appointment_id) AS NO_OF_APPOINTMENTS, YEAR(A.appointment_date) AS YEAR_
FROM appointment A
JOIN patient P ON A.patient_id = P.patient_id
GROUP  BY 1,3) AS INN;

-- WHICH TIME OF THE DAY HAS THE MOST APPOINTMENT
SELECT CASE
		WHEN time(appointment_date) BETWEEN "00:00:00" AND "11:59:59" THEN "MORNING"
		WHEN time(appointment_date) BETWEEN "12:00:00" AND "15:59:59" THEN "AFTERNOON"
       ELSE "EVENING"
       END AS `TIME`, COUNT(appointment_id) AS NO_OF_APPOINTMENTS
FROM appointment
GROUP BY 1
ORDER BY 2 DESC;

-- OR 
SELECT HOUR(appointment_date), COUNT(appointment_id) AS NO_OF_APPOINTMENTS
FROM appointment
GROUP BY 1
ORDER BY 2 DESC;

-- MEDICATION ANALYSIS
-- WHICH MEDICATION IS COMMONLY PPRESCRIBED
SELECT `name`, COUNT(appointment_id) `NO OF TIMES PRESCRIBED`
FROM medication M 
JOIN prescription P ON M.medication_id = P.medication_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- WHAT IS THE DISTRIBUTION OF MEDICATIONS  BY MANUFACTURER
SELECT manufacturer, count(medication_id)
FROM medication
GROUP BY 1
ORDER BY 2 DESC;

-- WHICH SPECIALITY PRESCRIBES THE MOST MODICATIONS
SELECT S.`name`, COUNT(prescription_id) AS `NO OF PRESCRIPTION`
FROM  speciality S 
JOIN doctor D ON S.speciality_id = D.speciality_id
JOIN appointment A ON D.doctor_id = A.doctor_id
JOIN prescription P ON A.appointment_id = P.appointment_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- WHAT IS THE AVERAGE NUMBER OF PRESCRIPTIONS PER MEDICATION PER MONTH
SELECT avg(AVERAGE_PRESCRIPTION)
FROM (SELECT  MONTH(appointment_date), count(prescription_id) AS AVERAGE_PRESCRIPTION
FROM appointment
JOIN prescription ON appointment.appointment_id = prescription.appointment_id
GROUP BY 1) AS LAS;

-- PRESCRIPTION ANALYSIS
--  WHAT IS  THE MOST COMMON  MEDICATION PRESCRIBED FOR A SPECIFIC CONDITION
SELECT `name`, COUNT(prescription_id) AS `TIMES OF PRESCRIPTION`, description
FROM medication
JOIN  prescription ON medication.medication_id = prescription.medication_id
GROUP BY 1,3
ORDER BY 2 DESC
LIMIT 1;

-- WHICH DOCTOR PRESCRIBES THE MOST THE MOST MEDICATION FOR A SPECIFIC CONDITION
SELECT D.`name`, COUNT(prescription_id) AS `TIMES OF PRESCRIPTION`, description
FROM medication M
JOIN  prescription P ON M.medication_id = P.medication_id
JOIN appointment A ON P.appointment_id = A.appointment_id
JOIN doctor D ON A.doctor_id = D.doctor_id
GROUP BY 1,3
ORDER BY 2 DESC
LIMIT 1;

-- WHAT IS THE AVERAGE NUMBER OF PRESCRIPTIONS PER PATIENT PER YEAR
SELECT  AVG(NO_OF_PRESCRIPTION)
FROM (SELECT P.`name`, COUNT(prescription_id) AS NO_OF_PRESCRIPTION, YEAR(appointment_date)
FROM patient P
JOIN appointment A ON P.patient_id = A.patient_id
JOIN prescription PR ON A.appointment_id = PR.appointment_id
GROUP BY 1, 3) AS HED;

-- WHICH PRESCRIPTION IS MOST COMMONLY PRESCRIBED IN COMBINATION WITH ANOTHER MEDICATION
-- IN THIS DATABASE CONTEXT, IT IS NOT ACHIEVEABLE BECAUSE IN THIS INSTANCE THERE IS NO TABLE SHOWING MEDICAL CONDITION

-- SPECIALITY ANALYSIS
-- WHICH SPECIALITY HAS THE MOST APPOINTMENTS SCHEDULED
SELECT S.`name`,COUNT(appointment_id) AS `NO OF APPOINTMENTS`
FROM speciality S
JOIN doctor D ON S.speciality_id = D.speciality_id
JOIN appointment A ON D.doctor_id = A.doctor_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- WHAT IS THE DISTRIBUTION OF SPECIALITIES BY DOCTORS
SELECT S.`name`, COUNT(doctor_id) AS NO_OF_DOCTORS
FROM speciality S
JOIN doctor D ON S.speciality_id = D.speciality_id
GROUP BY 1
ORDER BY 2 DESC;

-- WHICH SPECIALITY PRESCRIBES THE MOST MEDICATIONS
SELECT S.`name`, COUNT(prescription_ID)
FROM speciality S 
JOIN doctor D ON S.speciality_id = D.speciality_id
JOIN appointment A ON D.doctor_id = A.doctor_id
JOIN prescription P ON A.appointment_id = P.appointment_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- WHAT IS THE AVERAGE NUMBER OF APPOINTMENTS PER SPECIALITY PER MONTH
SELECT AVG(AVERAGE)
FROM (SELECT  S.`name`,  COUNT(appointment_ID) AS AVERAGE, MONTH(appointment_date)
FROM speciality S 
JOIN doctor D ON S.speciality_id = D.speciality_id
JOIN appointment A ON D.doctor_id = A.doctor_id
GROUP BY 1,3) AS SPE;

-- TIME-BASED ANALYSIS
-- WHAT IS THE TREND IN APPOINTMENTS SCHEDULED OVER THE PAST YEAR
SELECT YEAR(appointment_date), COUNT(appointment_id)
FROM appointment
GROUP BY 1;

-- WHICH MONTH HAS THE HIGHEST NUMBER OF APPOINTMENTS SCHEDULED
SELECT MONTHNAME(appointment_date), COUNT(appointment_ID) AS NO_OF_APPOINTMENTS
FROM appointment
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;


-- WHAT IS THE TREND IN PRESCRIPTIONS WRITTEN OVER THE PAST YEAR
SELECT MONTH(appointment_DATE), COUNT(prescription_ID)
FROM appointment
JOIN prescription ON appointment.appointment_id = prescription.prescription_id
GROUP BY 1;

-- WHICH QUARTER HAS THE HIGHEST NUMBER OF MEDICATIONS PRESCRIBED
SELECT QUARTER(appointment_date), COUNT(prescription_id)
FROM appointment A
LEFT JOIN prescription P ON A.appointment_id = P.appointment_id
GROUP BY 1; 

-- CORRELATION ANALYSIS
-- IS THERE ANY CORRELATION BETWEEN THE NUMBER OF APPOINTMNETS SCHEDULED AND THE NUMBER OF PRESCRIPTIONS WRITTEN
-- SELECT CORR(TIMESTAMPDIFF(YEAR, DOB, CURDATE()),