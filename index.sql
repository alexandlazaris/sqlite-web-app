select 'hero' as component,
    'Console collection' as title,
    '## A place to sit back, register and review all the consoles collected over the years.' as description_md,
    'https://res.cloudinary.com/jerrick/image/upload/c_scale,f_jpg,q_auto/wyf1f4xupwlelyxoksio.jpg' as image;
SELECT 'form' as component,
    'Register here' as title,
    'Register' as validate,
    -- TODO: figure out how to not force a page reload, causes the user to jump up & down
    'insert_registered_console.sql' as action;
SELECT 'select' as type,
    'select_console_name' as name,
    'Console' as label,
    'Select a console to begin' as description,
    json_group_array(
        json_object(
            "label",
            name,
            "value",
            name
        )
    ) as options
FROM AvailableConsoles;


SET $pie = (
    (
    SELECT count(*)
FROM AvailableConsoles
GROUP BY manufacturer
ORDER by count(*) DESC
    )
);

select 'chart' as component, 'pie' as type, 'Available consoles by manufacturer' as title;
SELECT manufacturer as label, count(*) as value
FROM AvailableConsoles
GROUP BY manufacturer;

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
select 'button' as component,
    'center' as justify;
select 'delete_all_registered.sql' as link,
    'red' as color,
    'Delete all' as title,
    'trash' as icon
where $countRegistered > 0;
SELECT 'list' AS component,
    'Available Consoles' AS title;
SELECT name AS title,
    CONCAT(manufacturer, ' - ', type) AS description
FROM AvailableConsoles;