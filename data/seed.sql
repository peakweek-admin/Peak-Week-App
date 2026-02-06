INSERT INTO domains (id, name, description) VALUES
  (1, 'Biomechanics & Anatomy', 'Leverage, moment arms, muscle anatomy, and movement mechanics.'),
  (2, 'Hypertrophy & Physiology', 'Cellular mechanisms of muscle growth and adaptation.'),
  (3, 'Nutrition & Energy Systems', 'Dieting, TDEE, NEAT, and nutrient timing for performance.'),
  (4, 'Recovery & Lifestyle', 'Sleep, stress management, and recovery protocols.'),
  (5, 'Programming & Coaching', 'Periodization, exercise selection, and workload management.'),
  (6, 'Ergogenics & Pharmacology', 'Evidence-based supplements and pharmacology education.');

INSERT INTO topics (id, domain_id, name, description) VALUES
  (1, 1, 'Moment Arms & Leverage', 'How joint angles and lever lengths alter torque demands.'),
  (2, 1, 'Muscle Anatomy', 'Origins, insertions, and fiber orientation.'),
  (3, 2, 'Cellular Hypertrophy', 'Mechanical tension, muscle damage, and metabolic stress.'),
  (4, 2, 'Satellite Cells', 'Myonuclear accretion and long-term growth capacity.'),
  (5, 3, 'Energy Balance', 'TDEE, NEAT, and energy availability.'),
  (6, 3, 'Thermogenesis', 'Thermic effect of food and adaptive metabolism.'),
  (7, 4, 'Sleep & Recovery', 'Circadian alignment and recovery outcomes.'),
  (8, 5, 'Progressive Overload', 'Load, volume, and intensity progression.'),
  (9, 6, 'Ergogenics', 'Performance and recovery aids.'),
  (10, 6, 'Pharmacology', 'Educational overview of peptides and SARMs.');

INSERT INTO tags (id, name, description) VALUES
  (1, 'moment-arm', 'Torque and lever mechanics.'),
  (2, 'hypertrophy', 'Muscle growth mechanisms.'),
  (3, 'nutrition', 'Dietary strategy and planning.'),
  (4, 'recovery', 'Sleep and recovery management.'),
  (5, 'anatomy', 'Muscle structure and function.'),
  (6, 'programming', 'Workout structure and progression.'),
  (7, 'thermogenesis', 'Metabolic adaptation and heat production.'),
  (8, 'ergogenics', 'Supplements and performance aids.'),
  (9, 'pharmacology', 'Educational pharmacology content.'),
  (10, 'monitoring', 'Readiness, HRV, and fatigue tracking.');

INSERT INTO modules (id, domain_id, title, summary, level, estimated_minutes) VALUES
  (1, 1, 'Foundations of Lifting Biomechanics', 'Understand lever arms, joint torque, and stability in exercise selection.', 'foundational', 35),
  (2, 2, 'Muscle Growth From Cell to System', 'Explore cellular and systemic drivers of hypertrophy.', 'foundational', 35),
  (3, 3, 'Fueling for Performance and Composition', 'Build nutrition plans around TDEE, NEAT, and nutrient timing.', 'intermediate', 35),
  (4, 4, 'Recovery, Hormones, and Lifestyle', 'Integrate sleep, stress, and hormonal considerations into training.', 'intermediate', 30),
  (5, 5, 'Programming for Long-Term Progress', 'Design periodized plans with evidence-backed volume and intensity.', 'advanced', 40),
  (6, 1, 'Applied Anatomy and Movement Physiology', 'Study joint anatomy and stabilization for exercise selection.', 'intermediate', 35),
  (7, 3, 'Energy Systems, Thermogenesis, and Metabolism', 'Explain ATP systems, thermogenesis, and metabolic adaptation.', 'advanced', 30),
  (8, 4, 'Recovery Monitoring and Load Management', 'Use HRV and readiness data to manage fatigue.', 'advanced', 30),
  (9, 6, 'Supplementation and Ergogenic Aids', 'Review evidence-backed supplementation strategies.', 'advanced', 25);

