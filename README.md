# Build components for CSG Pi image

# Setup
Run `./Installdeps.sh` this will install all required dependencies
Run `./setup.sh` this will pull all the source and install dependencies
Make sure the `chip-certification-tool` project is updated with the latest changes (eg chip-tool)

# Prepare Matter content for pi image
- Run `./build_stuff_for_pi_image.sh` this will build and copy all components to `send_to_pi` and bundle then in `send_to_pi.zip`
- Copy or scp `send_to_pi.zip` to the target Raspberry Pi
- Unzip with `unzip send_to_pi.zip`
- Run `unpack.sh` on the Raspberry Pi, this will remove old content and replace it with the new.
