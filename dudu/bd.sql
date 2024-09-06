CREATE TABLE Conta (
    id INTEGER PRIMARY KEY NOT NULL,
    senha INTEGER UNIQUE NOT NULL,
    nome_sobrenome TEXT UNIQUE NOT NULL,
    data_nasc DATE NOT NULL,
    email TEXT
);

CREATE TABLE setor (
    codigo INTEGER NOT NULL PRIMARY KEY,
    descricao TEXT
);

CREATE TABLE Produto (
    id INTEGER PRIMARY KEY NOT NULL,
    nome TEXT NOT NULL,
    un_medida TEXT NOT NULL,
    preco REAL NOT NULL,
    tipo TEXT,
    cd_setor INTEGER NULL,
    ativo INTEGER NOT NULL CHECK (ativo IN (0, 1)), -- Booleano é representado por INTEGER com CHECK (0 ou 1)
    FOREIGN KEY (cd_setor) REFERENCES setor(codigo)
);

CREATE TABLE compra (
    id_conta INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    qtd INTEGER NOT NULL,
    FOREIGN KEY (id_conta) REFERENCES Conta(id),
    FOREIGN KEY (idProduto) REFERENCES Produto(id)
);

INSERT INTO Produto (id, nome, un_medida, preco, tipo, cd_setor, ativo) VALUES
(1, 'Coala Boia Lilas', 'tamanho único', 39.90, 'short e blusa', 1, 1),
(2, 'Inverno Coala', 'tamanho único', 59.90, 'calça e blusa', 1, 1),
(3, 'Soft Fleece Coala Gelly', 'tamanho único', 39.90, 'calça e blusa', 1, 0),
(4, 'manga longa', 'tamanho único', 29.90, 'calça e blusa', NULL, 1),
(5, 'Unicórnio', 'tamanho único', 79.90, 'macacão', NULL, 1),
(6, 'Dino com Cristas 3D', 'tamanho único', 89.90, 'calça e blusa', NULL, 1),
(7, 'Select Verde', 'tamanho único', 49.90, 'calção e blusa', NULL, 1),
(8, 'Coala Verde', 'tamanho único', 69.90, 'calça e blusa', NULL, 1),
(9, 'Sonic', 'tamanho único', 89.90, 'calça e blusa', NULL, 0),
(10, 'supermman', 'tamanho único', 39.90, 'calção e blusa', NULL, 1),
(11, 'Americano', 'tamanho único', 120.00, 'short e blusa', NULL, 1),
(12, 'Americano longo', 'tamanho único', 89.90, 'calça e blusa', NULL, 1),
(13, 'Americano cetin', 'tamanho único', 89.90, 'short e blusa', NULL, 1),
(14, 'renda', 'tamanho único', 39.90, 'short e regata', NULL, 0),
(15, 'camuflado', 'tamanho único', 69.90, 'calça e blusa', NULL, 1),
(16, 'cogumelo', 'tamanho único', 39.90, 'short e regata', NULL, 1),
(17, 'inverno', 'tamanho único', 69.90, 'calça e blusa', NULL, 1),
(18, 'bola de futbol', 'tamanho único', 29.90, 'calção e blusa', NULL, 0),
(19, 'Americano', 'tamanho único', 89.90, 'calção e blusa', NULL, 1),
(20, 'montros S.A', 'tamanho único', 89.90, 'calção e blusa', NULL, 1),
(21, 'capitão america', 'tamanho único', 89.90, 'calça e blusa', NULL, 1),
(22, 'Minnie Mouse', 'PLus size', 89.90, 'calça e blusa', NULL, 1),
(23, 'Mickey Mouse', 'PLus size', 129.90, 'short e blusa', NULL, 1),
(24, 'Americano', 'PLus size', 59.90, 'calção e blusa', NULL, 1),
(25, 'Jonas', 'PLus size', 89.90, 'calça e blusa', NULL, 0),
(26, 'azul listrado', 'PLus size', 49.90, 'calção e blusa', NULL, 1);