INSERT INTO lessons (id, module_id, title, summary, order_index, learning_objectives) VALUES
  (1, 1, 'Moment Arms and Torque Curves', 'Relate joint angles to torque and perceived difficulty.', 1, 'Explain how moment arms change across ROM; map torque curves to exercise feel.'),
  (2, 1, 'Lever Classes and Anthropometry', 'Understand how limb lengths alter leverage.', 2, 'Adjust exercise selection for individual structure.'),
  (3, 1, 'Stability, Bracing, and Energy Transfer', 'Learn how stabilization drives performance.', 3, 'Apply bracing cues and stabilization progressions.'),
  (4, 1, 'Range of Motion and Resistance Profiles', 'Connect ROM to mechanical tension.', 4, 'Choose ROM strategies for hypertrophy and strength.'),
  (5, 2, 'Mechanical Tension as the Primary Driver', 'Link mechanical tension to growth signaling.', 1, 'Define tension variables and load selection.'),
  (6, 2, 'Muscle Damage and Metabolic Stress', 'Use accessory work to drive metabolic stress.', 2, 'Balance damage with frequency.'),
  (7, 2, 'Satellite Cells and Myonuclei', 'Understand long-term growth capacity.', 3, 'Identify training and nutrition needs for remodeling.'),
  (8, 2, 'Muscle Architecture and Fiber Types', 'Relate fiber types to load and volume.', 4, 'Apply mixed rep ranges for fiber targeting.'),
  (9, 3, 'Energy Balance and TDEE', 'Calculate TDEE and the role of NEAT.', 1, 'Estimate TDEE and adjust based on trends.'),
  (10, 3, 'Macronutrient Targets', 'Set protein, carb, and fat targets for hypertrophy.', 2, 'Build macro ranges and track adherence.'),
  (11, 3, 'Nutrient Timing and Meal Structure', 'Align meals to training demands.', 3, 'Design pre- and post-training meals.'),
  (12, 3, 'Diet Periodization', 'Cycle surplus, deficit, and maintenance.', 4, 'Align phases to training blocks.'),
  (13, 4, 'Sleep Quality and Adaptation', 'Link sleep to performance and recovery outcomes.', 1, 'Implement sleep hygiene and tracking.'),
  (14, 4, 'Hormonal Environment', 'Understand acute vs chronic hormone changes.', 2, 'Differentiate acute spikes from long-term adaptations.'),
  (15, 4, 'Stress, Autonomic Balance, and CNS Fatigue', 'Manage stress and nervous system load.', 3, 'Use recovery tools to reduce CNS fatigue.'),
  (16, 4, 'Recovery Stack', 'Build layered recovery practices.', 4, 'Prioritize fundamentals before advanced modalities.'),
  (17, 5, 'Progressive Overload Models', 'Apply volume and intensity progressions.', 1, 'Select overload methods; set weekly progression targets.'),
  (18, 5, 'Periodization and Deloading', 'Plan deloads and fatigue management.', 2, 'Schedule deloads; interpret readiness markers.'),
  (19, 5, 'Exercise Selection Framework', 'Match exercises to muscles and goals.', 3, 'Select variations aligned with biomechanics.'),
  (20, 5, 'Volume Landmarks and Frequency', 'Use MEV and MRV to guide volume.', 4, 'Plan weekly set targets per muscle.'),
  (21, 6, 'Joint Anatomy and Constraints', 'Understand joint structure and motion limits.', 1, 'Identify safe loading angles.'),
  (22, 6, 'Muscle Actions and Synergy', 'Map prime movers and stabilizers.', 2, 'Use tempo and pauses to reinforce synergy.'),
  (23, 6, 'Fascial Lines and Force Transfer', 'Learn how fascia transmits force.', 3, 'Program carries and chain work.'),
  (24, 6, 'Movement Screening and Exercise Selection', 'Use screening to guide exercise choice.', 4, 'Select regressions and retest changes.'),
  (25, 7, 'ATP Systems for Training', 'Identify energy system dominance.', 1, 'Match training style to energy system demands.'),
  (26, 7, 'Thermogenesis and Energy Expenditure', 'Explain thermic effect and NEAT.', 2, 'Assess thermogenesis changes in dieting.'),
  (27, 7, 'Adaptive Metabolism', 'Understand metabolic adaptation.', 3, 'Use diet breaks and trend monitoring.'),
  (28, 7, 'Metabolic Flexibility', 'Develop fuel-switching ability.', 4, 'Balance aerobic work with lifting.'),
  (29, 8, 'Readiness Metrics', 'Combine HRV and subjective metrics.', 1, 'Interpret readiness trends.'),
  (30, 8, 'Load Management Models', 'Balance acute and chronic workloads.', 2, 'Adjust volume based on fatigue.'),
  (31, 8, 'Deload Strategy and Tapering', 'Use deloads to restore performance.', 3, 'Plan tapers for peak phases.'),
  (32, 8, 'Recovery Interventions', 'Use active recovery and hydration.', 4, 'Prioritize fundamentals before add-ons.'),
  (33, 9, 'Evidence Tiers and Research Quality', 'Evaluate supplement research quality.', 1, 'Compare effect sizes and quality.'),
  (34, 9, 'Core Supplements', 'Review high-evidence supplements.', 2, 'Apply dosing strategies.'),
  (35, 9, 'Micronutrients and Deficiency', 'Address common deficiencies.', 3, 'Use labs to guide interventions.'),
  (36, 9, 'Safety, Purity, and Compliance', 'Avoid contamination and overuse.', 4, 'Select third-party tested products.');

