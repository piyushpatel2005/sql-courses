SELECT v.name, m.name AS mentor
FROM volunteers AS v
LEFT JOIN volunteers AS m
  ON v.mentor_id = m.volunteer_id
ORDER BY v.volunteer_id;
