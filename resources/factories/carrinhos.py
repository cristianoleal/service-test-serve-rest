def payload_novo_carrinho(id, quantidade):
    carrinho = {
    "produtos": [
        {
        "idProduto": id,
        "quantidade": quantidade
        }
    ]
    }
    return carrinho

