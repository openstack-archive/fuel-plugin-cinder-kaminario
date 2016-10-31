
Plugin configuration
--------------------

**To configure Kaminario Cinder plugin:**

* create environment in Fuel web UI by enabling kaminario option which is in Storage Backends tab.

   .. image:: ./images/new_openstack_environment.png
      :width: 400pt
      :alt: New Openstack Environment
   

* To configure the plugin go to settings tab and click on storage tab. 

   .. image:: ./images/openstack_settings.png
      :width: 400pt
      :alt: OpenStack Settings

* Following  are the basic options to configure the Kaminario Cinder Fuel Plugin 

   .. image:: ./images/basic_options.png
      :width: 400pt
      :alt: Basic Settings

*Storage Protocol*: Select ‘ISCSI‘ for Kaminario K2 All-Flash iSCSI array and ‘FC‘ forKaminario K2 All-Flash FC array

*Cinder Node*: Specify the name of the cinder node to configure Kaminario backend

*Kaminario storage IP*: Management IP for the Kaminario K2 All-Flash array

*Backend Name*: Specify the name for the Kaminario backend

*Username*: Specify the username for the Kaminario K2 All-Flash array

*Password*: Specify the corresponding password for the user

* To add details of replication peer, check ‘Enable Replication‘ box and fill the following details

   .. image:: ./images/replication.png
      :width: 400pt
      :alt: Replication

*IP address*: Specify the IP address for the replication peer

*Username*: Specify the username for the replication peer

*Password*: Specify the corresponding password for the user

*RPO*: Specify RPO value for replication, it should either 60 sec or multiples of 300 secs.

* To create a volume type check the ‘Create Volume Type‘ box and fill the following details

   .. image:: ./images/create_volume_type.png
      :width: 400pt
      :alt: Create volume type

*Volume Type Name*: Specify a name for the volume type

*Advanced options*: To enable advanced functionalities like replication and nodedup check any one of three options

   .. image:: ./images/options.png
      :width: 400pt
      :alt: Options

*Default Type*: Check If the above-created volume type should be default volume type

*Enable Multipath*: Check this box in order to use multipath in cinder and nova

*Suppress logs*: Check this box in order to suppress python ‘requests‘ library warnings.

*Filter function*: Specify Filter function(optional)

*goodness function*: Specify goodness function(optional)

*Oversubscription Ratio*: If this is checked kaminario driver will calculate dynamically "max_over_subscription_ratio".

*Scheduler filters*: In order to enable scheduler filters explicitly, specify filter name separated by comma

*Scheduler weighers*: In order to enable scheduler weigher explicitly, specify weigher name separated by comma

*RPC Timeout*: Specify the rpc timeout, the default timeout is 60 sec

   .. image:: ./images/new_backend.png
      :width: 400pt
      :alt: New backend

Check this option to add a new ‘Kaminario K2 All-Flash array‘ as a new backend or to scale the existing backend.

* Specify new ‘volume_backend_name‘ to add a new backend 

* Use same ‘volume_backend_name‘ if scale an existing backend. This plugin supports the addition of 5 extra backends.

This plugin is hot pluggable.One can deploy it again without disturbing the existing backends or existing setup.
