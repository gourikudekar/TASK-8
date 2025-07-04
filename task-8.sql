use coursehub;

DELIMITER //
CREATE PROCEDURE AddLearner (
    IN learnerName VARCHAR(100),
    IN learnerEmail VARCHAR(100),
    IN learnerScore DECIMAL(5,2),
    IN courseRef INT,
    IN trainerRef INT
)
BEGIN
    IF learnerScore BETWEEN 25 AND 100 THEN
        INSERT INTO learner (l_name, email, score, course_id, trainer_id)
        VALUES (learnerName, learnerEmail, learnerScore, courseRef, trainerRef);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Score must be between 25 and 100';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateTrainerRating (
    IN trainerId INT,
    IN newRating DECIMAL(2,1)
)
BEGIN
    IF newRating BETWEEN 0 AND 5 THEN
        UPDATE trainer
        SET rating = newRating
        WHERE trainer_id = trainerId;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rating must be between 0 and 5';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION FeeCategory (amount DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(20);
    IF amount >= 100000 THEN
        SET category = 'Premium';
    ELSEIF amount BETWEEN 75000 AND 99999 THEN
        SET category = 'Standard';
    ELSE
        SET category = 'Economy';
    END IF;
    RETURN category;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EnrollLearnerToCourse (
    IN learnerId INT,
    IN courseId INT,
    IN trainerId INT
)
BEGIN
    UPDATE learner
    SET course_id = courseId,
        trainer_id = trainerId
    WHERE learner_id = learnerId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteLowScoreLearners (
    IN threshold DECIMAL(5,2)
)
BEGIN
    DELETE FROM learner
    WHERE score < threshold;
END //
DELIMITER ;

