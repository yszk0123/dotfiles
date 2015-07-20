pushd %~dp0
./linkDotfiles.sh
ansible-playbook -i hosts -vv localhost.yml
popd
