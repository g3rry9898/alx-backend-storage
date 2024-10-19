-- Stored procedure to add a new correction for a student
CREATE PROCEDURE AddBonus(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score DECIMAL(5,2)
)
BEGIN
    DECLARE project_id INT;

    -- Check if the project exists and get its ID
    SELECT id INTO project_id FROM projects WHERE name = project_name;

    -- If the project does not exist, create it and get the new ID
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

    -- Add the correction for the student
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, project_id, score);
END;


