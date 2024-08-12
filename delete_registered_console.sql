-- SET $getName = (
--     (SELECT name FROM RegisteredConsoles WHERE id = $id)
-- );
-- SELECT 'text' as component, printf('deleted console is (%s)', $getName) as contents;
DELETE FROM RegisteredConsoles WHERE id = $id
RETURNING 'redirect' AS component, 'index.sql' AS link;