# ABCTECHUSA

## Como Instalar?

1. Clonar ou fazer download do projeto dentro do htdocs/abctechusa (apache, xampp, wamp, namp, etc);
 
2. Verificar se base url está apotando para pasta correta (/abctechusa/application/config/config.php); 
 	Ex: $config['base_url'] = 'http://localhost/abctechusa'; //se mudar o nome da pasta edite essa linha com o mesmo nome da pasta;
		
3. Importar banco de dados que se encontra dentro da pasta (/abctechusa/Documentação/database_programmer_test.sql);

4. Se seu banco tiver senha terá que editar a conexão no arquivo (/abctechusa/application/config/database.php).
	Ex: 	'hostname' => 'localhost', //Se o banco for on-line ou em outra máquina local, mude aqui
		'username' => 'root', //Root e usuário padrão, se for estiver diferente mude aqui
		'password' => '', //A senha por padrão vem vazio, se tiver senha acrescente aqui;


	
## Como Execultar?

##### Se o servidor apache estiver rodando juntamente como o banco de dados Mysql, basta abrir o navegador e colar esse endereço no browser (http://localhost/abctechusa/).


