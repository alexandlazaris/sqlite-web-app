SET $chosenName = (
    :select_console_name
);
SET $getManufacturer = (
    (SELECT manufacturer FROM AvailableConsoles WHERE name = :select_console_name)
);
SET $getType = (
    (SELECT type FROM AvailableConsoles WHERE name = :select_console_name)
);
-- SELECT 'text' as component, printf('selected option is (%s)', :Console) as contents;
-- SELECT 'text' as component, $chosenName as contents;
-- SELECT 'text' as component, $getManufacturer as contents;
-- SELECT 'text' as component, $getType as contents;
-- SELECT 'text' as component, name AS contents FROM AvailableConsoles WHERE name = :Console;
INSERT INTO RegisteredConsoles(name, manufacturer, type) VALUES($chosenName, $getManufacturer, $getType)
RETURNING 'redirect' AS component, 'index.sql' AS link