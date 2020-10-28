-- creating the tables of the database
CREATE TABLE IF NOT EXISTS dev (
	dev_id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(50) NOT NULL,
	PRIMARY KEY (dev_id)
);

CREATE TABLE IF NOT EXISTS fabricante (
	fabricante_id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(50) NOT NULL,
	PRIMARY KEY (fabricante_id)
);

CREATE TABLE IF NOT EXISTS estilo (
	estilo_id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(50) NOT NULL,
	PRIMARY KEY (estilo_id)
);

CREATE TABLE IF NOT EXISTS console (
	console_id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(50) NOT NULL,
	PRIMARY KEY (console_id)
);

CREATE TABLE IF NOT EXISTS jogo (
	jogo_id INTEGER NOT NULL UNIQUE,
	datacompra DATE NOT NULL,
	titulo VARCHAR(150) NOT NULL,
	dev_id INTEGER NOT NULL,
	precocompra NUMERIC(5,2) NOT NULL,
	finalizacao BOOLEAN NOT NULL,
	nota NUMERIC(3,1) NULL,
	PRIMARY KEY (jogo_id),
	FOREIGN KEY (dev_id) REFERENCES dev (dev_id)
);

CREATE TABLE jogoConsole (
	jogo_id INTEGER NOT NULL,
	console_id INTEGER NOT NULL,
	PRIMARY KEY(jogo_id, console_id),
	FOREIGN KEY (jogo_id) REFERENCES jogo (jogo_id),
	FOREIGN KEY (console_id) REFERENCES console (console_id)
);

CREATE TABLE jogoEstilo (
	jogo_id INTEGER NOT NULL,
	estilo_id INTEGER NOT NULL,
	PRIMARY KEY (jogo_id, estilo_id),
	FOREIGN KEY (jogo_id) REFERENCES jogo (jogo_id),
	FOREIGN KEY (estilo_id) REFERENCES estilo (estilo_id)
);
