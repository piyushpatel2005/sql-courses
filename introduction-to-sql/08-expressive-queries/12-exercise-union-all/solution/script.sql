SELECT name
FROM north_invites
UNION ALL
SELECT name
FROM south_invites
ORDER BY name;
