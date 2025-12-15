-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 08:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luminelle`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_qa`
--

CREATE TABLE `chatbot_qa` (
  `id` int(11) NOT NULL,
  `category` enum('skincare','app-usage') NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `order_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatbot_qa`
--

INSERT INTO `chatbot_qa` (`id`, `category`, `question`, `answer`, `order_num`) VALUES
(1, 'skincare', 'How often should I cleanse my face?', 'Cleanse your face twice daily - once in the morning and once at night. Morning cleansing removes oil buildup from overnight, while evening cleansing removes makeup, sunscreen, dirt, and pollutants accumulated during the day. Over-cleansing can strip your skin\'s natural oils and cause irritation.', 1),
(2, 'skincare', 'Do I really need sunscreen every day?', 'Yes! Sunscreen should be worn daily, even on cloudy days and indoors near windows. UV rays penetrate clouds and glass, causing premature aging, dark spots, and increasing skin cancer risk. Apply SPF 30 or higher every morning as the last step of your routine, and reapply every 2 hours when outdoors.', 2),
(3, 'skincare', 'What\'s the correct order to apply skincare products?', 'Apply products from thinnest to thickest consistency: 1) Cleanser, 2) Toner, 3) Serum, 4) Eye cream, 5) Moisturizer, 6) Sunscreen (morning only). This allows each product to absorb properly. Wait 30-60 seconds between steps for better absorption.', 3),
(4, 'skincare', 'How long does it take to see results from skincare products?', 'Most products need 6-12 weeks of consistent use to show results. Your skin renews itself every 28 days, so changes happen gradually. Hydrating products may work faster (days to weeks), while anti-aging or acne treatments need longer (8-12 weeks). Be patient and consistent!', 4),
(5, 'skincare', 'Can I use retinol and vitamin C together?', 'Yes, but use them at different times. Apply vitamin C in the morning under sunscreen for antioxidant protection. Use retinol at night since it makes skin sun-sensitive. This combination brightens skin, reduces fine lines, and provides comprehensive anti-aging benefits without irritation.', 5),
(6, 'skincare', 'How do I know my skin type?', 'Take our Elle Guide quiz for personalized results! Generally: Oily skin feels greasy and shiny by midday; Dry skin feels tight and flaky; Combination has an oily T-zone with dry cheeks; Normal skin is balanced; Sensitive skin reacts easily to products with redness or irritation.', 6),
(7, 'skincare', 'What\'s the difference between dry and dehydrated skin?', 'Dry skin lacks oil (sebum) and is a skin type. Dehydrated skin lacks water and is a condition that can affect any skin type, even oily skin. Dry skin needs oil-based products (rich creams), while dehydrated skin needs water-based products (hydrating serums with hyaluronic acid).', 7),
(8, 'skincare', 'Should I exfoliate every day?', 'No. Over-exfoliating damages your skin barrier. Exfoliate 2-3 times per week for most skin types. Sensitive skin may need just once weekly. Use chemical exfoliants (AHAs, BHAs) rather than harsh physical scrubs. If your skin feels raw, tight, or extra sensitive, you\'re exfoliating too often.', 8),
(9, 'skincare', 'Do I need different products for morning and night?', 'Yes! Morning routines focus on protection (antioxidants, sunscreen). Night routines focus on repair and treatment (retinol, stronger actives). Your skin repairs itself while you sleep, making nighttime ideal for active ingredients. Always use SPF in the morning but never at night.', 9),
(10, 'skincare', 'Can diet really affect my skin?', 'Absolutely! High-sugar and high-dairy diets can trigger acne and inflammation. Foods rich in antioxidants (berries, leafy greens), omega-3s (fish, nuts), and water help skin glow. Check the \"Foods to Eat\" and \"Foods to Avoid\" sections in Lumin Routine for specific concerns.', 10),
(11, 'skincare', 'How do I treat acne without drying out my skin?', 'Use gentle, non-stripping cleansers and balance acne treatments with hydration. Apply acne-fighting ingredients (salicylic acid, benzoyl peroxide) as spot treatments, not all over. Always moisturize - even oily, acne-prone skin needs hydration. Avoid harsh scrubs that can worsen inflammation.', 11),
(12, 'skincare', 'What causes dark spots and how can I prevent them?', 'Dark spots form from sun exposure, acne scarring, or inflammation. Prevention is key: wear SPF daily, don\'t pick at acne, and treat inflammation quickly. For existing spots, use vitamin C, niacinamide, or alpha arbutin. Results take 8-12 weeks. See our Lumin Routine for detailed guidance.', 12),
(13, 'skincare', 'Are expensive skincare products better than affordable ones?', 'Not necessarily! What matters is the active ingredient concentration and formulation, not the price. Many affordable products contain the same effective ingredients as luxury brands. Focus on ingredients proven to work (retinol, vitamin C, niacinamide) regardless of price tag.', 13),
(14, 'skincare', 'Should I change my skincare routine with the seasons?', 'Yes, adjust based on climate changes. Winter often requires richer moisturizers and more hydration. Summer may need lighter, oil-free formulas. However, keep core products (cleanser, sunscreen, treatments) consistent year-round and only adjust moisturizer weight and hydration boosters.', 14),
(15, 'skincare', 'Can stress really affect my skin?', 'Yes! Stress triggers hormones (cortisol) that increase oil production, cause breakouts, worsen conditions like eczema and psoriasis, and accelerate aging. Manage stress through sleep, exercise, meditation, and self-care. Track your skin in the Glow Calendar to notice stress-related patterns.', 15),
(16, 'app-usage', 'How do I take the Elle Guide skin quiz?', 'Click \"Elle Guide\" in the navigation menu, answer 6 simple questions about your skin\'s behavior and concerns, and get instant results revealing your skin type with personalized tips. You can retake the quiz anytime if your skin changes. Your result is saved in your profile.', 16),
(17, 'app-usage', 'What is the Lumin Routine feature?', 'Lumin Routine provides detailed information about 10 common skin concerns. Click on any concern to learn about causes, recommended ingredients, foods to eat and avoid, myth-busting facts, and helpful suggestions. It\'s your personal skincare encyclopedia!', 17),
(18, 'app-usage', 'How do I add a journal entry in Glow Calendar?', 'Go to Glow Calendar, click any date (today or past dates only), then click \"Add Entry.\" Fill in your morning and evening routines, optionally upload photos, add personal notes, select completion status, and save. You can edit entries anytime.', 18),
(19, 'app-usage', 'Can I upload photos without writing routine details?', 'Yes! All fields are optional except completion status. You can upload just photos, write just text, or combine both. The app is flexible to match your journaling style. Photos help track progress over time.', 19),
(20, 'app-usage', 'How do I edit or delete a past entry?', 'In Glow Calendar, click on any date with an entry, then click \"View Entry.\" From there, you\'ll see \"Edit Entry\" and \"Delete Entry\" buttons. You can update routines, change photos, or remove entries entirely. Editing is available for all past dates.', 20),
(21, 'app-usage', 'What do the different calendar colors mean?', 'White = No entry logged; Baby Pink = Incomplete routine; Fuchsia = Half-done routine; Bright Pink = Complete routine. The colors help you visualize your consistency at a glance. Aim for more bright pink days for the best results!', 21),
(22, 'app-usage', 'How is my streak calculated?', 'Your streak counts consecutive days with ANY journal entry (complete, half-done, or incomplete). Days with no entry break the streak. Current streak shows your ongoing streak; Longest streak shows your personal record. Keep logging daily to build your streak!', 22),
(23, 'app-usage', 'Can I delete just a photo without deleting the whole entry?', 'Yes! When editing an entry, you\'ll see a \"Delete Photo\" link under each existing photo. Click it to remove just that photo while keeping all your text and other content intact. You can also replace photos by uploading new ones.', 23),
(24, 'app-usage', 'How do I copy yesterday\'s routine?', 'When adding an entry for a new date, look for the \"Copy Yesterday\'s Routine\" button at the top of the form. Click it to automatically fill in your morning and evening routines from the previous day. Edit as needed and save.', 24),
(25, 'app-usage', 'Can I view my skincare statistics?', 'Yes! Check your Profile page to see total entries logged, completed days, and how many days you\'ve been tracking. The Glow Calendar also displays your current streak and longest streak at the top. These stats help you stay motivated!', 25);

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `entry_date` date NOT NULL,
  `morning_routine` text DEFAULT NULL,
  `evening_routine` text DEFAULT NULL,
  `morning_photo` varchar(255) DEFAULT NULL,
  `evening_photo` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `completion_status` enum('complete','half-done','incomplete') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `morning_products` text DEFAULT NULL,
  `evening_products` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journal_entries`
--

INSERT INTO `journal_entries` (`id`, `user_id`, `entry_date`, `morning_routine`, `evening_routine`, `morning_photo`, `evening_photo`, `notes`, `completion_status`, `created_at`, `morning_products`, `evening_products`) VALUES
(1, 1, '2025-12-06', 'cleansing\r\napplying Vitamin C serum \r\nmoisturizing\r\nsunscreen (SPF 30+)', 'Double Cleanse\r\nToner \r\nTreatment\r\nNight Cream', '', '', 'hydrated but still oily ', 'complete', '2025-12-06 20:02:32', NULL, NULL),
(2, 3, '2025-12-05', 'Bath, use a face wash', 'Bath', '', '', 'My skin felt smooth ', 'half-done', '2025-12-06 20:28:36', NULL, NULL),
(3, 1, '2025-12-05', 'Cleanse\r\nSunscreen', 'Cleanse\r\nVitamin C serum', '', '', 'smooth', 'half-done', '2025-12-07 01:21:47', NULL, NULL),
(4, 1, '2025-12-04', 'Cleanse \r\nSerum\r\nMoisturise', 'Makeup remover\r\nCleanser\r\nVitamin C', '', '', 'Rough', 'complete', '2025-12-07 01:24:45', NULL, NULL),
(5, 1, '2025-12-03', 'Milk Bath', 'Milk Bath', '', '', '', 'incomplete', '2025-12-07 01:25:32', NULL, NULL),
(6, 1, '2025-12-07', 'Exfoliate\r\nCleanser\r\nToner\r\nSunscreen', 'Cleanser\r\nToner\r\nSerum\r\nEye cream', '', '', 'Smooth and good', 'complete', '2025-12-07 01:27:42', NULL, NULL),
(7, 1, '2025-12-09', 'bath', 'bath', '', '', 'hydrated', 'complete', '2025-12-08 23:07:16', NULL, NULL),
(8, 1, '2025-12-08', 'Bath ', 'Bath ', '1_20251208_morning.png', '1_20251208_evening.png', 'Clean', 'complete', '2025-12-09 22:20:45', NULL, NULL),
(9, 1, '2025-12-12', 'bath', 'bath', '1_20251212_morning.png', '1_20251212_evening.png', 'clean', 'complete', '2025-12-12 05:54:16', NULL, NULL),
(10, 7, '2025-12-12', 'bath', 'bath', '7_20251212_morning.png', '7_20251212_evening.png', 'hydrated and fresh', 'complete', '2025-12-12 06:16:15', NULL, NULL),
(11, 8, '2025-12-13', 'bath\r\ncleanser', 'bath ', '8_20251213_morning.png', '8_20251213_evening.png', 'hydrated', 'half-done', '2025-12-13 00:42:09', NULL, NULL),
(13, 1, '2025-12-13', 'bath', 'bath', '', '', '', 'complete', '2025-12-13 01:03:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skin_concerns`
--

CREATE TABLE `skin_concerns` (
  `id` int(11) NOT NULL,
  `concern_name` varchar(100) NOT NULL,
  `icon` varchar(10) DEFAULT NULL,
  `description` text NOT NULL,
  `foods_to_eat` text NOT NULL,
  `foods_to_avoid` text NOT NULL,
  `recommended_ingredients` text NOT NULL,
  `myth_1_title` varchar(255) DEFAULT NULL,
  `myth_1_truth` text DEFAULT NULL,
  `myth_2_title` varchar(255) DEFAULT NULL,
  `myth_2_truth` text DEFAULT NULL,
  `suggestions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skin_concerns`
--

INSERT INTO `skin_concerns` (`id`, `concern_name`, `icon`, `description`, `foods_to_eat`, `foods_to_avoid`, `recommended_ingredients`, `myth_1_title`, `myth_1_truth`, `myth_2_title`, `myth_2_truth`, `suggestions`) VALUES
(1, 'Acne & Breakouts', '🔴', 'Acne occurs when hair follicles become clogged with oil, dead skin cells, and bacteria. This leads to inflammation, resulting in pimples, whiteheads, blackheads, or cystic breakouts. Hormonal changes, stress, diet, and genetics all play a role in acne development.', 'Fatty fish (salmon, mackerel) rich in omega-3 fatty acids|Leafy greens (spinach, kale) for antioxidants|Probiotic-rich foods (yogurt, kefir, kimchi)|Green tea for anti-inflammatory benefits', 'High-glycemic foods (white bread, sugary snacks, sodas)|Dairy products (milk, cheese, ice cream)|Fried and greasy fast foods|Processed foods with refined sugars', 'Salicylic Acid (BHA) - Unclogs pores and reduces inflammation|Benzoyl Peroxide - Kills acne-causing bacteria|Niacinamide - Reduces inflammation and regulates oil|Tea Tree Oil - Natural antibacterial properties', 'Acne means your skin is dirty', 'Acne is caused by internal factors like hormones and bacteria, not poor hygiene. Over-washing can actually worsen acne by irritating the skin.', 'Popping pimples makes them heal faster', 'Popping pimples can push bacteria deeper, cause scarring, and spread infection to other areas.', 'Cleanse twice daily with a gentle, non-comedogenic cleanser|Change pillowcases regularly to reduce bacteria transfer|Avoid touching your face throughout the day|Manage stress through exercise, meditation, or adequate sleep'),
(2, 'Dark Spots / Hyperpigmentation', '☀️', 'Hyperpigmentation occurs when excess melanin forms deposits in the skin, creating darker patches or spots. This can result from sun exposure, acne scars, hormonal changes (melasma), or skin inflammation. It is more common in darker skin tones but affects all ethnicities.', 'Citrus fruits (oranges, lemons) for vitamin C|Berries (blueberries, strawberries) rich in antioxidants|Tomatoes containing lycopene|Papaya with natural enzymes', 'Excessive caffeine which can increase melanin production|Processed foods with artificial additives|Alcohol that dehydrates skin|High-sodium foods causing inflammation', 'Vitamin C - Brightens and evens skin tone|Kojic Acid - Inhibits melanin production|Alpha Arbutin - Lightens dark spots safely|Niacinamide - Reduces pigmentation transfer', 'Dark spots will fade on their own quickly', 'Without treatment, hyperpigmentation can take months or years to fade, and some types may be permanent without intervention.', 'Lightening ingredients bleach your entire face', 'Properly formulated brightening ingredients target excess pigmentation without affecting your natural skin tone.', 'Wear broad-spectrum SPF 30+ daily, even indoors|Be patient - dark spot treatment takes 8-12 weeks minimum|Use brightening treatments consistently for best results|Avoid picking at acne or skin injuries to prevent new spots'),
(3, 'Fine Lines & Wrinkles', '⏰', 'Fine lines and wrinkles are natural signs of aging that occur when skin loses collagen and elastin, proteins that keep skin firm and elastic. Factors like sun exposure, smoking, repeated facial expressions, and dehydration accelerate their appearance.', 'Avocados rich in healthy fats and vitamin E|Walnuts and almonds for omega-3s|Citrus fruits for collagen production|Leafy greens for vitamins A and C', 'Sugar and high-glycemic foods (cause glycation)|Excessive alcohol (dehydrates skin)|Trans fats and fried foods|Excessive salt (causes dehydration)', 'Retinol/Retinoids - The gold standard for anti-aging|Peptides - Stimulate collagen production|Vitamin C - Brightens and builds collagen|Hyaluronic Acid - Plumps and hydrates', 'Anti-aging products only work if you start young', 'It is never too late to start. Studies show retinoids and other anti-aging ingredients benefit skin at any age.', 'Facial exercises prevent wrinkles', 'Repetitive facial movements actually contribute to wrinkles. Focus on skincare and sun protection instead.', 'Sunscreen is the #1 anti-aging tool - use it daily|Sleep on your back to prevent sleep lines|Stay hydrated - drink at least 8 glasses of water daily|Get adequate sleep (7-9 hours) for skin repair'),
(4, 'Large Pores', '🔍', 'Pores are small openings in the skin that release oil and sweat. While pore size is largely genetic, they can appear larger when clogged with excess oil, dead skin cells, and debris. Sun damage and aging also reduce skin elasticity, making pores more visible.', 'Cucumber for hydration and silica|Green tea for antioxidants and oil control|Citrus fruits for vitamin C|Pumpkin seeds for zinc', 'Dairy products that increase oil production|High-glycemic foods triggering oil production|Fried and greasy foods|Excessive spicy foods (can dilate pores temporarily)', 'Niacinamide - Regulates oil and minimizes pore appearance|Salicylic Acid (BHA) - Penetrates and clears pores|Retinol - Increases cell turnover and firms skin|Clay (Kaolin, Bentonite) - Absorbs excess oil', 'You can permanently shrink your pores', 'Pore size is determined by genetics. However, you can minimize their appearance by keeping them clean and maintaining skin firmness.', 'Pores open and close with temperature', 'Pores do not have muscles to open and close. Steam and cold water can temporarily affect appearance but do not physically change pore size.', 'Cleanse twice daily to prevent pore congestion|Exfoliate 2-3 times weekly to remove dead skin|Never sleep with makeup on|Use non-comedogenic products that will not clog pores'),
(5, 'Dullness / Uneven Skin Tone', '🌫️', 'Dull skin lacks radiance and appears tired, often due to dead skin cell buildup, dehydration, poor circulation, lack of sleep, or reduced cell turnover as we age. Uneven skin tone involves patches of different coloration caused by sun damage, scarring, or inflammation.', 'Oranges and kiwis for vitamin C|Carrots and sweet potatoes for beta-carotene|Berries for antioxidants|Spinach for iron and vitamins', 'Excessive sugar (causes inflammation and dullness)|Processed foods with little nutritional value|Alcohol (dehydrating and inflammation-causing)|Excessive sodium (causes puffiness and dullness)', 'Vitamin C - Brightens and evens tone|AHAs (Glycolic, Lactic Acid) - Exfoliate dead cells|Niacinamide - Evens skin tone|Vitamin E - Protects and nourishes', 'Dull skin just means you need moisturizer', 'While hydration helps, dullness often requires exfoliation to remove dead skin cells that block your skin natural glow.', 'Oily skin cannot be dull', 'Even oily skin can appear dull due to dead skin buildup, dehydration (not the same as dryness), or poor lifestyle habits.', 'Get 7-9 hours of quality sleep for skin regeneration|Exercise regularly to boost circulation and glow|Exfoliate 2-3 times weekly to remove dead skin|Stay hydrated throughout the day'),
(6, 'Redness & Inflammation', '🔥', 'Skin redness and inflammation occur when blood vessels dilate in response to irritation, sensitivity, skin conditions (rosacea, eczema), environmental factors, or harsh products. It can be temporary or chronic, and may be accompanied by warmth, swelling, or discomfort.', 'Fatty fish (salmon, sardines) for anti-inflammatory omega-3s|Leafy greens for antioxidants|Turmeric (curcumin) to reduce inflammation|Blueberries for flavonoids', 'Spicy foods (can trigger facial flushing)|Hot beverages that dilate blood vessels|Alcohol (causes vasodilation and flushing)|Foods high in sugar (inflammatory)', 'Centella Asiatica (Cica) - Soothes and repairs|Niacinamide - Reduces inflammation and redness|Azelaic Acid - Calms redness and kills bacteria|Aloe Vera - Cooling and anti-inflammatory', 'Red skin means you are having an allergic reaction', 'While allergies can cause redness, many factors like temperature changes, exercise, or sensitive skin can also cause temporary redness without being an allergy.', 'You should exfoliate more to reduce redness', 'Over-exfoliation often worsens redness and inflammation. Gentle, minimal exfoliation is better for sensitive, red skin.', 'Identify and avoid your specific triggers|Use lukewarm (not hot) water when cleansing|Choose fragrance-free, gentle products|Apply products with patting motions, not rubbing'),
(7, 'Dark Circles & Under-Eye Bags', '👁️', 'Dark circles result from thin under-eye skin revealing blood vessels, hyperpigmentation, or shadows cast by puffiness. Under-eye bags occur when tissues around the eyes weaken and sag, often filled with fluid. Causes include genetics, aging, lack of sleep, allergies, and dehydration.', 'Leafy greens rich in vitamin K|Tomatoes for lycopene|Almonds for vitamin E|Berries for circulation-boosting antioxidants', 'Excessive salt (causes water retention and puffiness)|Alcohol (dehydrating and causes puffiness)|Processed foods high in sodium|Caffeine late in the day (disrupts sleep)', 'Caffeine - Constricts blood vessels and reduces puffiness|Vitamin C - Brightens and strengthens vessels|Vitamin K - Reduces dark circles|Peptides - Strengthen thin under-eye skin', 'Dark circles always mean you are not getting enough sleep', 'While lack of sleep contributes, genetics, allergies, and aging are often the primary causes of persistent dark circles.', 'Eye cream is just overpriced moisturizer', 'Quality eye creams are specifically formulated for the delicate eye area with targeted ingredients at appropriate concentrations for thin, sensitive skin.', 'Get consistent, quality sleep (7-9 hours)|Sleep with your head slightly elevated to prevent fluid accumulation|Stay hydrated throughout the day|Use a cold compress in the morning to reduce puffiness'),
(8, 'Dehydration', '💧', 'Dehydrated skin lacks water, not oil, making it feel tight, look dull, and show fine lines more prominently. Unlike dry skin (which lacks oil), dehydration is a temporary condition that can affect all skin types, even oily skin. It is caused by weather, diet, lifestyle, or harsh products.', 'Watermelon (92% water content)|Cucumber for hydration and silica|Coconut water for electrolytes|Strawberries and oranges', 'Excessive caffeine (diuretic effect)|Alcohol (severe dehydrator)|High-sodium processed foods|Sugary drinks that do not truly hydrate', 'Hyaluronic Acid - Holds 1000x its weight in water|Glycerin - Powerful humectant|Ceramides - Lock in moisture|Aloe Vera - Hydrates and soothes', 'Oily skin does not get dehydrated', 'Oily skin can be severely dehydrated. Your skin may overproduce oil to compensate for water loss, making it both oily and dehydrated.', 'Drinking water instantly hydrates your skin', 'While internal hydration is important, it takes time for water to reach skin cells. Topical hydration is also crucial for immediate relief.', 'Drink at least 8 glasses of water daily|Use a humidifier in dry environments|Layer hydrating products (toner, serum, moisturizer)|Avoid harsh, stripping cleansers'),
(9, 'Blackheads & Whiteheads', '⚫', 'Blackheads and whiteheads are types of comedones (clogged pores). Blackheads form when pores clog with oil and dead skin but remain open, oxidizing and turning dark. Whiteheads are closed comedones where the clog stays under the skin surface. Both are common in oily and combination skin.', 'Pumpkin seeds for zinc|Leafy greens for vitamins|Probiotic foods (yogurt, sauerkraut)|Fatty fish for omega-3s', 'Dairy products (linked to comedones)|High-glycemic foods (increase oil production)|Fried and greasy foods|Foods high in iodine (can worsen breakouts)', 'Salicylic Acid (BHA) - Penetrates oil to unclog pores|Retinoids - Increase cell turnover, prevent clogging|Niacinamide - Regulates sebum production|Clay Masks - Draw out impurities', 'Blackheads are dirt trapped in pores', 'The black color comes from oxidation of sebum and dead skin cells, not dirt. Even with perfect hygiene, blackheads can form.', 'You can permanently get rid of blackheads', 'If you are prone to them, they will likely return. Consistent prevention with proper skincare is key to keeping them minimal.', 'Cleanse twice daily with a salicylic acid cleanser|Use clay masks 1-2 times weekly|Exfoliate regularly but do not overdo it|Never squeeze with dirty hands or tools'),
(10, 'Sun Damage', '🌞', 'Sun damage (photoaging) occurs from prolonged UV exposure, causing premature aging, dark spots, wrinkles, rough texture, and increased skin cancer risk. UVA rays penetrate deep causing aging, while UVB rays burn the surface. Damage accumulates over time, even from brief daily exposure.', 'Tomatoes (lycopene protects from UV)|Dark leafy greens for antioxidants|Fatty fish for omega-3s|Berries for skin-protecting antioxidants', 'Alcohol (increases sun sensitivity)|Citrus oils on skin before sun (phototoxic)|Excessive sugar (impairs collagen repair)|Processed foods with little protective nutrients', 'Broad-Spectrum Sunscreen SPF 30+ - Essential prevention|Vitamin C - Repairs and protects from UV damage|Retinoids - Repair sun-damaged skin|Niacinamide - Repairs DNA damage', 'You only need sunscreen on sunny days', 'Up to 80% of UV rays penetrate clouds. You need daily sunscreen year-round, even indoors near windows.', 'One application of sunscreen lasts all day', 'Sunscreen breaks down and wears off. Reapply every 2 hours when outdoors, or after swimming or sweating.', 'Wear SPF 30+ daily, reapply every 2 hours outdoors|Seek shade during peak sun hours (10am-4pm)|Wear protective clothing, hats, and sunglasses|Use enough sunscreen - about 1/4 teaspoon for face');

-- --------------------------------------------------------

--
-- Table structure for table `skin_quiz_results`
--

CREATE TABLE `skin_quiz_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `skin_type` varchar(50) NOT NULL,
  `question_1` varchar(10) DEFAULT NULL,
  `question_2` varchar(10) DEFAULT NULL,
  `question_3` varchar(10) DEFAULT NULL,
  `question_4` varchar(10) DEFAULT NULL,
  `question_5` varchar(10) DEFAULT NULL,
  `question_6` varchar(10) DEFAULT NULL,
  `date_taken` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skin_quiz_results`
--

INSERT INTO `skin_quiz_results` (`id`, `user_id`, `skin_type`, `question_1`, `question_2`, `question_3`, `question_4`, `question_5`, `question_6`, `date_taken`) VALUES
(1, 1, 'Oily', 'D', 'D', 'D', 'D', 'C', 'D', '2025-12-05 16:45:10'),
(2, 2, 'Normal', 'B', 'B', 'A', 'A', 'B', 'B', '2025-12-06 19:49:48'),
(3, 3, 'Normal', 'B', 'C', 'B', 'C', 'B', 'B', '2025-12-06 20:26:05'),
(4, 4, 'Oily', 'D', 'D', 'D', 'D', 'B', 'D', '2025-12-07 13:54:33'),
(5, 6, 'Combination', 'A', 'A', 'B', 'C', 'C', 'C', '2025-12-09 23:03:31'),
(6, 7, 'Normal', 'B', 'B', 'B', 'A', 'B', 'B', '2025-12-12 06:14:40'),
(7, 8, 'Normal', 'B', 'B', 'A', 'A', 'B', 'B', '2025-12-13 00:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`) VALUES
(1, 'Nana', 'Akua', 'nana@luminelle.com', '$2y$10$DUuM69YsVkAk0ixV0G1zzOuq38BuHUlw3/3sKgnXwsoK.q3Lbjl/6', '2025-12-05 16:43:29'),
(2, 'Arabella', 'Bediako', 'ar3be11a@gmail.com', '$2y$10$dxQz3mgj7HJdEC3F0rSFMu12kgI2D8Ry88EGT0XrvPmUxTHSm3ukW', '2025-12-06 19:48:14'),
(3, 'Amanda', 'Larbi', 'amanda.larbi@gmail.com', '$2y$10$jgu.zVoV85mSmJzZpXyCrOWJUpRSCmOB4K1GQfKmOwAE/pOX46WS6', '2025-12-06 20:24:57'),
(4, 'Kharis', 'Dadzie', 'kharis.dadzie@ashesi.edu.gh', '$2y$10$zY59VKMF3/zvuKmhj9fCF.I4yOz6E2XoCYDzITl9Kh71us.6Ch6ke', '2025-12-07 13:51:40'),
(5, 'Getty', 'Getty', 'getty@gmail.com', '$2y$10$.MyBbXFiJlWfoiCotMIn5./W49iClCahh8X0JxaPscYM8AuUJ9eym', '2025-12-08 22:56:54'),
(6, 'Maame', 'Kome-Mensah', 'maame@gmail.com', '$2y$10$5L7hP9hlv.JuFjESBUGUkeMynBrxzlecn4yC8S3tGuvKt1rDZbPMK', '2025-12-09 22:59:08'),
(7, 'ama', 'amponsah', 'ama@gmail.com', '$2y$10$sprH5il3dEh5FJDoWIRjBe7bsG/7w5KAAI6ct.jrCIWs9ENcpLO0e', '2025-12-12 06:14:04'),
(8, 'kirstyn', 'k', 'kirstynk@gmail.com', '$2y$10$3LKc8DS.qYrQMfCP6cifJuisNEgtNRJnvC6Oa1S3qX.LvhBsVHKb2', '2025-12-13 00:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `user_products`
--

CREATE TABLE `user_products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `category` enum('cleanser','toner','serum','moisturizer','sunscreen','treatment','mask','other') NOT NULL,
  `routine_time` enum('morning','evening','both') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','finished','discontinued') DEFAULT 'active',
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbot_qa`
--
ALTER TABLE `chatbot_qa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_date` (`user_id`,`entry_date`);

--
-- Indexes for table `skin_concerns`
--
ALTER TABLE `skin_concerns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skin_quiz_results`
--
ALTER TABLE `skin_quiz_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skin_quiz_results_ibfk_1` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_products`
--
ALTER TABLE `user_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_status` (`user_id`,`status`),
  ADD KEY `idx_user_routine` (`user_id`,`routine_time`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbot_qa`
--
ALTER TABLE `chatbot_qa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `skin_concerns`
--
ALTER TABLE `skin_concerns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `skin_quiz_results`
--
ALTER TABLE `skin_quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_products`
--
ALTER TABLE `user_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD CONSTRAINT `journal_entries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `skin_quiz_results`
--
ALTER TABLE `skin_quiz_results`
  ADD CONSTRAINT `skin_quiz_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_products`
--
ALTER TABLE `user_products`
  ADD CONSTRAINT `user_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
