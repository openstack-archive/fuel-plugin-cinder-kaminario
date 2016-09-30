Cinder Kaminario plugin for Fuel
=============================

Overview
--------

The plugin configures Kaminario backend for Cinder using multibackend feature.


The plugin support Kaminario K2 All-Flash arrays.

This repo contains all necessary files to build Cinder Kaminario Fuel plugin.


Requirements
------------

| Requirement                                                                              | Version/Comment                                                        |
|------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Mirantis Openstack compatibility                                                         | 9.0                                                                    |
| Kaminario K2 All-Flash array is reachable via one of the Mirantis OpenStack networks     |                                                                        |

How to build plugin:

- Install fuel plugin builder (fpb)
- Clone plugin repo 
  
    ```markdown
    # git clone https://github.com/openstack/fuel-plugin-cinder-kaminario.git
    ```
- Build fuel plugin

    ```markdown
    # cd fuel-plugin-cinder-kaminario/
    # fpb --build .
    ```

- Install the plugin

    ```markdown
    # fuel plugins --install cinder_kaminario-1.0-1.0.0-1.noarch.rpm
    ```
    
- Verify that the plugin is installed correctly
    
    ```markdown
    # fuel plugins
    ```

    | id | name                                           | version | package_version |
    | ---|------------------------------------------------|---------|---------------- |
    | 1  | cinder_kaminario-1.0-1.0.0-1.noarch.rpm        | 1.0.0   | 4.0.0           |