SELECT p.name,
       s.title
FROM participants AS p
JOIN enrollments AS e ON e.participant_id = p.participant_id
JOIN sessions AS s ON s.session_id = e.session_id
ORDER BY p.participant_id,
       s.session_id;
