CourseHub SQL Project – Task 8: Stored Procedures & Functions

Objective
To implement reusable SQL logic through stored procedures and functions in the CourseHub database. This enhances modularity, input validation, and maintainability—key principles in robust database design.

Database Schema Overview

Database Name: CourseHub
Tables included:
  trainer: holds trainer details and expertise
  course:captures course offerings and fee information
  learner:stores learner data and links to trainers and courses

 1. AddLearner
 Adds a new learner with score validation between 25 and 100. Prevents invalid data inserts.

2. UpdateTrainerRating
 Updates a trainer’s rating with conditional logic to allow only valid ratings (0–5).

3. EnrollLearnerToCourse
 Assigns an existing learner to a specific course and trainer, supporting dynamic enrollment workflows.

 4.DeleteLowScoreLearners
  Deletes learners whose scores fall below a specified threshold (e.g. 40), useful for cleaning test data.

5. FeeCategory – SQL Function
 Categorizes course fees as Premium, Standard, or Economy. Improves financial analysis and segmentation.
