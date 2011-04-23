
Ejecutar en consola smtpd port 1025 "para la obtención de los mensaje (email) que enviara la aplicacion.
python -m smtpd -n -c DebuggingServer localhost:1025

Database Dump está en la carpeta _db

settings.py

        'ENGINE': 'mysql',
        'NAME': 'book',
        'USER': 'root',
        'PASSWORD': '',



Mango Project

Funcionalidades

1. Implementación de Username Project( add user,add profile, edit detail user...)
2. Loggin with Facebook( utilizando la api de facebook para obtener la informacion del usuario)
3. El usuario puede Agregar, editar y borrar sus contactos
4. El usuario puede crear y editar eventos relacionadas con sus contactos
5. El usuario puede crea una historias relacionadas con sus contactos es decir (Call, no-Call and Send Email)
6. El usuario puede ver el listado de todos sus eventos ordenados de a-z
7. El usuario puede ver el listado de sus acciones por hacer con sus contactos.
8. El usuario puede ver el listado de su historia en la aplicacion con todos ó uno de sus contactos.
9. Los eventos en el momento de ser editar como ya hechos, dejan de estar en el listado de acciones por hacer.
10. Los eventos esta divididos en tres items (Later,Today and After) y en estos se listan y organizan de acuerdo a la fecha en el momento de ejucutar la aplicación.

CREATED BY

Hernán Darío Blanco Matos, hdblanco.m@gmail.com
Daniel Jose Romero Martinez, tramusoft@hotmail.com  

22/abr/2011
