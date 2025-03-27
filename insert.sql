-- Insert users
INSERT INTO Users (user_id, username, email, password_hash, date_joined, last_login)
VALUES 
(1, 'dreamwalker', 'walker@dreams.com', 'e10adc3949ba59abbe56e057f20f883e', '2024-01-15 08:30:00', '2025-03-26 22:15:00'),
(2, 'sleepyhead', 'sleepy@dreams.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2024-02-20 14:45:00', '2025-03-25 23:10:00'),
(3, 'nightowl', 'owl@dreams.com', '827ccb0eea8a706c4c34a16891f84e7b', '2024-03-05 19:20:00', '2025-03-27 01:30:00');

-- Insert dream categories
INSERT INTO DreamCategories (category_id, category_name, description)
VALUES
(1, 'Nightmare', 'Frightening or disturbing dreams'),
(2, 'Lucid', 'Dreams where the dreamer is aware they are dreaming'),
(3, 'Recurring', 'Dreams that repeat the same pattern or theme'),
(4, 'Prophetic', 'Dreams that seem to predict future events');

-- Insert dreams
INSERT INTO Dreams (dream_id, user_id, category_id, dream_date, duration_minutes, clarity_level, description, is_lucid, emotion)
VALUES
(1, 1, 2, '2025-03-20', 45, 8, 'Flying over a city with complete control of movement', TRUE, 'Excited'),
(2, 1, 1, '2025-03-22', 30, 6, 'Being chased through a dark forest by an unknown entity', FALSE, 'Fearful'),
(3, 2, 3, '2025-03-21', 60, 7, 'Returning to childhood home that transforms into a maze', FALSE, 'Confused'),
(4, 3, 4, '2025-03-25', 40, 9, 'Meeting with deceased relative who shared important advice', FALSE, 'Peaceful'),
(5, 2, 2, '2025-03-24', 55, 8, 'Exploring an underwater civilization with ability to breathe underwater', TRUE, 'Curious'),
(6, 3, 1, '2025-03-26', 35, 7, 'Falling endlessly through clouds without reaching ground', FALSE, 'Anxious');

-- Insert dream symbols
INSERT INTO DreamSymbols (symbol_id, dream_id, symbol_name, significance, frequency)
VALUES
(1, 1, 'Flying', 'Represents freedom and breaking limitations', 1),
(2, 2, 'Being chased', 'Avoiding a problem or fear in waking life', 1),
(3, 3, 'Childhood home', 'Connection to past and identity', 2),
(4, 3, 'Maze', 'Feeling lost or confused about a decision', 1),
(5, 4, 'Deceased relative', 'Unresolved feelings or seeking guidance', 1),
(6, 5, 'Water', 'Emotions or the unconscious mind', 3),
(7, 6, 'Falling', 'Loss of control or fear of failure', 2),
(8, 1, 'City landscape', 'Complexity of life and social connections', 1),
(9, 5, 'Breathing underwater', 'Adaptation to emotional situations', 1);
