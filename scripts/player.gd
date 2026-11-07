extends CharacterBody2D

# Define a velocidade de movimento do personagem
var acceleration : float = 1500

# Controla a velocidade máxima do personagem
var max_speed: float = 250

var max_fall: float = 300

# Define o valor da gravidade do personagem
var gravity : float = 100

# Define o valor para a força do pulo
var jump_force : float = 110

# Inicializando um objeto assim que o Script é carregado
# A referência do objeto é recuperada a partir do nó
# da cena
@onready var camera_2d: Camera2D = $Camera2D

func _physics_process(delta: float) -> void:
	
	var direction : Vector2
	
	# Se não estiver colidindo com o chão
	if not is_on_floor():
		# aplica a gravidade					
		velocity += Vector2(0, gravity) * delta
	else:
		#Pula somente se a tecla de espaço for pressionada
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -jump_force	
	
	# Verifica se a tecla esta sendo pressionada
	if Input.is_action_pressed("ui_left"):
		direction.x = -1 # Esquerda		
	if Input.is_action_pressed("ui_right"):
		direction.x = 1 # Direita	
	
	#Verifica se esta indo para alguma direção
	if direction.length() > 0:	
		#Alterando a velocidade de movimento do objeto
		velocity += acceleration * delta * direction
	else:
		# Se não estiver indo para nenhum direção
		velocity.x = 0
	
	# Utilizando a função clamp para definir um limite 
	# de velocidade para o personagem
	velocity.x = clamp(velocity.x,-max_speed, max_speed)	
	
	#Aplica um movimento no objeto e verifica colisões
	move_and_slide()
	
	# O player morre se ultrapassar o limite do cenário no eixo Y.
	# Neste exemplo se ultrapassar o valor de 256 pixels.
	# Esse valor de limite é definido na propriedade Bottom da Câmera
	if position.y > camera_2d.limit_bottom:
		# Recarrega a cena atual
		get_tree().reload_current_scene()	
	
	
