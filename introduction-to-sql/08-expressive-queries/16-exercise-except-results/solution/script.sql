SELECT name
FROM north_invites
EXCEPT
SELECT name
FROM south_invites
ORDER BY name;
