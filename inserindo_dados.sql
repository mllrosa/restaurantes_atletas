INSERT INTO ESPORTES (esp_codigo, esp_nome) VALUES
(1, 'Futebol'),
(2, 'Basquete'),
(3, 'Vôlei'),
(4, 'Natação'),
(5, 'Atletismo');


INSERT INTO EQUIPE
(equ_codigo, equ_nome, equ_qtd, equ_status, equ_regiao, equ_tecnico, esp_codigo)
VALUES
(101, 'Águias F1', 11, 'Ativo', 'Sudeste', 'Sérgio Oliveira', 1),
(102, 'Unidos Basket', 12, 'Ativo', 'Sul', 'Ana Rosa', 2),
(103, 'Vôlei Azul', 6, 'Ativo', 'Sudeste', 'Luís Souza', 3),
(104, 'Nadadores', 8, 'Ativo', 'Sudeste', 'Maria Silva', 4),
(105, 'Corredores', 10, 'Ativo', 'Sul', 'Marcos Costa', 5);


INSERT INTO ATLETAS
(atl_CPF, atl_nome, atl_contato, atl_email, atl_dt_nasc,
 atl_sexo, atl_limit_fisica, equ_codigo, esp_codigo)
VALUES
('34565710211', 'Lucas Silva', '11929618031', 'lucas@email', '2003-01-23',
 'Masculino', 'Sem restrições', 101, 1),

('78129012390', 'Gabriel Matos', '11939220312', 'gabriel@email', '1991-06-11',
 'Masculino', 'Acompanhamento físico', 104, 5),

('12954380112', 'João Pedro', '11912356406', 'joao@gmail', '2004-08-09',
 'Masculino', 'Sem restrições', 105, 3),

('90315781921', 'Ana Clara', '11942260901', 'ana@email', '2005-07-03',
 'Feminino', 'Sem restrições', 103, 3),

('12139860121', 'Nicole Matos', '11925663065', 'nicole@email', '2007-12-11',
 'Feminino', 'Acompanhamento físico', 105, 4),

('39421890936', 'Rafael Costa', '11923021131', 'rafael@email', '1999-11-07',
 'Masculino', 'Sem restrições', 103, 2),

('50843811239', 'Gabriela Silva', '11919324869', 'gabi@email', '1989-09-12',
 'Feminino', 'Sem restrições', 101, 3),

('23198785619', 'Camila Gomes', '11969642201', 'cami@gmail', '1990-02-16',
 'Feminino', 'Sem restrições', 102, 1),

('81878810963', 'Ana Maria', '11938226403', 'ana2@email', '2007-03-13',
 'Feminino', 'Sem restrições', 102, 1);