INSERT INTO lesson_tags (lesson_id, tag_id) VALUES
  (1, 1), (2, 1), (3, 5), (4, 1),
  (5, 2), (6, 2), (7, 2), (8, 2),
  (9, 3), (10, 3), (11, 3), (12, 3),
  (13, 4), (14, 4), (15, 4), (16, 4),
  (17, 6), (18, 6), (19, 6), (20, 6),
  (21, 5), (22, 5), (23, 5), (24, 5),
  (25, 7), (26, 7), (27, 7), (28, 7),
  (29, 10), (30, 10), (31, 10), (32, 10),
  (33, 8), (34, 8), (35, 8), (36, 8);

INSERT INTO studies (id, title, authors, year, journal, study_type, key_findings, doi) VALUES
  (1, 'Resistance Training Volume Enhances Muscle Hypertrophy', 'Schoenfeld et al.', 2017, 'Journal of Strength and Conditioning Research', 'Meta-analysis', 'Higher training volumes are associated with greater hypertrophy.', '10.1519/JSC.0000000000001867'),
  (2, 'Protein Intake and Muscle Hypertrophy in Resistance Training', 'Morton et al.', 2018, 'British Journal of Sports Medicine', 'Systematic review', 'Protein intakes around 1.6 g/kg/day optimize hypertrophy.', '10.1136/bjsports-2017-097608'),
  (3, 'Sleep Extension Improves Athletic Performance', 'Mah et al.', 2011, 'Sleep', 'Intervention study', 'Increased sleep improved performance metrics in athletes.', '10.5665/sleep.1322'),
  (4, 'Creatine Supplementation and Exercise Performance', 'Kreider et al.', 2017, 'Journal of the International Society of Sports Nutrition', 'Position stand', 'Creatine improves high-intensity exercise capacity and lean mass.', '10.1186/s12970-017-0173-z'),
  (5, 'Caffeine and Exercise Performance', 'Grgic et al.', 2019, 'British Journal of Sports Medicine', 'Systematic review', 'Caffeine improves strength, power, and endurance performance.', '10.1136/bjsports-2018-099399'),
  (6, 'Energy Availability and Metabolic Adaptation', 'Loucks et al.', 2011, 'Journal of Sports Sciences', 'Review', 'Low energy availability impairs endocrine and metabolic function.', '10.1080/02640414.2011.601957');

