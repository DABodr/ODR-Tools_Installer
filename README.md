# ODR DAB installer
Auto-install script of ODR tools for RaspberryPi ARM with Buster, Jessie & Stretch distribution and Debian systems.

- Latest version of Raspbian stretch is available here: https://downloads.raspberrypi.org/raspbian_full_latest
- Latest version on Debian stretch is avaible here: https://www.debian.org/releases/stretch/debian-installer/

  * Install:

- git clone https://github.com/DABodr/ODRinstaller.git
- cd ODRinstaller
- chmod +x ./Install_script_ODR+Config.sh
- ./Install_script_ODR+Config.sh 

It will make a "dab" directory in /home/$USER/ , install all dependency for odr-mmbtools and all tools for run simply a DAB+ multiplex:
   *   ODR-DabMux (DAB/DAB+ multiplexer) 
   *   ODR-AudioEnc (DAB/DAB+ audio encoder)
   *   ODR-PadEnc ( MOT slideshows and DLS encoder)
   *   DABlin ( DAB/DAB+ player for local and remote multiplex)
   *   Auxiliary scripts
   *   The FDK-AAC library with DAB+ patch
   *   Supervisor (automatisation of all tools)

A preconfigured directory with 4 services ,named "config", is also cloned in /home/$USER/dab/ .
You can edit this one and add services.

At the end of the script you can select if you want configure Supervisor server and symlink (y/n)
It will configure Supervisor server on port 8001 and add "config" directory files inside.

Go at this adress: http://localhost:8001 and see all services running in supervisor. (login: odr ; pass: odr)

Congratulations everythings is ready :) 

Now you can listen your own DAB+ multiplex with DABlin:

 - Go to "config" folder cd /home/$USER/dab/config 
 - chmod +x ./listen_my_mux.sh
 - ./listen_my_mux.sh
 - Enjoy!



