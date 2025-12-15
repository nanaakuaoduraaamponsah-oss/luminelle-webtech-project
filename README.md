# luminelle-webtech-project
LuminElle is a comprehensive full-stack web application designed to help users organize, track, and optimize their skincare routines. Built with PHP and MySQL, it combines personalized skin analysis, routine tracking, product management, and an intelligent assistant to help users achieve their best skin yet.

## Features
###  *Elle Guide - Skin Type Quiz*
- Interactive 6-question quiz to determine your skin type
- Results categorize users into: Dry, Normal, Combination, Oily, or Sensitive
- Personalized recommendations based on quiz results
- Ability to retake the quiz as skin changes over time
- Quiz history tracking with timestamps

###  *Lumin Routine - Skin Concerns Encyclopedia*
- Comprehensive information on 10 common skin concerns:
  - Acne
  - Dark Spots/Hyperpigmentation
  - Fine Lines & Wrinkles
  - Dullness
  - Enlarged Pores
  - Dryness/Dehydration
  - Oiliness
  - Redness/Sensitivity
  - Dark Circles
  - Uneven Texture
- Detailed guidance for each concern including:
  - Causes and triggers
  - Recommended ingredients
  - Foods to eat and avoid
  - Myth-busting facts
  - Helpful suggestions

### *Glow Calendar - Routine Tracker*
- Visual calendar showing daily routine logging
- Color-coded system:
  - **White**: No entry
  - **Baby Pink**: Incomplete routine
  - **Fuchsia**: Half-done routine
  - **Bright Pink**: Complete routine
- Features include:
  - Morning and evening routine tracking
  - Photo uploads for progress documentation (before/after)
  - Personal notes section
  - Completion status tracking
  - Entry editing and deletion
  - "Copy Yesterday's Routine" quick-fill option
  - Streak tracking:
  - Current streak counter
  - Longest streak record
  - Motivational statistics

###  *My Products - Product Management*
- Track all skincare products you're using
- Product details:
  - Product name and brand
  - Category (cleanser, toner, serum, moisturizer, sunscreen, treatment, mask, other)
  - Routine time (morning, evening, or both)
  - Start and end dates
  - Status (active, finished, discontinued)
  - Personal rating (1-5 stars)
  - Notes section
- Product filtering and organization
- Active products counter

###  *Gallery - Progress Visualization*
- View all uploaded skincare photos
- Chronological organization
- Filter by date range
- Side-by-side comparison support
- Download and share capabilities

### *Skincare Assistant - Interactive Chatbot*
- 25 pre-loaded Q&A pairs organized in two categories:
  - **Skincare Tips** (15 questions)
  - **App Usage** (10 questions)
- Real-time search functionality
- Topics covered include:
  - Cleansing frequency
  - Sunscreen importance
  - Product application order
  - Ingredient combinations
  - Skin type identification
  - Exfoliation guidelines
  - Diet and skin connection
  - Seasonal routine adjustments
- App navigation and feature explanations

###  *User Profile & Account Management*
- User registration with validation
- Secure login system with password hashing
- Profile viewing and editing
- Account statistics:
  - Total entries logged
  - Completed days
  - Days tracking
- Password strength indicator on signup
- Responsive authentication pages

### *Backend*
- PHP 8.2 - Server-side scripting
- MySQL - Database management
- **PDO** - Database abstraction layer with prepared statements

### *Frontend*
- HTML5 - Semantic markup
- CSS- Custom styling with CSS variables
- JavaScript - Interactive functionality
- Responsive Design

#### *Key Algorithms*
1.*Streak Calculation Algorithm*
- Location: glow-calendar/calendar.php
- Calculates both current and longest streaks for routine consistency tracking

2.*30-Day Activity Data Aggregation*
- Location: profile.php
- Prepares data for Chart.js visualization by creating a 30-day window:

3. *Completion Rate Calculator*
- Location: profile.php
- Calculates percentage of fully completed routines

3.*Days Tracking Duration*
- Location: profile.php
- Calculates total days since first journal entry
 
4.*Skin Type Determination Algorithm*
- Location: elle-guide/process-quiz.php
- Uses weighted scoring system to determine skin type from 6 questions

