# Build components for CSG Pi image

# On the current pi: 

# Setup
Run `./install_dependencies.sh` this will install all required dependencies.                         
Run `./setting_up.sh` this will pull all the source and install dependencies.                                               
Make sure the `chip-certification-tool` project is updated with the latest changes (eg chip-tool).

# Prepare Matter content for pi image
Run `./build_zip_for_pi.sh` this will build and copy all components to `To_pi` and bundle then in `To_pi.zip`.  
Copy or scp `To_pi.zip` to the target Raspberry Pi.

# On the new pi:
 
Unzip with `unzip To_pi.zip`.  
Use `./movetoroot.sh` to move all files to root, and apps to a new directory.  
Run `./install_dependencies.sh` this will install all required dependencies.  
Run `./unpack_in_pi.sh` on the Raspberry Pi, this will remove old content and replace it with the new.
