.. _overview:

Overview of the Kaminario Cinder plugin
=======================================

The Kaminario cinder fuel plugin helps in configuring Kaminario iSCSI and FC cinder drivers for Kaminario K2 All-Flash arrays in Mirantis Fuel OpenStack setup.It allows to configure and scale multiple Kaminario backends.It installs the “krest” python library on cinder-volume node which is prerequisite for Kaminario iSCSI and FC cinder drivers.It allows to configure various cinder and Kaminario specific option.

Software prerequisites 
----------------------

To use the Kaminario Cinder plugin, verify that your environment meets the following prerequisites:

============================  ======================================
Prerequisites                 Version/Comment
============================  ======================================
Fuel                          9.0
Kaminario K2 All Flash Array  K2 rest api version should be >= 2.2.0
============================  ======================================


* The Kaminario K2 All-Flash array should be configured with data and management path to the cinder volume nodes and data path to the nova compute nodes.

* For replication, replication peer should be configured

Limitations
-----------

No limitaitions

