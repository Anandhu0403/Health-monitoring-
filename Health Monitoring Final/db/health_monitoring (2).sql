-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2024 at 01:13 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `health_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE IF NOT EXISTS `disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disease` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `precaution` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`id`, `disease`, `description`, `precaution`) VALUES
(2, 'Osteoarthristis', 'Osteoarthritis is the most common form of arthritis, affecting millions of people worldwide. It occurs when the protective cartilage that cushions the ends of your bones wears down over time.', 'acetaminophen,\r\nconsult nearest hospital,\r\nsalt baths,\r\nfollow up\r\n'),
(3, 'Alcoholic Hepatitis', 'Alcoholic hepatitis is a diseased, inflammatory condition of the liver caused by heavy alcohol consumption over an extended period of time. ', 'stop alcohol consumption\r\n,medication\r\n\r\n'),
(4, 'Drug Reaction', 'An adverse drug reaction (ADR) is an injury caused by taking medication. ADRs may occur following a single dose or prolonged administration of a drug or result from the combination of two or more drugs.', 'stop irritation\r\n,stop taking drug\r\n,follow up\r\n\r\n\r\n'),
(5, 'Common Cold', 'The common cold is a viral infection of your nose and throat.', 'drink vitamin c rich drinks,take vapour,avoid cold food,keep fever in check\r\n\r\n\r\n\r\n\r\n'),
(6, 'Typhoid', 'An acute illness characterized by fever caused by infection with the bacterium Salmonella typhi. Typhoid fever has an insidious onset, with fever, headache, constipation, malaise, chills, and muscle pain. Diarrhea is uncommon, and vomiting is not usually severe.', 'eat high calorie vegetables,antibiotic therapy,medication\r\n\r\n\r\n'),
(7, '(vertigo) Paroymsal  Positional Vertigo', 'Benign paroxysmal positional vertigo (BPPV) is one of the most common causes of vertigo.', 'lie down,avoid sudden change in body,avoid abrupt head movment,relax\r\n\r\n\r\n\r\n'),
(8, 'Migraine', 'A headache of varying intensity, often accompanied by nausea and sensitivity to light and sound.\r\nMigraine headaches are sometimes preceded by warning symptoms. Triggers include hormonal changes, certain food and drink, stress, and exercise (aura).', 'During physical activity, your body releases certain chemicals that block pain signals to your brain. These chemicals also help reduce anxiety and depression â€” two conditions that can make migraines worse.\r\n\r\nObesity also increases the risk of chronic headaches. Maintaining a healthy weight through exercise and diet can provide additional benefits in managing migraines.'),
(9, 'Tuberculosis', '', ''),
(10, 'Hyperthyroidism', '', ''),
(11, 'Dengue', 'Dengue (break-bone fever) is a viral infection that spreads from mosquitoes to people. It is more common in tropical and subtropical climates. Most people who get dengue wont have symptoms. But for those that do, the most common symptoms are high fever, headache, body aches, nausea and rash.', 'Prevent mosquito habitats,Keep your doors and windows closed as much as possible, or invest in insect screens,Protect your skin from mosquito bites,Avoid visiting areas prone to mosquitoes,Be vigilant'),
(12, 'Dimorphic hemmorhoids(piles)', '', ''),
(13, 'Malaria', '', ''),
(14, 'Hepatitis E', '', ''),
(15, 'Psoriasis', '', ''),
(16, 'hepatitis A', '', ''),
(17, 'Jaundice', '', ''),
(18, 'Diabetes', '', ''),
(19, 'Cervical spondylosis', '', ''),
(20, 'Hepatitis C', '', ''),
(21, 'Peptic ulcer disease', '', ''),
(22, 'Chicken pox', '', ''),
(23, 'Chronic cholestasis', '', ''),
(24, 'Pneumonia', '', ''),
(25, 'Hypertension', '', ''),
(26, 'Varicose veins', '', ''),
(27, 'Hypoglycemia', '', ''),
(28, 'Arthritis', '', ''),
(29, 'Bronchial Asthma', '', ''),
(30, 'Hypothyroidism', '', ''),
(31, 'Hepatitis B', '', ''),
(32, 'Hepatitis D', '', ''),
(33, 'Impetigo', '', ''),
(34, 'GERD', '', ''),
(35, 'Paralysis (brain hemorrhage)', '', ''),
(36, 'Heart attack', '', ''),
(37, 'Gastroenteritis', '', ''),
(38, 'Acne', '', ''),
(39, 'Urinary tract infection', '', ''),
(40, 'AIDS', '', ''),
(41, 'Fungal infection', '', ''),
(42, 'Allergy', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `disease_exercises`
--

CREATE TABLE IF NOT EXISTS `disease_exercises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disease` varchar(100) NOT NULL,
  `prevention_tips` text NOT NULL,
  `exercises` text NOT NULL,
  `medication` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `disease_exercises`
--

INSERT INTO `disease_exercises` (`id`, `disease`, `prevention_tips`, `exercises`, `medication`) VALUES
(1, 'Fungal infection', 'Keep skin dry and clean. \r\nWear breathable clothing and shoes. \r\nAvoid tight-fitting clothing. \r\nPractice good hygiene. \r\nDon''t share personal items like towels or shoes.', 'No specific excercises applicable ', 'Topical antifungal medications (creams, ointments). Oral antifungal medications in severe cases (prescribed by doctor).'),
(2, 'GERD', 'Maintain a healthy weight. \r\nEat smaller, more frequent meals. \r\nAvoid trigger foods (spicy, fatty, acidic). \r\nDon''t eat close to bedtime. \r\nElevate the head of your bed.', 'Light cardio exercises like walking or swimming can help manage weight and improve digestion (consult doctor before starting).', 'Medications to reduce stomach acid (proton pump inhibitors, H2 blockers).'),
(3, 'Allergy', 'Identify and avoid triggers (pollen, dust mites, pet dander, etc.). \r\nTake allergy medications (antihistamines) as directed by a doctor. \r\nConsider allergy shots for long-term management.', ' Regular exercise can improve overall health and may help reduce allergy symptoms (consult doctor before starting).', 'Antihistamines, decongestants, corticosteroids (depending on the type and severity of allergy, prescribed by doctor).'),
(4, 'Chronic cholestasis', 'Maintain a healthy weight. \r\nEat a balanced diet low in saturated fat and cholesterol.', 'Regular exercise can help manage weight and improve overall health (consult doctor before starting).', 'Medications to improve bile flow (ursodeoxycholic acid). Surgery may be necessary in severe cases.'),
(5, 'Drug Reaction', 'Take medications exactly as prescribed by a doctor.\r\ninform your doctor about all medications and supplements you are taking.\r\nWear a medical alert bracelet listing any allergies or medications you take.', 'No specific excercises applicable ', 'Treatment depends on the severity of the reaction. May involve stopping the medication and managing symptoms.'),
(6, 'Peptic ulcer disease', 'Avoid smoking and excessive alcohol consumption. \r\nManage stress.\r\nEat smaller, more frequent meals.\r\nAvoid spicy or irritating foods.', 'No specific excercises applicable ', 'Medications to reduce stomach acid (proton pump inhibitors, H2 blockers) and promote healing. Antibiotics may be needed if caused by H. pylori infection.'),
(7, 'AIDS', 'Practice safe sex . \r\nDon''t share needles or drug paraphernalia.\r\nGet tested for HIV regularly.', 'Regular exercise can improve overall health and well-being (consult doctor before starting).', 'Antiretroviral therapy (ART) is highly effective in managing HIV and preventing transmission.'),
(8, 'Diabetes', 'Maintain a healthy weight.\r\nEat a healthy diet.\r\nExercise regularly.\r\nMonitor blood sugar levels.', 'Regular exercise is crucial for managing blood sugar levels (consult doctor before starting).', 'Medications to control blood sugar levels (oral medications or insulin).'),
(9, 'Gastroenteritis', 'Wash hands frequently. \r\nPractice good hygiene. \r\nAvoid contaminated food and water.', 'No specific excercises applicable ', 'Fluids and electrolytes to prevent dehydration. Over-the-counter medications for symptom relief (consult doctor).'),
(10, 'Bronchial Asthma', 'Identify and avoid triggers (dust mites, pollen, smoke, etc.).\r\nTake medications (inhalers) as prescribed by a doctor.\r\nManage stress.', 'Regular exercise can improve lung function and reduce asthma symptoms (consult doctor before starting a program).', 'Inhaled corticosteroids, bronchodilators, and other medications depending on the severity of asthma ( as prescribed by doctor).'),
(11, 'Migraine', 'Inhaled corticosteroids, bronchodilators, and other medications depending on the severity of asthma ( as prescribed by doctor).', 'Regular exercise can help reduce stress and improve overall health, which may benefit migraine frequency (consult doctor before starting).', 'Medications to prevent migraines (beta-blockers, antidepressants) or treat acute attacks (triptans, pain relievers) - prescribed by a doctor.'),
(12, 'Cervical spondylosis', 'Maintain good posture while sitting, standing, and sleeping.', 'Gentle neck stretches and strengthening exercises (consult doctor or physical therapist before starting)', 'Pain relievers (over-the-counter), muscle relaxants (prescription).'),
(13, 'Paralysis (brain hemorrhage)', 'Manage blood pressure.', 'N/A (physical therapy after consulting a doctor for rehabilitation).', 'Medications to control blood pressure, reduce swelling, and prevent complications (as prescribed by doctor).'),
(14, 'Jaundice', 'Address underlying cause (e.g., hepatitis, gallbladder stones).\r\nPrenatal care for pregnant women ', 'No specific exercises applicable ', 'Phototherapy (light therapy) for newborns.- Medications such as Iron supplements, Antihistamines, Cholestyramine, Rifampin, and Naltrexone to treat the underlying condition ( as prescribed by doctor).'),
(15, 'Malaria', 'Mosquito bite prevention (repellent, nets).', 'No specific exercises applicable ', 'Antimalarial medications such as chloroquine phosphate,atovaquone-proguanil,quinine and mefloquine. (as prescribed by doctor).'),
(16, 'Chicken pox', 'Vaccination (varicella vaccine).Stay away from people suffering from chickenpox.', 'No specific exercises applicable ', 'Anti-itch medication (calamine lotion) for symptomatic relief.'),
(17, 'Dengue', 'Mosquito bite prevention (repellent, nets).', 'No specific exercises applicable ', 'Pain relievers and fluids to manage symptoms. Supportive care.'),
(18, 'Typhoid', 'Vaccination (typhoid vaccine).', 'No specific exercises applicable ', 'Antibiotics such as Fluoroquinolones,Cepahalosporins,Macrolides,Carbapenems and Chloramphenicol ( as prescribed by doctor).'),
(19, 'hepatitis A', 'Vaccination (hepatitis A vaccine).', 'No specific exercises applicable ', 'Does not require medication for itself, usually resolves on its own'),
(20, 'Hypoglycemia', 'Regular meals and healthy eating habits.', 'No specific excercises applicable ', 'Glucagon (in severe cases, prescribed by doctor).'),
(21, 'Osteoarthristis', 'Maintain a healthy weight. Strengthen muscles around the joint.', 'Low-impact exercises like walking, and swimming (consult doctor or physical therapist).', 'Pain relievers, anti-inflammatory medication (consult doctor). In severe cases, joint replacement surgery.'),
(22, 'Arthritis', 'Maintain a healthy weight. Low-impact exercises to maintain joint mobility.', ' Low-impact exercises like walking, swimming (consult doctor or physical therapist).', 'Pain relievers, anti-inflammatory medication (consult doctor). Physical therapy.'),
(23, '(vertigo) Paroymsal  Positional Vertigo', 'Specific head maneuvers performed by a healthcare professional.', 'Canalith repositioning maneuvers (performed by a healthcare professional).', 'Medication rarely used, only in severe cases (consult doctor).'),
(24, 'Acne', 'Wash face regularly with a gentle cleanser. \r\nAvoid touching your face.\r\nManage stress.\r\nMaintain a healthy diet.', 'No specific exercises applicable ', 'Topical medications (retinoids, antibiotics, benzoyl peroxide). Oral antibiotics or hormonal therapy in severe cases (as prescribed by a doctor).'),
(25, 'Urinary tract infection', 'Drink plenty of fluids.\r\nWipe from front to back after using the toilet.\r\nEmpty your bladder regularly. \r\nAvoid holding urine.', 'Pelvic floor muscle exercises (Kegels) may help prevent recurrent UTIs.', 'Antibiotics such as Nitrofurantoin,Sulfonamides,Amoxicillin,Doxycycline,Ceftriaxone,Cephalexin,Ciprofloxacin,Fosfomycin (as prescribed by a doctor).'),
(26, 'Psoriasis', 'Manage stress.\r\nMaintain a healthy weight.\r\nMoisturize skin regularly. \r\nAvoid triggers (certain foods, medications).', 'Low-impact exercises like walking or swimming can improve overall health and well-being. Consult a doctor before starting any exercise program.', 'Topical medications (corticosteroids, retinoids, vitamin D analogs). Light therapy. Oral medications or biologics in severe cases (as prescribed by doctor).'),
(27, 'Impetigo', 'Maintain good hygiene.\r\nWash hands frequently.\r\nAvoid scratching or touching blisters.\r\nKeep infected area clean and covered.', 'No specific exercises are applicable.Avoid exercise at all costs', 'Topical antibiotics such as Cepahlosporins,amoxicillin-clavulanate,dicloxacillin,clindamycin,doxycycline (as prescribed by doctor).'),
(28, 'Hepatitis B', 'Vaccination (hepatitis B vaccine).\r\nPractice safe sex.\r\nAvoid sharing needles or personal care items.', 'No specific exercises applicable ', 'Antiviral medications such as Adefovir Dipivoxil,Entecavir,Lamivudine,Telbivudine,Thymalfasin (prescribed by doctor) can help manage chronic infection.'),
(29, 'Hepatitis C', 'Avoid sharing needles or drug paraphernalia. - Practice safe sex.', 'No specific excercises applicable ', 'Antiviral medications such as Sofosbuvir,Grazoprevir,Boceprevir,Daclatasvir,Thymalfasin (prescribed by doctor) can treat most Hepatitis C infections.'),
(30, 'Hepatitis D', 'Vaccination against hepatitis B (prevents hepatitis D as well). - Avoid sharing needles or drug paraphernalia. - Practice safe sex.', 'No specific exercises applicable ', 'No specific medication for Hepatitis D other than Pegylated interferon alpha, but treating underlying Hepatitis B can help.'),
(31, 'Hepatitis E', 'Maintain good hygiene and sanitation.\r\nWash hands frequently.\r\nAvoid contaminated water and food.', 'No specific exercises applicable ', 'Antiviral drugs like Ribavirin can be used to improve liver enzymes and functions, but supportive care to manage symptoms.'),
(32, 'Alcoholic hepatitis', 'Limit alcohol consumption or abstain completely.\r\nMaintain a healthy diet.', 'No specific exercises applicable ', 'Medications to manage complications such as Prednisolone and Pentoxifyline for severe cases (as prescribed by doctor). In severe cases, liver transplant may be considered.'),
(33, 'Common Cold', 'Wash hands frequently.\r\nAvoid close contact with sick people.\r\nMaintain a healthy lifestyle (diet, sleep).', 'No specific exercises applicable ', 'Over-the-counter medications for symptom relief (consult doctor). Most cases resolve on their own.'),
(34, 'Pneumonia', 'Get vaccinated against influenza and pneumococcus (depending on age and risk factors).\r\nWash hands frequently. \r\nAvoid close contact with sick people.\r\nMaintain a healthy lifestyle (diet, sleep).', 'Try light breathing exercises , walking', 'Antibiotics for bacterial pneumonia such as azithromycin,cephalosporin,macrolides. \r\nAntiviral medications for viral pneumonia such asamantadine,rimantadine,zanamivir,ribavirin.\r\nSupportive care like oxygen therapy may be needed.'),
(35, 'Dimorphic hemmorhoids(piles)', 'Maintain a high-fiber diet to promote regular bowel movements.\r\nDrink plenty of fluids.\r\nAvoid straining during bowel movements.\r\nMaintain a healthy weight.', 'Pelvic floor muscle exercises (Kegels) may help improve circulation and reduce straining.', 'Over-the-counter creams or ointments for pain relief. Sitz baths. Surgery may be necessary in severe cases (consult doctor).'),
(36, 'Heart attack', 'Maintain a healthy weight.\r\nEat a heart-healthy diet.\r\nExercise regularly. \r\nManage stress.\r\nControl blood pressure and cholesterol.\r\nDon''t smoke.', 'Regular exercise strengthens the heart and improves circulation (consult doctor before starting).', 'Medications to prevent blood clots (aspirin), lower blood pressure (various classes), and manage cholesterol (statins). In some cases, surgery or angioplasty may be needed.'),
(37, 'Varicose veins', 'Maintain a healthy weight.\r\nExercise regularly to improve circulation.\r\nElevate legs when resting.\r\nAvoid prolonged sitting or standing.\r\nWear compression stockings.', 'Leg exercises that promote circulation can be beneficial (consult doctor before starting).', 'Compression stockings are the mainstay of treatment. Sclerotherapy or laser treatment may be used in some cases (consult doctor).'),
(38, 'Hypothyroidism', 'Maintain a healthy weight.', 'Regular exercise can improve mood and overall health (consult doctor before starting).', 'Levothyroxine (synthetic thyroid hormone) is the primary medication to replace missing thyroid hormone.'),
(39, 'Hyperthyroidism', 'Maintain a healthy weight. Avoid stimulants like caffeine.', 'Regular exercise can help manage weight and improve overall health (consult doctor before starting).', 'Antithyroid medications (methimazole, PTU) to reduce thyroid hormone production. Radioactive iodine therapy or surgery may be considered in some cases (consult doctor).'),
(40, 'Tuberculosis', 'Get vaccinated with BCG vaccine (in some countries).\r\nAvoid close contact with infected people.\r\nMaintain a healthy lifestyle (diet, sleep).', 'No specific exercises applicable ', 'Antibiotics are used in combination for several months to treat TB. Completing the full course of medication is crucial.'),
(41, 'Hypertension', 'Maintain a healthy weight.\r\nReduce sodium intake.\r\nLimit alcohol consumption.\r\nManage stress.\r\nGet enough sleep.\r\nRegular Medical Checkups', 'Aerobic exercise ,Strength training ,Low-impact exercises', 'Diuretics \r\nACE inhibitors (angiotensin-converting enzyme inhibitors)\r\nARBs (angiotensin II receptor blockers)\r\nBeta-blockers\r\nCalcium channel blockers');

-- --------------------------------------------------------

--
-- Table structure for table `exercise_tbl`
--

CREATE TABLE IF NOT EXISTS `exercise_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_part` varchar(100) NOT NULL,
  `equipment` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `target` varchar(100) NOT NULL,
  `instructions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exercise_tbl`
--

INSERT INTO `exercise_tbl` (`id`, `body_part`, `equipment`, `name`, `target`, `instructions`) VALUES
(1, 'waist', 'body weight', '3/4 sit-up', 'abs', 'Lie flat on your back with your knees bent and feet flat on the ground. Place your hands behind your head with your elbows pointing outwards. Engaging your abs slowly lift your upper body off the ground; curling forward until your torso is at a 45-degree angle. Pause for a moment at the top; then slowly lower your upper body back down to the starting position. Repeat for the desired number of repetitions.'),
(2, 'waist', 'body weight', '45Ã‚Â° side bend', 'abs', 'Stand with your feet shoulder-width apart and your arms extended straight down by your sides.Keeping your back straight and your core engaged; slowly bend your torso to one side lowering your hand towards your knee.Pause for a moment at the bottom then slowly return to the starting position.Repeat on the other side.;Continue alternating sides for the desired number of repetitions.'),
(3, 'upper legs', 'body weight', 'all fours squad stretch', 'quads', 'Start on all fours with your hands directly under your shoulders and your knees directly under your hips.Extend one leg straight back keeping your knee bent and your foot flexed.Slowly lower your hips towards the ground feeling a stretch in your quads.Hold this position for 20-30 seconds.Switch legs and repeat the stretch on the other side.'),
(4, 'back', 'cable', 'alternate lateral pulldown', 'abs', 'Sit on the cable machine with your back straight and feet flat on the ground.Grasp the handles with an overhand grip slightly wider than shoulder-width apart.Lean back slightly and pull the handles towards your chest squeezing your shoulder blades together.Pause for a moment at the peak of the movement then slowly release the handles back to the starting position.Repeat for the desired number of repetitions.'),
(5, 'waist', 'body weight', 'air bike', 'abs', 'Lie flat on your back with your hands placed behind your head.Lift your legs off the ground and bend your knees at a 90-degree angle.Bring your right elbow towards your left knee while simultaneously straightening your right leg.Return to the starting position and repeat the movement on the opposite side bringing your left elbow towards your right knee while straightening your left leg.Continue alternating sides in a pedaling motion for the desired number of repetitions.');

-- --------------------------------------------------------

--
-- Table structure for table `food_recommendation`
--

CREATE TABLE IF NOT EXISTS `food_recommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disease` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `foods_to_take` text NOT NULL,
  `foods_to_avoid` text NOT NULL,
  `how_food_helps` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `food_recommendation`
--

INSERT INTO `food_recommendation` (`id`, `disease`, `description`, `foods_to_take`, `foods_to_avoid`, `how_food_helps`) VALUES
(2, 'Fungal infection', 'Growth of fungus in the body', 'Probiotic-rich foods (yogurt, kefir).Foods rich in prebiotics (fruits, vegetables, whole grains).Limit sugar intake', '* Processed foods with high sugar content', '* Probiotics support a healthy gut microbiome, potentially inhibiting fungal growth.  * Prebiotics nourish beneficial gut bacteria that can compete with fungus.  * Limiting sugar reduces fungal food sources.'),
(3, 'GERD', 'Stomach acid backs up into the esophagus', '* Smaller, more frequent meals  * Low-fat and non-acidic foods (cooked vegetables, lean protein)  * Avoid trigger foods (e.g., spicy foods, chocolate, peppermint)', '* Fatty or fried foods  * Citrus fruits  * Tomato-based foods  * Chocolate  * Peppermint', '* Smaller meals reduce pressure on the lower esophageal sphincter (LES).  * Low-fat and non-acidic foods minimize stomach irritation.  * Identifying and avoiding trigger foods is crucial.'),
(4, 'Allergy', 'Immune system overreaction to a harmless substance', '* Focus on identifying and eliminating trigger foods (common allergens: milk, eggs, peanuts, tree nuts, wheat, soy, fish, shellfish)', '* Foods containing known allergens', '* Elimination diet can help pinpoint food triggers.'),
(5, 'Chronic cholestasis', 'Liver disease affecting bile flow', '* Liver-protective foods (fruits, vegetables, whole grains)  * Healthy fats (olive oil, avocado)', '* Saturated and trans fats (fried foods, red meat)  * Refined carbohydrates and sugary drinks', '*  Provides essential nutrients for liver health.  * Healthy fats may support bile production and metabolism.  * Limiting unhealthy fats and sugars reduces stress on the liver.'),
(6, 'Drug Reaction', 'Adverse response to a medication', '*  Generally, no specific dietary changes unless advised by doctor. Focus on a healthy, balanced diet.', '*  Varies depending on the drug and reaction. Consult your doctor for specific guidance.', '*  A healthy diet supports overall well-being and may help the body process medication better.'),
(7, 'Peptic ulcer disease', 'Open sores in the stomach lining or duodenum', '* Bland, easily digestible foods (cooked vegetables, lean protein)  *  Regular meals (helps maintain stomach acid levels)', '* Spicy foods (irritate ulcers)  * Acidic foods (citrus fruits, tomatoes)  * Alcohol  * Caffeine (may increase stomach acid)', '* Bland foods minimize irritation.  * Regular meals help regulate stomach acid production.  * Spicy, acidic foods, alcohol, and caffeine can worsen ulcers.'),
(8, 'AIDS', 'Weakened immune system due to HIV virus', '* Nutrient-rich diet (fruits, vegetables, whole grains, lean protein)', '* Processed foods with low nutritional value  * Excessive alcohol or sugary drinks', '* Provides essential nutrients to support the immune system and fight infections.'),
(9, 'Diabetes', 'Chronic condition affecting blood sugar regulation', '* Non-starchy vegetables (broccoli, spinach)  * Whole grains  * Lean protein sources (chicken, beans)  * Fruits (berries, apples)', '* Sugary drinks and processed foods  * Refined carbohydrates (white bread, pasta)  * Red meat', '* Fiber in vegetables slows down sugar absorption.  * Whole grains provide sustained energy release, preventing blood sugar spikes.  * Lean protein helps manage blood sugar levels.'),
(10, 'Gastroenteritis', 'Inflammation of the stomach and intestines (diarrhea, vomiting)', '* BRAT diet (Bananas, Rice, Applesauce, Toast) initially (bland, easily digestible)  * Gradually reintroduce other foods as tolerated (probiotics may be helpful)', '* Dairy products (may worsen diarrhea)  * Greasy or spicy foods  * Caffeine and alcohol (dehydrating)', '* BRAT diet provides gentle hydration and eases digestive symptoms.  * Probiotics may help restore gut flora balance.  * Avoid foods that can irritate the digestive system or worsen dehydration.'),
(11, 'Bronchial Asthma', 'Chronic inflammatory airway disease causing breathing problems', '* Anti-inflammatory diet (fruits, vegetables, whole grains, healthy fats)  * Omega-3 fatty acids (fatty fish)', '* Processed foods with unhealthy fats  * Added sugars and refined carbohydrates', '* Anti-inflammatory diet may help manage airway inflammation.  * Omega-3s have anti-inflammatory properties.'),
(12, 'Hypertension', 'High blood pressure', '- Low-sodium diet (<2,000mg sodium/day) - Fruits & vegetables rich in potassium, magnesium, calcium (bananas, leafy greens, nuts)  - Whole grains', '- Processed foods high in sodium (canned goods, cured meats) - Added table salt  - Excessive saturated & unhealthy fats (red meat, fried foods)', '- Lowers blood pressure naturally through potassium, magnesium, and calcium. <br> - Whole grains provide fiber, which can help manage weight and blood pressure.'),
(13, 'Migraine', 'Severe headache disorder', '- Omega-3 fatty acids (fish, flaxseed oil) - Magnesium-rich foods (dark chocolate, avocados).Ginger', '- Foods that may trigger migraines (aged cheese, red wine, aspartame)  - Skipping meals', '- Omega 3s have anti-inflammatory properties that may reduce migraine frequency and severity. - Magnesium deficiency is linked to migraines; these foods help replenish it.Ginger has shown effectiveness in reducing migraine pain.'),
(14, 'Cervical spondylosis', 'Degenerative spine condition', '- Anti-inflammatory foods (turmeric, berries) - Calcium & vitamin D for bone health (dairy products, fortified foods)  - Weight management to reduce pressure on spine', '- Processed foods high in saturated fat  - Refined carbohydrates (white bread, pastries)', 'Anti-inflammatory foods may help manage pain and inflammation. Calcium and vitamin D support bone health and prevent further degeneration. Weight management reduces stress on the spine and may improve symptoms.'),
(15, 'Paralysis (brain hemorrhage)', 'Loss of movement due to bleeding in the brain (Emergency! Seek immediate medical attention)', 'Fruits,Cooked Vegetables.Soft Foods,Whole Grains.Other Dietary recommendations depend on individual recovery plan after medical treatment', 'High Sodium foods , Processed and Refined foods,Sugary drinks,Alcohol', 'Proper nutrition is crucial for recovery, but specific recommendations depend on the severity and location of the hemorrhage.'),
(16, 'Jaundice', 'Yellowing of skin and eyes due to bilirubin buildup', ' Foods rich in antioxidants (vitamin C, E) to support liver function (citrus fruits, broccoli)\r\n Milk thistle (consult doctor before use)', 'Alcohol (impairs liver function) \r\nFatty foods', ' Antioxidants help the liver detoxify and remove bilirubin.\r\n Milk thistle may support liver health (consult doctor before use).'),
(17, 'Malaria', 'Mosquito-borne parasitic infection', ' Iron-rich foods (lean meat, leafy greens) to replenish iron loss  \r\n Folic acid (important for red blood cell production)\r\n Plenty of fluids to prevent dehydration', 'Raw or undercooked meat/fish (increases infection risk)', ' Iron deficiency is common in malaria; these foods help replenish it.\r\n Folic acid supports red blood cell production, which is affected by malaria. \r\n Fluids are essential to prevent dehydration, a common complication.'),
(18, 'Chicken pox', 'Contagious infection with itchy rash', 'Soft and Bland foods like cooked vegetables,bananas,yogurt and rice.Non Acidic foods like peaches,melons,cucumbers and spinach.', 'Acidic foods such as grapes, pineapple, tomatoes, citrus fruits and juices,Spicy and Sour foods like pickles,chillies,peppers.Hard and crunchy foods like chips,pretzels,chewed candy.', 'Soft and bland foods for ease of consumption.Non Acidic food prevent the body from releasing histamines which helps in preventing inflammation,skin rash and infections.'),
(19, 'Dengue', 'Mosquito-borne viral infection', 'Fluids (water, coconut water) to prevent dehydration \r\nElectrolyte-rich drinks (sports drinks) to replenish lost minerals', 'Alcohol (dehydrates and increases risk of bleeding) ', 'Fluids are crucial to prevent dehydration, a common complication. \r\nElectrolytes help replenish minerals lost due to fever and vomiting.'),
(20, 'Typhoid', 'Bacterial infection spread through contaminated food/water', 'Probiotics (yogurt, kimchi) to support gut health after antibiotic treatment', 'Unpasteurized dairy products \r\n Contaminated street food and water', ' Probiotics help restore gut flora after antibiotic treatment, which can be disrupted during typhoid.'),
(21, 'hepatitis A', 'Liver infection caused by hepatitis A virus', 'Fruits & vegetables rich in vitamins A, C, and E to support liver function', 'Shellfish (may increase risk of infection)\r\nAlcohol (increases liver stress)', ' Vitamins A, C, and E are antioxidants that support liver function.'),
(22, 'Hypoglycemia', 'It is a condition that occurs when the sugar levels (glucose) in the blood are too low.', 'Complex carbohydrates (whole grains, fruits, vegetables)', 'Refined carbohydrates and sugary drinks', ' Complex carbs provide sustained energy release, preventing hypoglycemia.'),
(23, 'Osteoarthristis', 'It is a degenerative joint disease, in which the tissues in the joint break down over time.', 'Anti-inflammatory diet (fruits, vegetables, whole grains, healthy fats) ,Lean protein sources', 'Processed foods with unhealthy fats (red meat)  \r\n Refined carbohydrates and sugary drinks', 'Anti-inflammatory diet may help manage pain and inflammation.  \r\nLean protein supports healthy joints.'),
(24, 'Hepatitis B', 'Inflammation of one or more joints causes pain and stiffness that can worsen with age.', 'Anti-inflammatory diet (fruits, vegetables, whole grains, healthy fats) ,Lean protein sources', ' Processed foods with unhealthy fats (red meat)  \r\n Refined carbohydrates and sugary drinks', ' Anti-inflammatory diet may help manage pain and inflammation.  * Lean protein supports healthy joints.'),
(25, 'Acne', 'Inflammatory skin condition', 'Moderate intake of dairy (may worsen acne in some)  \r\nFocus on a balanced diet with fruits, vegetables, and whole grains.', 'Processed foods with high sugar and unhealthy fats  * Refined carbohydrates', 'A balanced diet provides essential nutrients for skin health. \r\nLimiting processed foods may help manage inflammation.  \r\nNote: The exact link between diet and acne is complex and may vary by individual.'),
(26, 'Urinary tract infection', 'Bacterial infection in the urinary tract', 'Cranberries (may prevent bacteria adherence)  \r\n Probiotic yogurt (urinary tract health)  \r\n Plenty of fluids (water)', 'Processed foods with high sodium\r\nCaffeinated drinks (can irritate bladder)', 'Cranberries may have properties to prevent UTIs. \r\nProbiotics may support a healthy urinary microbiome.  \r\nHydration helps flush out bacteria.'),
(27, 'Psoriasis', 'Chronic autoimmune skin disease causing red, scaly patches', 'Anti-inflammatory diet (fruits, vegetables, whole grains, healthy fats)  \r\n Omega-3 fatty acids (fatty fish)', ' Processed foods with unhealthy fats \r\n Refined carbohydrates and sugary drinks  \r\n Gluten (may worsen symptoms in some)', '\r\nAnti-inflammatory diet may help manage inflammation and symptoms.  \r\nOmega-3s have anti-inflammatory properties.  \r\nLimiting processed foods, refined carbs, and sugar may be beneficial.\r\nNote: The impact of gluten can vary by individual.'),
(28, 'Impetigo', 'Contagious bacterial skin infection causing blisters and crusting', ' Generally, no specific dietary changes are necessary. Focus on a balanced diet for overall health.', 'No specific foods to avoid.', 'A balanced diet supports the immune system to fight infection.'),
(29, 'Hepatitis B', 'Viral infection of the liver', 'Nutrient-rich diet (fruits, vegetables, whole grains, lean protein)', 'Alcohol,Excessive saturated fat based foods', 'Supports liver function and immunity'),
(30, 'Hepatitis C', 'Viral infection of the liver', 'Nutrient-rich diet (fruits, vegetables, whole grains, lean protein)', 'Alcohol,Excessive fried foods', 'May support liver health.Reduces inflammation'),
(31, 'Hepatitis D', 'Viral infection of the liver (requires Hepatitis B co-infection)', ' Nutrient-rich diet (fruits, vegetables, whole grains, lean protein)', 'Alcohol', 'Supports immune function'),
(32, 'Hepatitis E', 'Viral infection of the liver', 'Nutrient-rich diet (fruits, vegetables, whole grains, lean protein)', 'Contaminated water and food', 'Protein is essential for building and repairing tissues, which is crucial during recovery from illness.\r\nBalanced diet may support liver health.\r\nReduces inflammation'),
(33, 'Alcoholic hepatitis', 'Liver inflammation caused by excessive alcohol consumption', 'Nutrient-rich diet (fruits, vegetables, whole grains, lean protein)', 'Alcohol', 'Promotes liver healing'),
(34, 'Tuberculosis', 'Bacterial lung infection', 'Fruits, green vegetables, whole grains, lean protein sources (chicken, fish, beans), and healthy fats (avocados, nuts, seeds).', 'Processed foods with high sugar and unhealthy fats.Refined carbohydrates , Alcohol , Caffeine, Raw or Undercooked foo', 'Balanced diet supports immune function'),
(35, 'Common Cold', 'Viral upper respiratory infection', 'Citrus fruits, berries, leafy greens, carrots,zinc-rich foods like oysters,lean beef,chickpeas,lentils', ' Processed foods with high sugar and unhealthy fats.Refined carbohydrates , Alcohol ,Dairy Products', ' Fluids help loosen mucus and prevent dehydration.Vitamin C and antioxidants that can support the immune system.Zinc may shorten the duration of cold symptoms.'),
(36, 'Pneumonia', 'Lower respiratory infection (bacterial or viral)', 'Fruits, vegetables, and lean protein sources like chicken,fish,beans,lentils', ' Processed foods with high sugar and unhealthy fats.Refined carbohydrates , Alcohol , Dairy Products', ' Balanced diet supports immune function'),
(37, 'Dimorphic hemmorhoids(piles)', 'Swollen veins in the anus or rectum', 'High-fiber diet (fruits, vegetables, whole grains)', ' Processed foods with high sugar and unhealthy fats.\r\nRefined carbohydrates', ' Fiber helps with bowel movements'),
(38, 'Heart attack', 'Sudden blockage of blood flow to the heart', 'Healthy Fats like olive oils,avocados,nuts and seeds,fruits,vegetables,whole grains', 'High-fat diet, processed foods', 'Heart-healthy diet (fruits, vegetables, whole grains, lean protein)'),
(39, 'Varicose veins', 'Enlarged, twisted veins', 'Fruits, vegetables, whole grains (oatmeal, brown rice).Foods Rich in Vitamin C and Flavonoids like bell peppers , tomatoes ,berries,leafy greens.Foods Omega-3 Fatty Acids like chia seeds,flax seeds ,walnuts', ' Processed foods with high sugar and unhealthy fats  \r\n Refined carbohydrates , Alcohol , Caffeine, High Sodium Foods', 'Fruits, vegetables, and zinc can support the immune system to fight off infections.Fiber and certain nutrients (vitamin C, flavonoids) may improve circulation and reduce inflammation,proteins for healing and repair and hydration to improve overall health.'),
(40, 'Hypothyroidism', 'Underactive thyroid gland', 'Iodine-Rich Foods like seaweed, iodized table salt, fish (cod, tuna, salmon), dairy products (milk, cheese, yogurt).Zinc-Rich Foods like oysters,lean beef,lentils and pumpkin seeds.Fruits and Vegetables.', 'Certain foods that may interfere with medication (consult doctor),Highly Processed Foods,Soy Products', 'Balanced diet for overall health'),
(41, 'Hyperthyroidism', 'Increased metabolism and hormone production', 'Complex carbohydrates (whole grains, fruits, vegetables).\r\nModerate protein sources', 'Refined carbohydrates and sugary drinks (can worsen symptoms)', 'Complex carbs provide sustained energy to manage hyper metabolism.  \r\nModerate protein supports overall health.'),
(42, '(vertigo) Paroymsal  Positional Vertigo', 'Sudden episodes of dizziness triggered by head movement.', 'Stay Hydrated and consume balanced diet for overall health.', 'Avoid refined and processed foods , foods that cause allergic reactions', 'Hydration is important for overall health, including inner ear function.');

-- --------------------------------------------------------

--
-- Table structure for table `health_data`
--

CREATE TABLE IF NOT EXISTS `health_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spo2` int(100) NOT NULL,
  `heartrate` int(100) NOT NULL,
  `temperature` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `health_data`
--

INSERT INTO `health_data` (`id`, `spo2`, `heartrate`, `temperature`) VALUES
(1, 99, 88, 99),
(2, 98, 66, 99),
(3, 97, 60, 99),
(4, 97, 122, 95),
(5, 100, 124, 96),
(7, 99, 109, 96),
(8, 98, 92, 97);

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE IF NOT EXISTS `symptoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Symptom_1` varchar(100) DEFAULT NULL,
  `Symptom_2` varchar(100) DEFAULT NULL,
  `Symptom_3` varchar(100) DEFAULT NULL,
  `Symptom_4` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`id`, `Symptom_1`, `Symptom_2`, `Symptom_3`, `Symptom_4`) VALUES
(2, 'itching', 'skin rash', 'nodal skin eruptions', 'dischromic  patches'),
(3, 'continuous sneezing', 'shivering', 'chills', 'watering from eyes'),
(4, 'stomach pain', 'acidity', 'ulcers on tongue', 'vomiting'),
(5, 'acidity', 'ulcers on tongue', 'vomiting', 'cough'),
(6, 'vomiting', 'vomiting', 'yellowish skin', 'nausea'),
(7, 'skin rash', 'yellowish skin', 'nausea', 'loss of appetite'),
(8, 'indigestion', 'stomach pain', 'stomach pain', 'burning micturition'),
(9, 'muscle wasting', 'loss of appetite', 'burning micturition', 'spotting  urination'),
(10, 'fatigue', 'indigestion', 'abdominal pain', 'passage of gases'),
(11, 'weight loss', 'patches in throat', 'loss of appetite', 'abdominal pain'),
(12, 'cough', 'weight loss', 'high fever', 'extra marital contacts'),
(13, 'headache', 'restlessness', 'restlessness', 'lethargy'),
(14, 'chest pain', 'sunken eyes', 'lethargy', 'irregular sugar level'),
(15, 'back pain', 'cough', 'dehydration', 'diarrhoea'),
(16, 'weakness in limbs', 'high fever', 'breathlessness', 'breathlessness'),
(17, 'chills', 'chest pain', 'dizziness', 'family history'),
(18, 'joint pain', 'dizziness', 'loss of balance', 'loss of balance'),
(19, 'yellowish skin', 'headache', 'headache', 'lack of concentration'),
(20, 'constipation', 'weakness in limbs', 'blurred and distorted vision', 'blurred and distorted vision'),
(21, 'pain during bowel movements', 'neck pain', 'neck pain', 'excessive hunger'),
(22, 'cramps', 'fatigue', 'weakness of one body side', 'dizziness'),
(23, 'weight gain', 'chills', 'fatigue', 'altered sensorium'),
(24, 'mood swings', 'joint pain', 'weight loss', 'weight loss'),
(25, 'neck pain', 'lethargy', 'sweating', 'high fever'),
(26, 'muscle weakness', 'nausea', 'joint pain', 'sweating'),
(27, 'stiff neck', 'abdominal pain', 'dark urine', 'headache'),
(28, 'burning micturition', 'pain during bowel movements', 'swelling of stomach', 'fatigue'),
(29, 'high fever', 'pain in anal region', 'cough', 'dark urine'),
(30, '', 'breathlessness', 'pain in anal region', 'yellowish skin'),
(31, '', 'cramps', 'bloody stool', 'yellowing of eyes'),
(32, '', 'bruising', 'bruising', 'swelling of stomach'),
(33, '', 'weight gain', 'obesity', 'distention of abdomen'),
(34, '', 'cold hands and feets', 'cold hands and feets', 'bloody stool'),
(35, '', 'mood swings', 'mood swings', 'irritation in anus'),
(36, '', 'anxiety', 'anxiety', 'chest pain'),
(37, '', 'knee pain', 'knee pain', 'obesity'),
(38, '', 'stiff neck', 'hip joint pain', 'swollen legs'),
(39, '', 'swelling joints', 'swelling joints', 'mood swings'),
(40, '', 'pus filled pimples', 'movement stiffness', 'restlessness'),
(41, '', 'bladder discomfort', 'spinning movements', 'hip joint pain'),
(42, '', 'skin peeling', 'blackheads', 'swelling joints');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE IF NOT EXISTS `user_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `blood_group` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `userimage` tinytext NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`id`, `name`, `number`, `email`, `address`, `age`, `blood_group`, `gender`, `height`, `weight`, `userimage`, `username`, `password`) VALUES
(1, 'George Geo', '9745885816', 'georgegeo.8166@gmail.com', 'qwerty', '21', 'O+ve', 'Male', '176', '68', 'image1.jpg', 'george', 'George@123'),
(2, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image2.jpg', 'aashu', 'aashu'),
(3, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image3.jpg', 'aashu', 'aashu'),
(4, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image4.jpg', 'aashu', 'aashu'),
(5, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image5.jpg', 'aashu', 'aashu'),
(6, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image6.jpg', 'aashu', 'aashu'),
(7, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image7.jpg', 'aashu', 'aashu'),
(8, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image8.jpg', 'aashu', 'aashu'),
(9, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image9.jpg', 'aashu', 'aashu'),
(10, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image10.jpg', 'aashu', 'aashu'),
(11, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image11.jpg', 'aashu', 'aashu'),
(12, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image12.jpg', 'aashu', 'aashu'),
(13, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image13.jpg', 'aashu', 'aashu'),
(14, 'Aashuthosh', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam, Thodupuzha', '21', 'O+ve', 'Male', '163', '66', 'image14.jpg', 'aashu', 'aashu'),
(15, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image15.jpg', '', ''),
(16, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image16.jpg', '', ''),
(17, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image17.jpg', '', ''),
(18, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image18.jpg', '', ''),
(19, '', '', '', '', '', '', '', '', '', 'image19.jpg', '', ''),
(20, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image20.jpg', '', ''),
(21, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image21.jpg', '', ''),
(22, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image22.jpg', '', ''),
(23, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image23.jpg', '', ''),
(24, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image24.jpg', '', ''),
(25, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image25.jpg', '', ''),
(26, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image26.jpg', '', ''),
(27, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image27.jpg', '', ''),
(28, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image28.jpg', '', ''),
(29, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image29.jpg', '', ''),
(30, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image30.jpg', '', ''),
(31, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image31.jpg', '', ''),
(32, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image32.jpg', '', ''),
(33, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image33.jpg', '', ''),
(34, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image34.jpg', '', ''),
(35, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image35.jpg', '', ''),
(36, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image36.jpg', '', ''),
(37, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image37.jpg', '', ''),
(38, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image38.jpg', '', ''),
(39, 'aashu', '6302504840', 'aashuthoshsudheer@gmail.com', 'Dhanwantari Sadanam', '21', 'O+ve', 'Male', '163', '66', 'image39.jpg', 'aashu', 'aashu'),
(40, '', '6302504840', '', '', '', 'O+ve', '', '', '', 'image40.jpg', '', ''),
(41, 'Cristin Siljo', '9746993992', 'cristinsiljo18@gmail.com', 'Anchukandathil House ', '21', 'A+', 'Male', '170', '71', 'image41.jpg', 'cristin', 'Cristin@123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
