SELECT name
FROM north_invites
INTERSECT
SELECT name
FROM south_invites
ORDER BY name;
