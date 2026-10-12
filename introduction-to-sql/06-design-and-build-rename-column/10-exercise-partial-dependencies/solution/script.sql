SELECT p.name,d.shift
FROM people p
JOIN duties d ON d.person_id=p.person_id
ORDER BY p.person_id,d.shift;
