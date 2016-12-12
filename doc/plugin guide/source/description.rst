.. _overview:

Overview of the Kaminario Cinder plugin
=======================================

The Kaminario Cinder Plugin for Fuel  assists in the configuration of the Kaminario Cinder driver for Kaminario K2 All-Flash array. The plugin enables configuration of one or many Kaminario K2 back-ends by installing the “krest” python library on cinder-volume node which is prerequisite for Kaminario iSCSI and FC cinder drivers.

Software prerequisites 
----------------------

To use the Kaminario Cinder plugin for Fuel, verify that your environment meets the following prerequisites:


============================  ======================================
Prerequisites                 Version/Comment
============================  ======================================
Fuel                          9.0
Kaminario K2 All Flash Array  K2 rest api version should be >= 2.2.0
============================  ======================================



* The Kaminario K2 All-Flash array should be configured with data and management path to the cinder volume nodes and data path to the nova compute nodes.

* To enable replication, a replication peer must be configured. 

Limitations
-----------

No limitations.
