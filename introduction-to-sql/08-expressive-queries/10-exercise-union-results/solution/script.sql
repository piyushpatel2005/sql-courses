SELECT name
FROM north_invites
UNION
SELECT name
FROM south_invites
ORDER BY name;
