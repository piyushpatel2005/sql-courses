SELECT b.bench, s.shift
FROM benches AS b
CROSS JOIN shifts AS s
ORDER BY b.bench, s.shift;
