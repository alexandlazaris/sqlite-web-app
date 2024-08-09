SELECT 'list' AS component, 'Consoles' AS title;
SELECT name AS title, CONCAT(manufacturer, ' - ', yearCreated,' - ', type) AS description FROM console;