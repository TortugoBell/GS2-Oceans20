-- Criação da tabela Usuario
CREATE TABLE Usuario (
    usuario_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_registro DATE,
    pontuacao_total INT DEFAULT 0,
    nivel INT DEFAULT 1,
    estilo_coleta_preferido VARCHAR(50) -- 'catador' ou 'coletor'
);

-- Criação da tabela Desafio
CREATE TABLE Desafio (
    desafio_id INT PRIMARY KEY,
    nome_desafio VARCHAR(100),
    descricao TEXT,
    data_inicio DATE,
    data_termino DATE,
    pontos_recompensa INT
);

-- Criação da tabela EventoLimpeza
CREATE TABLE EventoLimpeza (
    evento_id INT PRIMARY KEY,
    nome_evento VARCHAR(100),
    descricao TEXT,
    data_evento DATE,
    localizacao VARCHAR(255),
    organizador VARCHAR(100)
);

-- Criação da tabela Coleta
CREATE TABLE Coleta (
    coleta_id INT PRIMARY KEY,
    usuario_id INT,
    evento_id INT,
    data_coleta DATE,
    localizacao VARCHAR(255),
    quantidade_pecas INT, -- Para "catador"
    quantidade_kg FLOAT, -- Para "coletor"
    quantidade_kg_m3 FLOAT, -- Para "coletor"
    tipo_residuo VARCHAR(100),
    foto_url VARCHAR(255),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (evento_id) REFERENCES EventoLimpeza(evento_id)
);

-- Criação da tabela ConteudoEducacional
CREATE TABLE ConteudoEducacional (
    conteudo_id INT PRIMARY KEY,
    titulo VARCHAR(100),
    tipo VARCHAR(50), -- vídeo, podcast, artigo
    url VARCHAR(255),
    descricao TEXT
);

-- Criação da tabela Usuario_Desafio
CREATE TABLE Usuario_Desafio (
    usuario_id INT,
    desafio_id INT,
    status VARCHAR(50), -- em andamento, completo
    data_conclusao DATE,
    PRIMARY KEY (usuario_id, desafio_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (desafio_id) REFERENCES Desafio(desafio_id)
);
