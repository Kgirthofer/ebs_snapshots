name 'delphic_snapshots'
maintainer 'Karl Girthofer'
maintainer_email 'kgirthofer@delphicdigital.com'
license 'All rights reserved'
description 'Installs/Configures delphic_snapshots'
long_description 'Installs/Configures delphic_snapshots'
version '0.0.3'

## depends on another cookbook, or series of cookbooks?
## depends 'some_cookbook'
depends 'delphic_aws'
#Cookbooks installed by your Berksfile:
depends 'delphic_aws', '0.0.2'
