# Practica_Jenkins
Una practica de CI-CD utilizando Github, Jenkins y Terraform(instalando Docker y Git)

# Crear Servidor Jenkins con infraestructura Terraform.

Hay que crear un archivo en terraform que nos permita crear varios recursos de servidor el cual se despliegue en jenkins para realizar integración continua.

# En Terraform deben tener:

- Configuración del servidor 
- Docker (Instalación de Docker desde Terraform) 
- Git (Instalación de Git desde Terraform) 
- Instalación del Jenkins
- Instalación de infraestructura terraform mediante Jenkins

# Jenkins debe tener:
- Correr el jenkinsfile al momento que se envie un commit al proyecto.
- Pasos del jenkinsfile (plan, destroy, apply, entre otros que considere).
- Observar que hayan obtenido los cambios del ultimo commit enviado. Pasos del jenkins deben ejecutarse satisfactoriamente.
