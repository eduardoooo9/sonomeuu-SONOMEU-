<?php
// Conexão com o banco de dados SQLite
try {
    $conn = new PDO("sqlite:bd.sql"); // Supondo que o nome do banco de dados seja 'loja.db'
    // Define o modo de erro PDO para exceção
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Recebe os dados do formulário
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $nTelefone = $_POST['telefone'];
    $cep = $_POST['cep'];
    $nCasa = $_POST['numero-casa'];
    $idproduto = $_POST['id-produto'];
    $qtd = $_POST['quantidade'];

    // Verifica se o nome e o email existem na tabela conta
    $sqlConta = "SELECT nome_sobrenome, email FROM conta WHERE nome_sobrenome = ? AND email = ?";
    $stmtConta = $conn->prepare($sqlConta);
    $stmtConta->execute([$nome, $email]);

    if ($stmtConta->rowCount() == 0) {
        die("Erro: Nome ou email inválido.");
    }

    // Verifica se o idproduto existe e está ativo na tabela Produto
    $sqlProduto = "SELECT id, ativo FROM Produto WHERE id = ? AND ativo = 1";
    $stmtProduto = $conn->prepare($sqlProduto);
    $stmtProduto->execute([$idproduto]);

    if ($stmtProduto->rowCount() == 0) {
        die("Erro: Produto inválido ou inativo.");
    }

    // Insere os dados na tabela compra
    $sqlCompra = "INSERT INTO compra (nome, email, nTelefone, cep, nCasa, idproduto, qtd) 
                  VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmtCompra = $conn->prepare($sqlCompra);
    $stmtCompra->execute([$nome, $email, $nTelefone, $cep, $nCasa, $idproduto, $qtd]);

    // Redireciona para uma página de confirmação de sucesso
    header("Location: confirmacao.html");
    exit();
} catch (PDOException $e) {
    echo "Erro: " . $e->getMessage();
}
$conn = null;
?>
