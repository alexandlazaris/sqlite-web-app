DELETE FROM RegisteredConsoles WHERE id >= 1
RETURNING 'redirect' AS component, 'index.sql' AS link;