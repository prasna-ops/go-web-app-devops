chmod +x install-kubectl.sh
./install-kubectl.sh                # latest stable, binary install
./install-kubectl.sh v1.31.0        # pin a version
METHOD=apt ./install-kubectl.sh     # use the pkgs.k8s.io apt repo