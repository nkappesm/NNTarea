## NNTarea

## Servidor

La aplicación está funcionando en un servidor heroku en la dirección:
http://nntarea.herokuapp.com/

## Información general

 La aplicación está desarrollada con:

 ruby 2.3.1p112
 Rails 4.2.6

 En la ventana http://nntarea.herokuapp.com/players/ se puede crear, editar y eliminar jugadores. Para crear un jugador se debe ingresar su nombre. Adicionalmente, si se desea se puede modificar su plata (default: 10.000) y su estado inicial (default: true).

 Cada 3 minutos se juega una ronda con todos los jugadores que estén activos en ese momento. Si un jugador llega a tener plata menor o igual a cero deja de estar activo hasta que se modifique su estado y su plata o sean las 00:00, hora en que todos los jugadores obtienen 10.000 de plata y pasan a estar activos.

 ## Gemas

 Para las rondas y la actualización a media noche se utilizó la gema 'delayed_job_active_record', la que permite hacer colas de métodos a llamar en el futuro.

 El servidor web funciona con la gema puma.

