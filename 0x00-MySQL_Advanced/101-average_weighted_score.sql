-- Stored procedure to compute and store the average weighted score for all students
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
    UPDATE students
    SET average_weighted_score = (
        SELECT SUM(scores.score * weights.weight) / SUM(weights.weight)
        FROM scores
        INNER JOIN weights ON scores.course_id = weights.course_id
        WHERE scores.student_id = students.id
    );
END;

