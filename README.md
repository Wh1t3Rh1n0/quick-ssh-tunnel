Quick SSH Tunnel
=====================

***Scripts to quickly setup an SSH server for reverse tunneling***


Basic use
---------
On a Kali Linux SSH server:

1. Change the settings in settings.conf.

2. As **root**, run the main.sh script. This will:
    - Update the configuration of the running SSH service.
    - Create a non-root user account for making the reverse SSH tunnel 
      connection.
    - Generate payload files in the webroot folder for Linux and
      Windows.

3. As **root**, run start-web-server.sh OR copy the webroot files
   to a running web server.
    - The start-web-server.sh script is just a convenience script to
      run the basic python3 web server.


Files and folders included
--------------------------
```
./README.txt            - This file
./settings.conf         - Configuration file for the tool
./main.sh               - Main program file
./uninstall.sh          - Not really an uninstaller. Deletes the SSH
                          tunnel user and cleans up the web root.
./start-web-server.sh   - Script to start a basic python3 web server.

./webroot               - Directory where all web-served files live.

./webroot-clean
./webroot-clean/libcrypto.dll \_ Windows OpenSSH client program files.
./webroot-clean/ssh.exe       /  Supports -R reverse SOCKS5 proxying.
./webroot-clean/plink.exe     - For legacy Windows systems.
./webroot-clean/index.html

./resources             - Payload file templates and sub-scripts called
                          by the main program live in here.
                          
./resources/NOTES_on_SSH_port_forwarding.txt    - A note on syntax for
                                                  ssh -R and -L.
                                                  
./tools                         - Tools for testing client connections.
./tools/test-reverse-proxy.sh   - Compares local external IP and external
                                  IP observed through the SOCKS proxy.
./tools/test-smb-forward.sh     - Quick query of SMB service with smbclient.
./tools/test-rdp-forward.sh     - Quick query of RDP service with openssl.
```