from django.shortcuts import render
from .models import Usuarios
# Create your views here.

def home(request):
    return render(request,'usuarios/home.html')

def usuarios(request):
    #salvar dados da tela para o banco
    novo_usuario = Usuarios()
    novo_usuario.nome = request.POST.get('nome')
    novo_usuario.idade = request.POST.get('idade')
    novo_usuario.save()
    
    #exibir os usuarios já cadastrados em uma nova pagina
    
    usuarios = {
        'usuarios': Usuarios.objects.all()
    }
    
    #retornar os dados para a pagina de listagem de usuarios
    
    return render(request, 'usuarios/usuarios.html',usuarios)