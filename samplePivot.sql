WITH Students AS (
    SELECT *
    FROM (VALUES
        (1, 'std1'),
        (2, 'std2')
    ) AS s(StudentId, StudentName)
),
Subjects AS (
    SELECT *
    FROM (VALUES
        (1, 'Sub1'),
        (2, 'Sub2'),
        (3, 'Sub3')
    ) AS sub(SubjectId, SubjectName)
),
Marks AS (
    SELECT *
    FROM (VALUES
        (1, 1, 80),
        (1, 2, 75),
        (1, 3, 90),
        (2, 1, 70),
        (2, 2, 85),
        (2, 3, 88)
    ) AS m(StudentId, SubjectId, Marks)
)
SELECT StudentName, [Sub1], [Sub2], [Sub3]
FROM (
    SELECT s.StudentName, sub.SubjectName, m.Marks
    FROM Marks m
    INNER JOIN Students s ON s.StudentId = m.StudentId
    INNER JOIN Subjects sub ON sub.SubjectId = m.SubjectId
) AS SourceTable
PIVOT (
    MAX(Marks)
    FOR SubjectName IN ([Sub1], [Sub2], [Sub3])
) AS PivotTable;
