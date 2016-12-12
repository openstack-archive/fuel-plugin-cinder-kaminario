

Install Kaminario Cinder Plugin For Fuel
========================================

Before you install Kaminario Cinder Plugin for Fuel ensure that you have installed and configured the Fuel Master node. Typically, you need to install a Fuel plugin before you deploy an OpenStack environment.   

**To install Kaminario Cinder Plugin:**

#. Download  from the `Fuel Plugins Catalog`_.

#. Copy the plugin ``.rpm`` package to the Fuel Master node:

   **Example:**
   
   .. code-block:: console

      # scp cinder_kaminario-1.0-1.0.0-1.noarch.rpm root@fuel-master:/tmp

#. Log in to Fuel Master node CLI as root.
#. Install the plugin by typing:

   .. code-block:: console
   
      # fuel plugins --install cinder_kaminario-1.0-1.0.0-1.noarch.rpm

#. Verify that the plugin is installed correctly:

   .. code-block:: console
   
     # fuel plugins
     id | name                                           | version | package_version
     ---|------------------------------------------------|---------|----------------
     1  | cinder_kaminario-1.0-1.0.0-1.noarch.rpm        | 1.0.0   | 4.0.0


.. _Fuel Plugins Catalog: https://www.mirantis.com/products/openstack-drivers-and-plugins/fuel-plugins/