INSERT INTO lesson_studies (lesson_id, study_id, annotation) VALUES
  (17, 1, 'Supports volume-based progression recommendations.'),
  (10, 2, 'Protein targets aligned with hypertrophy evidence.'),
  (13, 3, 'Sleep as a performance multiplier.'),
  (34, 4, 'Creatine performance effects.'),
  (34, 5, 'Caffeine performance effects.'),
  (26, 6, 'Energy availability impacts metabolic adaptation.');

INSERT INTO muscles (id, name, region, primary_actions, fiber_type_bias, notes) VALUES
  (1, 'Gluteus Maximus', 'Hip', 'Hip extension, external rotation', 'Mixed', 'High force production across multiple joint angles.'),
  (2, 'Latissimus Dorsi', 'Back', 'Shoulder extension, adduction', 'Mixed', 'Strong contributor to pulling and stabilization.'),
  (3, 'Vastus Lateralis', 'Thigh', 'Knee extension', 'Fast-twitch biased', 'Responds well to higher volume and load.'),
  (4, 'Deltoid (Anterior)', 'Shoulder', 'Shoulder flexion', 'Mixed', 'Active in pressing and overhead stability.'),
  (5, 'Serratus Anterior', 'Shoulder', 'Scapular protraction, upward rotation', 'Mixed', 'Key stabilizer in pressing and overhead work.'),
  (6, 'Erector Spinae', 'Back', 'Spinal extension', 'Mixed', 'Postural endurance and spinal stability.');

INSERT INTO muscle_landmarks (id, muscle_id, origin, insertion, line_of_pull, stabilization_role) VALUES
  (1, 1, 'Posterior ilium, sacrum', 'Gluteal tuberosity', 'Posterior-superior', 'Pelvic stabilization in hip extension.'),
  (2, 2, 'Thoracolumbar fascia', 'Intertubercular groove', 'Inferior-medial', 'Scapular stabilization during pulling.'),
  (3, 3, 'Femur (lateral)', 'Patella via quadriceps tendon', 'Anterior', 'Knee stabilization in squats.'),
  (4, 4, 'Clavicle', 'Deltoid tuberosity', 'Anterior-lateral', 'Glenohumeral stabilization in pressing.'),
  (5, 5, 'Ribs 1-9', 'Medial border of scapula', 'Anterior-lateral', 'Scapular stabilization in overhead work.'),
  (6, 6, 'Iliac crest, sacrum', 'Ribs, vertebrae', 'Vertical', 'Spinal stabilization in loaded hinges.');

INSERT INTO exercises (id, name, pattern, primary_muscles, stabilization_muscles, equipment, cues) VALUES
  (1, 'Back Squat', 'Squat', 'Gluteus maximus, quadriceps', 'Erectors, core, adductors', 'Barbell', 'Drive through midfoot, maintain torso brace.'),
  (2, 'Romanian Deadlift', 'Hinge', 'Hamstrings, glutes', 'Erectors, lats', 'Barbell', 'Hinge with neutral spine, keep bar close.'),
  (3, 'Pull-Up', 'Vertical pull', 'Lats, biceps', 'Lower traps, core', 'Bodyweight', 'Lead with chest, avoid shrugging.'),
  (4, 'Incline Dumbbell Press', 'Horizontal press', 'Pecs, delts', 'Rotator cuff, serratus', 'Dumbbells', 'Control lowering, keep wrists stacked.'),
  (5, 'Split Squat', 'Split squat', 'Quads, glutes', 'Core, adductors', 'Dumbbells', 'Stay tall, drive through front heel.'),
  (6, 'Chest-Supported Row', 'Horizontal pull', 'Lats, rhomboids', 'Lower traps, core', 'Machine or bench', 'Pull elbows toward hips, keep chest down.');

