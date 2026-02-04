INSERT INTO domains (id, name, description) VALUES
  (1, 'Biomechanics & Anatomy', 'Leverage, moment arms, muscle anatomy, and movement mechanics.'),
  (2, 'Hypertrophy & Physiology', 'Cellular mechanisms of muscle growth and adaptation.'),
  (3, 'Nutrition & Energy Systems', 'Dieting, TDEE, NEAT, and nutrient timing for performance.'),
  (4, 'Recovery & Lifestyle', 'Sleep, stress management, and recovery protocols.'),
  (5, 'Programming & Coaching', 'Periodization, exercise selection, and workload management.');

INSERT INTO topics (id, domain_id, name, description) VALUES
  (1, 1, 'Moment Arms & Leverage', 'How joint angles and lever lengths alter torque demands.'),
  (2, 1, 'Muscle Anatomy', 'Origins, insertions, and fiber orientation.'),
  (3, 2, 'Cellular Hypertrophy', 'Mechanical tension, muscle damage, and metabolic stress.'),
  (4, 2, 'Satellite Cells', 'Myonuclear accretion and long-term growth capacity.'),
  (5, 3, 'Energy Balance', 'TDEE, NEAT, and energy availability.'),
  (6, 3, 'Macronutrients', 'Protein, carbohydrate, and fat targets for lifters.'),
  (7, 4, 'Sleep & Recovery', 'Circadian alignment and recovery outcomes.'),
  (8, 5, 'Progressive Overload', 'Load, volume, and intensity progression.');

INSERT INTO tags (id, name, description) VALUES
  (1, 'moment-arm', 'Torque and lever mechanics.'),
  (2, 'hypertrophy', 'Muscle growth mechanisms.'),
  (3, 'nutrition', 'Dietary strategy and planning.'),
  (4, 'recovery', 'Sleep and recovery management.'),
  (5, 'anatomy', 'Muscle structure and function.'),
  (6, 'programming', 'Workout structure and progression.');

INSERT INTO modules (id, domain_id, title, summary, level, estimated_minutes) VALUES
  (1, 1, 'Foundations of Lifting Biomechanics', 'Understand how lever arms, joint torque, and stability impact exercise selection.', 'foundational', 120),
  (2, 2, 'Muscle Growth From Cell to System', 'Explore the cellular signals and systemic drivers of hypertrophy.', 'foundational', 150),
  (3, 3, 'Fueling for Performance and Composition', 'Build nutrition plans around TDEE, NEAT, and nutrient timing.', 'intermediate', 140),
  (4, 4, 'Recovery, Hormones, and Lifestyle', 'Integrate sleep, stress, and hormonal considerations into training.', 'intermediate', 110),
  (5, 5, 'Programming for Long-Term Progress', 'Design periodized plans with evidence-backed volume and intensity.', 'advanced', 180);

INSERT INTO lessons (id, module_id, title, summary, order_index, learning_objectives) VALUES
  (1, 1, 'Moment Arms and Torque Demands', 'Relate joint angles to torque and perceived difficulty.', 1, 'Explain how moment arms change across ROM; map torque curves to exercise feel.'),
  (2, 1, 'Stabilization and Leverage', 'Identify stabilizers and leverage advantages in compound lifts.', 2, 'Assess stability demands; select equipment to match intent.'),
  (3, 2, 'Cellular Hypertrophy Signals', 'Connect mechanical tension and metabolic stress to growth.', 1, 'Describe key pathways (mTOR, MAPK); identify key training variables.'),
  (4, 2, 'Muscle Architecture', 'Understand pennation, fiber types, and growth potential.', 2, 'Compare fiber orientation effects; relate to exercise selection.'),
  (5, 3, 'Energy Balance and TDEE', 'Calculate TDEE and the role of NEAT.', 1, 'Estimate TDEE; explain how NEAT changes with diet or training.'),
  (6, 3, 'Macronutrient Targets', 'Set protein, carb, and fat targets for hypertrophy.', 2, 'Build macro ranges; align timing to training demands.'),
  (7, 4, 'Sleep Quality and Adaptation', 'Link sleep to performance and recovery outcomes.', 1, 'List sleep hygiene anchors; interpret recovery signals.'),
  (8, 4, 'Hormonal Environment', 'Understand acute vs chronic hormone changes.', 2, 'Differentiate acute spikes from long-term adaptations.'),
  (9, 5, 'Progressive Overload Models', 'Apply volume and intensity progressions.', 1, 'Select overload methods; set weekly progression targets.'),
  (10, 5, 'Periodization and Deloading', 'Plan deloads and fatigue management.', 2, 'Schedule deloads; interpret readiness markers.');

INSERT INTO lesson_tags (lesson_id, tag_id) VALUES
  (1, 1), (2, 1), (2, 5), (3, 2), (4, 5),
  (5, 3), (6, 3), (7, 4), (8, 4), (9, 6), (10, 6);

INSERT INTO studies (id, title, authors, year, journal, study_type, key_findings, doi) VALUES
  (1, 'Resistance Training Volume Enhances Muscle Hypertrophy', 'Schoenfeld et al.', 2017, 'Journal of Strength and Conditioning Research', 'Meta-analysis', 'Higher training volumes are associated with greater hypertrophy.', '10.1519/JSC.0000000000001867'),
  (2, 'Protein Intake and Muscle Hypertrophy in Resistance Training', 'Morton et al.', 2018, 'British Journal of Sports Medicine', 'Systematic review', 'Protein intakes around 1.6 g/kg/day optimize hypertrophy.', '10.1136/bjsports-2017-097608'),
  (3, 'Sleep Extension Improves Athletic Performance', 'Mah et al.', 2011, 'Sleep', 'Intervention study', 'Increased sleep improved performance metrics in athletes.', '10.5665/sleep.1322');

