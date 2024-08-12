SELECT 'form' as component,
    'Console Collection' as title,
    'Register' as validate,
    'insert_registered_console.sql' as action;
SELECT 'select' as type,
    'Console' as name,
    'Select a console to register' as description,
    TRUE as searchable,
    json_group_array(
        json_object(
            "label",
            name,
            "value",
            name
        )
    ) as options
FROM AvailableConsoles;

SET $countRegistered = (
        (
            SELECT COUNT (*)
            FROM RegisteredConsoles
        )
    );

select 'list' as component,
    printf('Registered (%d)', $countRegistered) as title,
    'Select a console to begin.' as empty_title;
select name AS title,
    CONCAT(manufacturer, ' - ', type) AS description,
    'delete_registered_console.sql?id=' || id as delete_link
from RegisteredConsoles;

select 
    'button' as component,
    'center' as justify;
select 
    'delete_all_registered.sql'     as link,
    'red' as color,
    'Delete all'  as title,
    'trash'  as icon where $countRegistered > 0;


SELECT 'list' AS component,
    'Available Consoles' AS title;
SELECT name AS title,
    CONCAT(manufacturer, ' - ', type) AS description
FROM AvailableConsoles;