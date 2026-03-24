const Students = [
  { name: 'Alice', marks: [85, 90, 78] },
  { name: 'Bob', marks: [70, 80, 65] },
  { name: 'Charlie', marks: [95, 88, 92] },
];

const averageMarksOfStudents = Students.map((student) => {
  const totalMarks = student.marks.reduce((num, res) => num + res, 0);
  const average = totalMarks / student.marks.length;
  return { ...student, average };
});

console.log(averageMarksOfStudents);
