# Build components for CSG Pi image

# Setup
Run `./Install_Dependencies.sh` this will install all required dependencies                         
Run `./Setting_up.sh` this will pull all the source and install dependencies                                                
Make sure the `chip-certification-tool` project is updated with the latest changes (eg chip-tool)

# Prepare Matter content for pi image
- Run `./Building_zip_for_pi.sh` this will build and copy all components to `To_pi` and bundle then in `To_pi.zip`
- Copy or scp `To_pi.zip` to the target Raspberry Pi
- Unzip with `unzip To_pi.zip`
- Run `./Install_Dependencies.sh` this will install all required dependencies 
- Run `Unpack_in_pi.sh` on the Raspberry Pi, this will remove old content and replace it with the new.
