# Autodeploy

Esta parte del proyecto despliega automáticamente en AWS el proyecto dejandolo listo para usarse.

## Prerequisitos

Se ha de configurar el fichero ~/.aws/credentials una sección practicaweb con los datos de un usuario de servicio AWS con las siguientes políticas:
* arn:aws:iam::aws:policy/AmazonEC2FullAccess
* arn:aws:iam::aws:policy/AmazonRoute53FullAccess

Se tiene que tener una llave ssh en AWS llamada practicaweb, que el sistema desde el que se lance el instalador pueda usar.

Se tiene que tener un dominio dado de alta en route53 (testing.com.es). En el caso que no esté registrado en route53 si no solo gestionado en él, hay que obtener el hosted zone ID.
