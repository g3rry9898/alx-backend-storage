-- Stored procedure to add a new correction for a student
CREATE PROCEDURE AddBonus(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score DECIMAL(5,2)
)
BEGIN
    -- Check if the project exists
    IF NOT EXISTS (SELECT 1 FROM projects WHERE name = project_name) THEN
        -- If the project does not exist, create it
        INSERT INTO projects (name) VALUES (project_name);
    END IF;

    -- Add the correction for the student
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (
        user_id,
        (SELECT id FROM projects WHERE name = project_name),
        score
    );
END;

