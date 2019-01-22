# ODR DAB installer
Auto-install script of mmbtools for RPI on Jessie and Stretch distribution.

- latest version of Raspbian stretch is available here: https://downloads.raspberrypi.org/raspbian_full_latest

  * Install:

- git clone https://github.com/DABodr/ODRinstaller.git
- cd ODRinstaller
- chmod +x ./Install_script_ODR.sh
- ./Install_script_ODR.sh 

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

Next, run ./Config.sh.
This tool will configure Supervisor server on port 8001 and add "config" directory files inside.

- chmod +x Config.sh
- ./Config.sh

Now you can go at this adress: http://localhost:8001 and see all services running in supervisor.

Congratulations everythings is ready :) 

Now you can listen your own DAB+ multiplex with DABlin at this command ( .sh script also available here https://github.com/DABodr/scriptsh.git with name "zmq_loc_to_dablin.sh" ):

/home/$USER/dab/mmbtools-aux/zmqtest/zmq-sub/zmq-sub localhost 18081 | /home/$USER/dab/dablin/build/src/dablin_gtk


