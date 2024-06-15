def payload_novo_usuario():
    usuario = {
        'nome': 'Novo Usuario',
        'email': 'novo@usuario.com',
        'password': 'senha',
        'administrador': 'false'
    }
    return usuario

def payload_usuario_alterado():
    usuario = {
        'nome': 'Usuario Alterado',
        'email': 'usuario@alterado.com',
        'password': 'alterado',
        'administrador': 'true'
    }
    return usuario