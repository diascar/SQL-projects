SELECT * FROM jogo;

-- listando jogo e console
SELECT j.titulo, c.nome
FROM jogoconsole jc
JOIN jogo j
ON j.jogo_id = jc.jogo_id
JOIN console c
ON c.console_id = jc.console_id;

--listando jogo, desenvolvedora e console
SELECT j.titulo, d.nome as dev, c.nome as console
FROM jogo j, dev d, console c, jogoconsole jc
WHERE j.jogo_id = jc.jogo_id
AND c.console_id = jc.console_id
AND d.dev_id = j.dev_id;

--alternativa ao comando anterior (mas note que aqui os rótulos das colunas não serão renomeados, podendo gerar ambiguidade)
SELECT j.titulo, d.nome, c.nome
FROM jogo j, dev d, jogoconsole jc, console c
WHERE j.jogo_id = jc.jogo_id
AND c.console_id = jc.console_id
AND d.dev_id = j.dev_id;

--listando jogo, desenvolvedora e console, porém usando CTE
WITH temp AS (                                   
	SELECT j.titulo, c.nome, j.dev_id
	FROM jogoconsole jc
	JOIN jogo j
	ON j.jogo_id = jc.jogo_id
	JOIN console c
	ON c.console_id = jc.console_id)
SELECT titulo, temp.nome, d.nome
FROM temp
JOIN dev d
ON d.dev_id = temp.dev_id;

--listando uma table jogo e console usando JOIN
SELECT j.titulo AS jogo, c.nome AS console
FROM jogoconsole jc
JOIN jogo j
ON j.jogo_id = jc.jogo_id
JOIN console c
ON c.console_id = jc.console_id

--listando número de jogos por console
SELECT COUNT(j.titulo) as "# jogos", c.nome
FROM jogoconsole jc
JOIN jogo j
ON j.jogo_id = jc.jogo_id
JOIN console c
ON c.console_id = jc.console_id
GROUP BY c.nome
ORDER BY c.nome;

--listando jogo e estilo
SELECT j.titulo, e.nome
FROM jogoestilo je
JOIN jogo j
ON j.jogo_id = je.jogo_id
JOIN estilo e
ON e.estilo_id = je.estilo_id
ORDER BY e.nome;


SELECT COUNT(j.titulo), e.nome
FROM jogoestilo je
JOIN jogo j
ON j.jogo_id = je.jogo_id
JOIN estilo e
ON e.estilo_id = je.estilo_id
GROUP BY e.nome;

--definindo uma função para recuperar o nome da dev a partir do código.
CREATE FUNCTION get_devname(p1 integer)
	RETURNS text AS $nam$
	DECLARE nam text;
	BEGIN
		SELECT nome INTO nam FROM dev WHERE dev_id = p1;
		RETURN nam;
	END;
	$nam$ LANGUAGE plpgsql;

--testando a função
SELECT get_devname(1);
SELECT get_devname(2);

--criando uma view para facilitar o acesso aos nomes dos jogos por console
create view nomes_jogos_consoles as
	select j.titulo, c.nome
	from jogoconsole jc
	join jogo j
	on j.jogo_id = jc.jogo_id 
	join console c
	on c.console_id = jc.console_id;