5.*Completion Status Classification*
- Location:glow-calendar/add-entry.php 
- Determines routine completion status based on morning/evening entries

6.*Calendar Date Navigation*
- Location: glow-calendar/calendar.php
- Handles month/year boundary conditions:

6.*Product Usage Duration Calculator*
- Location: my-products/product-insights.php
- Calculates days between start and end dates (or current date)

7.*Real-time Search Filtering*
- Location: chatbot.php
- Live search algorithm for chatbot questions

8.*Calendar Grid Layout Algorithm*
- Location: glow-calendar/calendar.php
- Generates calendar grid with proper day alignment

9.*Password Strength Validation*
- Location: includes/functions.php
- Simple but effective password validation

### Database Schema
# *Tables*
#### `users`
- `id` (PRIMARY KEY)
- `first_name`
- `last_name`
- `email` (UNIQUE)
- `password` (hashed)
- `created_at`

#### `skin_quiz_results`
- `id` (PRIMARY KEY)
- `user_id` (FOREIGN KEY → users)
- `skin_type`
- `question_1` through `question_6`
- `date_taken`

#### `journal_entries`
- `id` (PRIMARY KEY)
- `user_id` (FOREIGN KEY → users)
- `entry_date` (UNIQUE per user)
- `morning_routine`
- `evening_routine`
- `morning_photo`
- `evening_photo`
- `notes`
- `completion_status` (complete/half-done/incomplete)
- `created_at`

#### `user_products`
- `id` (PRIMARY KEY)
- `user_id` (FOREIGN KEY → users)
- `product_name`
- `brand`
- `category`
- `routine_time`
- `start_date`
- `end_date`
- `status` (active/finished/discontinued)
- `rating` (1-5)
- `notes`
- `created_at`

#### `skin_concerns`
- `id` (PRIMARY KEY)
- `name`
- `description`
- `causes`
- `ingredients`
- `foods_to_eat`
- `foods_to_avoid`
- `myths`
- `suggestions`

#### `chatbot_qa`
- `id` (PRIMARY KEY)
- `category` (skincare/app-usage)
- `question`
- `answer`
- `order_num`

#### `users_prodcuts`
- `id`
- `users_id`
- `product_name`
- `brand`
- `category`
- `routine_time`
- `start_date`
- `end_date`
- `status`
- `rating`
- `notes`
- `created_at`
  
#### Security Features
- Password Hashing: Uses PHP's `password_hash()` with bcrypt
- SQL Injection Prevention: All queries use PDO prepared statements
- Input Validation: Server-side validation for all user inputs
- Session Management: Secure session handling
- Email Validation: RFC compliant email validation
- XSS Protection: Output escaping with `htmlspecialchars()`

#### Usage
1.*Create an Account*
- Navigate to the registration page
- Fill in your details (first name, last name, email, password)
- Password must be at least 8 characters
- Click "Sign Up"
- Login with email and password

2.*Take the Skin Type Quiz*
- Go to "Elle Guide" from the dashboard
- Answer 6 simple questions about your skin
- Receive your personalized skin type result
- Get customized skincare recommendations

3.*Log Your Daily Routine*
- Click on "Glow Calendar"
- Select today's date or any past date
- Fill in your morning routine products
- Fill in your evening routine products
- Upload photos (optional but recommended)
- Add personal notes
- Save your entry

4.*Track Your Products*
- Navigate to "My Products"
- Click "Add New Product"
- Enter product details (name, brand, category)
- Specify when you use it (morning/evening/both)
- Rate the product once you've used it
- Update status when finished or discontinued

5.*Monitor Progress*
- Check your current streak on the calendar
- View completion statistics on your dashboard
- Browse your photo gallery to see progress
- Compare before/after photos

5.*Get Skincare Help*
- Open the Skincare Assistant
- Browse questions by category
- Use the search box to find specific topics
- Click any question for instant answers

#### Contact
- Name: Nana Akua Oduraa Amponsah
- Email: nanaakuaoduraaamponsah@gmail.com / akua.amponsah@ashesi.edu.gh