INSERT INTO lesson_studies (lesson_id, study_id, annotation) VALUES
  (9, 1, 'Supports volume-based progression recommendations.'),
  (6, 2, 'Protein targets aligned with hypertrophy evidence.'),
  (7, 3, 'Sleep as a performance multiplier.');

INSERT INTO muscles (id, name, region, primary_actions, fiber_type_bias, notes) VALUES
  (1, 'Gluteus Maximus', 'Hip', 'Hip extension, external rotation', 'Mixed', 'High force production across multiple joint angles.'),
  (2, 'Latissimus Dorsi', 'Back', 'Shoulder extension, adduction', 'Mixed', 'Strong contributor to pulling and stabilization.'),
  (3, 'Vastus Lateralis', 'Thigh', 'Knee extension', 'Fast-twitch biased', 'Responds well to higher volume and load.'),
  (4, 'Deltoid (Anterior)', 'Shoulder', 'Shoulder flexion', 'Mixed', 'Active in pressing and overhead stability.');

INSERT INTO muscle_landmarks (id, muscle_id, origin, insertion, line_of_pull, stabilization_role) VALUES
  (1, 1, 'Posterior ilium, sacrum', 'Gluteal tuberosity', 'Posterior-superior', 'Pelvic stabilization in hip extension.'),
  (2, 2, 'Thoracolumbar fascia', 'Intertubercular groove', 'Inferior-medial', 'Scapular stabilization during pulling.'),
  (3, 3, 'Femur (lateral)', 'Patella via quadriceps tendon', 'Anterior', 'Knee stabilization in squats.'),
  (4, 4, 'Clavicle', 'Deltoid tuberosity', 'Anterior-lateral', 'Glenohumeral stabilization in pressing.');

INSERT INTO exercises (id, name, pattern, primary_muscles, stabilization_muscles, equipment, cues) VALUES
  (1, 'Back Squat', 'Squat', 'Gluteus maximus, quadriceps', 'Erectors, core, adductors', 'Barbell', 'Drive through midfoot, maintain torso brace.'),
  (2, 'Romanian Deadlift', 'Hinge', 'Hamstrings, glutes', 'Erectors, lats', 'Barbell', 'Hinge with neutral spine, keep bar close.'),
  (3, 'Pull-Up', 'Vertical pull', 'Lats, biceps', 'Lower traps, core', 'Bodyweight', 'Lead with chest, avoid shrugging.'),
  (4, 'Incline Dumbbell Press', 'Horizontal press', 'Pecs, delts', 'Rotator cuff, serratus', 'Dumbbells', 'Control lowering, keep wrists stacked.');

INSERT INTO exercise_mechanics (id, exercise_id, moment_arm_notes, leverage_notes, range_of_motion_notes, stability_notes) VALUES
  (1, 1, 'Moment arm peaks near parallel; torque demand high mid-range.', 'Bar placement changes torso angle and hip moment.', 'Depth influences quad vs glute bias.', 'Requires trunk stiffness and ankle mobility.'),
  (2, 2, 'Hip moment arm increases as bar travels forward.', 'Long femurs increase hip demand; short torsos reduce shear.', 'Stop before lumbar flexion.', 'Grip and lat tension improve bar path.'),
  (3, 3, 'Shoulder moment arm largest at start; improves with assistance.', 'Neutral grip reduces shoulder strain.', 'Full hang to chest-to-bar for full range.', 'Scapular control key to stability.'),
  (4, 4, 'Shoulder moment arm highest near mid-range.', 'Incline angle increases delt leverage.', 'Control at bottom to avoid anterior glide.', 'Stable bench and foot drive assist control.');

INSERT INTO nutrition_principles (id, title, summary, practical_steps) VALUES
  (1, 'Protein Distribution', 'Spread protein across meals to maximize MPS.', 'Aim for 25-40g per meal, 3-5 meals per day.'),
  (2, 'Whole Foods Priority', 'Whole foods improve satiety and micronutrients.', 'Base meals around lean protein, complex carbs, and colorful produce.'),
  (3, 'Energy Availability', 'Chronic low energy availability reduces performance.', 'Maintain surplus for growth, modest deficit for fat loss.');

INSERT INTO recovery_strategies (id, title, summary, signals, interventions) VALUES
  (1, 'Sleep Anchors', 'Consistent sleep improves recovery and hormone regulation.', 'Difficulty falling asleep, poor HRV, heavy fatigue.', 'Set wind-down routine, lower light exposure, keep schedule.'),
  (2, 'Active Recovery', 'Low-intensity movement aids circulation and soreness.', 'Persistent soreness, reduced range.', 'Light cardio, mobility circuits, hydration focus.'),
  (3, 'Stress Management', 'High stress blunts adaptation.', 'Mood changes, appetite loss, training apathy.', 'Breathwork, walks, adjust training volume.');

INSERT INTO hormone_factors (id, name, role, training_notes, nutrition_notes) VALUES
  (1, 'Testosterone', 'Supports protein synthesis and recovery.', 'Heavy compound lifts support baseline levels.', 'Adequate fats and sleep preserve levels.'),
  (2, 'Cortisol', 'Stress hormone that mobilizes energy.', 'High volume without recovery elevates levels.', 'Avoid chronic deficits and manage stress.'),
  (3, 'Insulin', 'Regulates nutrient storage and uptake.', 'Carbs around training support performance.', 'Pair carbs with protein to support glycogen.');
