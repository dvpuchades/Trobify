# README #

En este documento estableceremos los primeros pasos en el trabajo colavorativo que vamos a desarrollar.

### What is this repository for? ###

Este repositorio lo utilizaremos para colaborar en Trobify y plasmar todas nuestras aportaciones de las tareas que tengamos asignadas individualmente.


### How do I get set up? ###

Primeros pasos:
	- Instalarse Android Studio y Visual Studio Code y descargar las plugins/extensiones de Flutter en ambos (luego podreis elegir la IDE que más os mole, pero tened ambas).
	- Seguir la guia de instalación de Flutter y comprobar que el comando "flutter" en cmd responde correctamente
	- Si usais VSCode, descargad una extensión de Git para que podais ver los cambios y realizar commits desde ahí.
	- Crear un emulador (móvil virtual) en Android Studio
	- Crear una carpeta Repositorio (lo más accesible posible) y clonar ahi la branch master
	- Comprobar que VSCode y Android Studio reconoce correctamente el proyecto de tipo Flutter 

### Contribution guidelines ###

Para contribuir en la branch master (que será donde tengamos la versión estable y funcional de app) deberemos crear Pull Request.
No trabajaremos todos sobre la branch master sino que hiremos creando branches diferentes para tareas específicas. 
Es decir, tendremos una tarea T, crearemos una branch T' donde hagamos el trabajo y posteriormete haremos una Pull Request de esa branch T'.

Una Pull Request, teniendo en mente que tenemos la branch master (principal) y la branch T' (modificaciones), es una petición de merge para volcar los cambios de T' a master.
Esta PR será revisada por otro miembro del equipo, mirará el código, si es necesario lo probará en su emulador y aprobará los cambios. Una vez verificado y aprobado, se realizará el merge a master.

Cuando se haga el merge, la master se actualizará y el resto del equipo tendrá que actualizar master. Una vez actualizada, podrá aplicar las nuevas tareas sobre la nueva versión.

De esta forma será mucho más facil trabajar colaborativamente sin chafarnos los unos a los otros. ¿Por qué? Porque, si ocurren conflictos entre la branch T y master, Bitbucket nos lo mostrará y no nos dejará volvar los cambios.

Por ello he blindado la branch master, para que ninguno pueda hacer push directamente sobre esta (excepto yo para acelerar el inicio del proyecto) y tengamos una versión estable y libre de errores de la aplicación.

### How do I create a branch and a Pull Request?###

Las branches seguirán un formato para nombrarlas. De esta forma podremos distinguir qué tipo de tarea es, su número en la tabla del Worki y su identificador/titulo

Será de la siguiente forma : ###[type]/[taskNumber]/[title]###

[type] : feature | bugfix | hotfix
[numer] : numero de la tarea asociado a la branch
[title] : titulo de la tarea que describa brevemente lo que trata de modificar

feature -> Cuando añadimos una nueva funcionalidad, clases, métodos o views. Ej: feature/T05/ImplementacionFirebase
bugfix -> Cuando alguna funcionalidad falla garrafalmente y se necesita cierto tiempo para revisar y realizar cambios importantes (ojalá no existan nunca) Ej: bugfix/B01/BuscadorBug
hotfix -> Cuando se quieren realizar pequeñas modificaciones que solucionen errores o warnings poco críticos. Si es muy urgente o expontáneo no hace falta asociar una tarea a un hotfix. Ej: hotfix/BarraMenúDescuadrada

### Who do I talk to? ###

Háblale al mandón de Alex que seguro que te ayuda.