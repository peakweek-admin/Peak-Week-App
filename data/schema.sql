PRAGMA foreign_keys = ON;

-- Core catalog tables
CREATE TABLE IF NOT EXISTS domains (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS topics (
  id INTEGER PRIMARY KEY,
  domain_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  FOREIGN KEY (domain_id) REFERENCES domains(id)
);

CREATE TABLE IF NOT EXISTS tags (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL
);

-- Learning modules and lessons
CREATE TABLE IF NOT EXISTS modules (
  id INTEGER PRIMARY KEY,
  domain_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  summary TEXT NOT NULL,
  level TEXT NOT NULL CHECK (level IN ('foundational', 'intermediate', 'advanced')),
  estimated_minutes INTEGER NOT NULL,
  FOREIGN KEY (domain_id) REFERENCES domains(id)
);

CREATE TABLE IF NOT EXISTS lessons (
  id INTEGER PRIMARY KEY,
  module_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  summary TEXT NOT NULL,
  order_index INTEGER NOT NULL,
  learning_objectives TEXT NOT NULL,
  FOREIGN KEY (module_id) REFERENCES modules(id)
);

CREATE TABLE IF NOT EXISTS lesson_sections (
  id INTEGER PRIMARY KEY,
  lesson_id INTEGER NOT NULL,
  heading TEXT NOT NULL,
  content TEXT NOT NULL,
  order_index INTEGER NOT NULL,
  FOREIGN KEY (lesson_id) REFERENCES lessons(id)
);

CREATE TABLE IF NOT EXISTS lesson_tags (
  lesson_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL,
  PRIMARY KEY (lesson_id, tag_id),
  FOREIGN KEY (lesson_id) REFERENCES lessons(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- Evidence and references
CREATE TABLE IF NOT EXISTS studies (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  authors TEXT NOT NULL,
  year INTEGER NOT NULL,
  journal TEXT NOT NULL,
  study_type TEXT NOT NULL,
  key_findings TEXT NOT NULL,
  doi TEXT
);

CREATE TABLE IF NOT EXISTS lesson_studies (
  lesson_id INTEGER NOT NULL,
  study_id INTEGER NOT NULL,
  annotation TEXT NOT NULL,
  PRIMARY KEY (lesson_id, study_id),
  FOREIGN KEY (lesson_id) REFERENCES lessons(id),
  FOREIGN KEY (study_id) REFERENCES studies(id)
);

-- Anatomy and biomechanics
CREATE TABLE IF NOT EXISTS muscles (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  region TEXT NOT NULL,
  primary_actions TEXT NOT NULL,
  fiber_type_bias TEXT NOT NULL,
  notes TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS muscle_landmarks (
  id INTEGER PRIMARY KEY,
  muscle_id INTEGER NOT NULL,
  origin TEXT NOT NULL,
  insertion TEXT NOT NULL,
  line_of_pull TEXT NOT NULL,
  stabilization_role TEXT NOT NULL,
  FOREIGN KEY (muscle_id) REFERENCES muscles(id)
);

CREATE TABLE IF NOT EXISTS exercises (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  pattern TEXT NOT NULL,
  primary_muscles TEXT NOT NULL,
  stabilization_muscles TEXT NOT NULL,
  equipment TEXT NOT NULL,
  cues TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS exercise_mechanics (
  id INTEGER PRIMARY KEY,
  exercise_id INTEGER NOT NULL,
  moment_arm_notes TEXT NOT NULL,
  leverage_notes TEXT NOT NULL,
  range_of_motion_notes TEXT NOT NULL,
  stability_notes TEXT NOT NULL,
  FOREIGN KEY (exercise_id) REFERENCES exercises(id)
);

-- Nutrition and recovery
CREATE TABLE IF NOT EXISTS nutrition_principles (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  summary TEXT NOT NULL,
  practical_steps TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS recovery_strategies (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  summary TEXT NOT NULL,
  signals TEXT NOT NULL,
  interventions TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS hormone_factors (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  role TEXT NOT NULL,
  training_notes TEXT NOT NULL,
  nutrition_notes TEXT NOT NULL
);