INSERT INTO exercise_mechanics (id, exercise_id, moment_arm_notes, leverage_notes, range_of_motion_notes, stability_notes) VALUES
  (1, 1, 'Moment arm peaks near parallel; torque demand high mid-range.', 'Bar placement changes torso angle and hip moment.', 'Depth influences quad vs glute bias.', 'Requires trunk stiffness and ankle mobility.'),
  (2, 2, 'Hip moment arm increases as bar travels forward.', 'Long femurs increase hip demand; short torsos reduce shear.', 'Stop before lumbar flexion.', 'Grip and lat tension improve bar path.'),
  (3, 3, 'Shoulder moment arm largest at start; improves with assistance.', 'Neutral grip reduces shoulder strain.', 'Full hang to chest-to-bar for full range.', 'Scapular control key to stability.'),
  (4, 4, 'Shoulder moment arm highest near mid-range.', 'Incline angle increases delt leverage.', 'Control at bottom to avoid anterior glide.', 'Stable bench and foot drive assist control.'),
  (5, 5, 'Front knee moment arm peaks at mid-depth.', 'Torso angle shifts glute vs quad load.', 'Depth increases glute stretch.', 'Requires hip stability and balance.'),
  (6, 6, 'Elbow moment arm remains steady through ROM.', 'Chest support reduces low-back leverage.', 'Full stretch improves lat engagement.', 'Bench support limits torso sway.');

INSERT INTO nutrition_principles (id, title, summary, practical_steps) VALUES
  (1, 'Protein Distribution', 'Spread protein across meals to maximize MPS.', 'Aim for 25-40g per meal, 3-5 meals per day.'),
  (2, 'Whole Foods Priority', 'Whole foods improve satiety and micronutrients.', 'Base meals around lean protein, complex carbs, and colorful produce.'),
  (3, 'Energy Availability', 'Chronic low energy availability reduces performance.', 'Maintain surplus for growth, modest deficit for fat loss.'),
  (4, 'Diet Breaks', 'Short maintenance phases reduce adaptive slowdown.', 'Insert 1-2 week maintenance phases every 6-12 weeks.');

INSERT INTO recovery_strategies (id, title, summary, signals, interventions) VALUES
  (1, 'Sleep Anchors', 'Consistent sleep improves recovery and hormone regulation.', 'Difficulty falling asleep, poor HRV, heavy fatigue.', 'Set wind-down routine, lower light exposure, keep schedule.'),
  (2, 'Active Recovery', 'Low-intensity movement aids circulation and soreness.', 'Persistent soreness, reduced range.', 'Light cardio, mobility circuits, hydration focus.'),
  (3, 'Stress Management', 'High stress blunts adaptation.', 'Mood changes, appetite loss, training apathy.', 'Breathwork, walks, adjust training volume.'),
  (4, 'Readiness Tracking', 'Monitoring trends improves load management.', 'Sustained soreness, drop in performance.', 'Reduce volume, increase recovery days.' );

INSERT INTO hormone_factors (id, name, role, training_notes, nutrition_notes) VALUES
  (1, 'Testosterone', 'Supports protein synthesis and recovery.', 'Heavy compound lifts support baseline levels.', 'Adequate fats and sleep preserve levels.'),
  (2, 'Cortisol', 'Stress hormone that mobilizes energy.', 'High volume without recovery elevates levels.', 'Avoid chronic deficits and manage stress.'),
  (3, 'Insulin', 'Regulates nutrient storage and uptake.', 'Carbs around training support performance.', 'Pair carbs with protein to support glycogen.'),
  (4, 'Leptin', 'Regulates appetite and energy balance.', 'Extended deficits reduce leptin.', 'Diet breaks can restore leptin signaling.' );
