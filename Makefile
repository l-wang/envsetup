.PHONEY: windows_host windows ubuntu1804 restricted

CREDSTORE_PATH = ../credstore

windows_host: windows ubuntu_host

ubuntu_host: ubuntu1804 common

ubuntu1804:
	ansible-playbook ansible/ubuntu1804/*.yaml

windows:
	ansible-playbook ansible/windows/*.yaml

common:
	ansible-playbook ansible/common/*.yaml

restricted-windows:
	mkdir -p royalts
	$(CREDSTORE_PATH)/credhelper.sh passgetattach "web/Royal TS" code4ward.RoyalTS.Lic.V5.xml > royalts/code4ward.RoyalTS.Lic.V5.xml
	ansible-playbook ansible/restricted/windows.yaml

restricted:
	$(CREDSTORE_PATH)/credhelper.sh passgetattach "web/dreddor.net" bashrc.restricted > bashrc/bashrc.restricted
	ansible-playbook ansible/restricted/bashrc.yaml

clean:
	rm -r royalts