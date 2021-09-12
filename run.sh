#!/bin/sh

set -ex

#Needed to prevent error: Removing ABC_XYZ.rpm, due to missing GPG key.
reposync --gpgcheck --plugins --repoid=base --newest-only --delete --downloadcomps --download-metadata --download_path=/var/www/html/repos/
reposync --gpgcheck --plugins --repoid=centosplus --newest-only --delete --downloadcomps --download-metadata --download_path=/var/www/html/repos/
reposync --gpgcheck --plugins --repoid=extras --newest-only --delete --downloadcomps --download-metadata --download_path=/var/www/html/repos/
reposync --gpgcheck --plugins --repoid=updates --newest-only --delete --downloadcomps --download-metadata  --download_path=/var/www/html/repos/

createrepo /var/www/html/repos/base/ -g comps.xml
createrepo /var/www/html/repos/centosplus/
createrepo /var/www/html/repos/extras/
createrepo /var/www/html/repos/updates/
