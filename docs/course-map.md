# Peak Week Science-Backed Lifting Archive

This course map links the database schema to practical learning modules.

## Modules Overview

1. **Foundations of Lifting Biomechanics**
   - Moment arms, torque, leverage, and stabilization
   - Related tables: `exercises`, `exercise_mechanics`, `muscles`, `muscle_landmarks`
2. **Muscle Growth From Cell to System**
   - Mechanical tension, metabolic stress, myonuclei
   - Related tables: `lessons`, `lesson_sections`, `studies`
3. **Fueling for Performance and Composition**
   - TDEE, NEAT, macros, whole foods
   - Related tables: `nutrition_principles`, `hormone_factors`
4. **Recovery, Hormones, and Lifestyle**
   - Sleep, stress, recovery systems
   - Related tables: `recovery_strategies`, `hormone_factors`
5. **Programming for Long-Term Progress**
   - Progressive overload, periodization
   - Related tables: `modules`, `lessons`, `lesson_tags`
6. **Applied Anatomy and Movement Physiology**
   - Joint mechanics, movement screening, stabilization chains
   - Related tables: `muscles`, `muscle_landmarks`, `lesson_sections`
7. **Energy Systems, Thermogenesis, and Metabolism**
   - ATP systems, thermic effect of food, adaptive metabolism
   - Related tables: `nutrition_principles`, `studies`
8. **Recovery Monitoring and Load Management**
   - HRV, readiness, deload strategy
   - Related tables: `recovery_strategies`, `lessons`
9. **Supplementation and Ergogenic Aids**
   - Creatine, caffeine, evidence tiers
   - Related tables: `studies`, `lesson_studies`
## Evidence Integration

- Each lesson can link to studies via the `lesson_studies` table.
- Use tags to surface cross-cutting topics like `moment-arm`, `hypertrophy`, or `nutrition`.
