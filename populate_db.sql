INSERT INTO worker (name, birthday, level, salary) VALUES
	('Martin Doe', '2004-04-28', 'Trainee', 300),
	('Bob Smith', '2005-06-12', 'Trainee', 300),
	('Andrii Johnson', '2002-10-22', 'Junior', 700),
	('Liza Brown', '2001-04-08', 'Junior', 600),
	('Oleksandra Wilson', '1997-11-12', 'Middle', 1500),
	('Max Lee', '1999-09-25', 'Middle', 1200),
	('Serhii Wilson', '1996-07-18', 'Middle', 2900),
	('Stiven Davis', '1998-03-05', 'Middle', 2200),
	('Ilon Miller', '1995-12-30', 'Middle', 2600),
	('Stepan Anderson', '1994-08-10', 'Senior', 3700),
	('Ivat Johnson', '1992-05-20', 'Senior', 5500),
	('Petro Davis', '1991-01-15', 'Senior', 4600);

INSERT INTO client (name) VALUES
	('John Kozak'),
   ('Mary Giga'),
   ('Robert Yavorenko'),
	('Alice Ukrainka'),
	('Michael Petliyra'),
	('Emma Chubrynets'),
	('David Markivna');



INSERT INTO project (client_id, start_date, finish_date) VALUES
	(1, '2023-01-01', '2024-02-28'),
   (1, '2023-02-15', '2023-05-15'),
   (2, '2023-03-10', '2025-06-10'),
   (3, '2023-04-05', '2024-07-05'),
   (3, '2023-05-20', '2025-10-20'),
   (3, '2023-06-15', '2023-07-15'),
   (4, '2023-07-01', '2024-11-30'),
   (5, '2023-08-10', '2026-08-20'),
   (6, '2023-09-05', '2024-09-05'),
   (6, '2023-10-01', '2023-11-30'),
	(7, '2023-09-01', '2025-01-30');

INSERT INTO project_worker (project_id, worker_id) VALUES
	(1, 1),
	(1, 3),
	(1, 5),
	(1, 10),
	(2, 3),
	(2, 6),
	(2, 12),
	(3, 7),
	(3, 11),
	(4, 2),
	(4, 4),
	(4, 11),
	(5, 10),
	(6, 4),
	(6, 9),
	(7, 1),
	(7, 2),
	(7, 8);