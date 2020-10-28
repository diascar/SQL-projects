INSERT INTO dev (dev_id, nome) VALUES (1, 'Bethesda'),
	(2, 'Nintendo'), (3, 'Microsoft'), (4, 'Sony'), 
	(5, 'CD Projekt Red'),(6, 'Ubisoft'), (7, 'EA'), 
	(8, 'Remedy'), (9, 'Capcom'), (10, 'Rockstar');

INSERT INTO fabricante (fabricante_id, nome) VALUES
(1, 'Sony'), (2, 'Nintendo'), (3, 'Microsoft'), (4, 'Google');

INSERT INTO console (console_id,  nome) VALUES
	(1, 'Playstation 4'), (2, 'Playstation 3'), (3, 'Wii U'), (4, 'Switch'),
	(5, 'Xbox One'), (6, 'Xbox Series X'), (7, 'Stadia');

INSERT INTO estilo (estilo_id, nome) VALUES
	(1, 'RPG'), (2, 'Aventura'), (3, 'FPS'), (4, 'Plataforma'), (5, 'Puzzle'),
	(6, 'Walking Simulator'), (7, 'Survival Horror'), (8, 'Battle Royale'),
	(9, 'Corrida'), (10, 'Esportes');

INSERT INTO jogo VALUES (1, 'jan-10-2015', 'Dishonored', 1, 35.50, false, 9.5),
	(2, 'feb-22-2015', 'Dishonored 2', 1, 40.00, false, 9.0),
	(3, 'feb-27-2015', 'Fifa 14', 7, 20.55, false, 7.0),
	(4, 'mar-03-2015', 'The Witcher 3', 5, 60.00, true, 10.0),
	(5, 'mar-29-2015', 'Zelda', 2, 100.00, true, 10.0),
	(6, 'may-03-2015', 'Forza Horizon 2', 3, 50.00, false, 8.5),
	(7, 'may-09-2015', 'Ori and the blind forest', 3, '30.00', true, 9),
	(8, 'may-12-2015', 'Resident Evil Revelations 2', 9, 43.00, false, 7.2),
	(9, 'may-15-2015', 'Alan Wake', 8, 20.45, true, 7.1),
	(10, 'may-18-2015', 'Quantum Break', 8, 50.00, false, 7.0),
	(11, 'may-20-2015', 'Dishonored 2', 1, 50.00, false, 9.0),
	(12, 'may-20-2015', 'The Witcher 3', 5, 65.00, true, 10.0);

INSERT INTO jogoConsole (jogo_id, console_id) VALUES
	(1, 5), (2, 5), (3, 1), (4, 5), (5, 4), (6, 5), (7, 5), (8, 1), (9, 5),
	(10, 5), (11, 1), (12, 7);

INSERT INTO jogoEstilo (jogo_id, estilo_id) VALUES
	(1, 2), (1,3), (2, 1), (2, 3), (3, 10), (4, 1), (4, 2), (5, 1), (5, 2), (6, 9), (6, 10), (7, 1), (7, 2), (7, 4), (8, 7), (9, 6), (9, 7), (10, 2), (11, 2), (11, 3);
