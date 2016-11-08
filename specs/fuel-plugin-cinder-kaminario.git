Fuel Plugin for Cinder Kaminario
================================

Kaminario’s K2 all-flash array leverages a unique software-defined architecture that delivers predictable performance, scalability and cost-efficient highly valued predictability for the unpredictable world of the modern datacenter.

This plugin configures multiple Cinder Kaminario backends.

Problem description
===================

Currently, Fuel does not support installing OpenStack environments that
use Kaminario’s K2 all-flash array as a Cinder backend. This Fuel plugin establishes support to automatically configure the Kaminario’s K2 all-flash array as a cinder backend.

Proposed change
---------------

This plugin will provide the needed Puppet manifests to, easily configure Kaminario’s K2 all-flash array as a cinder backend.

Alternatives
------------

N/A - the aim is to implement a Fuel plugin.

Data model impact
-----------------

None.

REST API impact
---------------

Install the krest library in order to communicate with the Kaminario’s K2 all-flash array.

Upgrade impact
--------------

This plugin is compatible with Fuel version 9.0 only. If an upgrade is performed on the Fuel Master node to a Fuel version higher than 9.0 then it could stop working.

Security impact
---------------

None.

Other end user impact
---------------------

Once the plugin is installed, a new tab dedicated to the Kaminario plugin will be created in the Fuel web UI under the Settings tab. The user can configure the credentials and other options in this new tab.

Performance Impact
------------------

None.

Plugin impact
-------------

The plugin will:

* Install the python krest library
* Configure Kaminario cinder storage backends.

Other deployer impact
---------------------

None.

Implementation
==============

Assignee(s)
-----------

Primary assignee:

- Pradip Rawath <Pradip.Rawat.CTR@kaminario.com> (developer)
- Chaithanya Kopparthi <chaithanyak@biarca.com> (developer).

Work Items
----------

Dependencies
============

* Fuel 9.0
* Kaminario K2 all-flash array with version 5.8 or later
* krest rest api version 2.2.0 or later.

Testing
=======

* Prepare a test plan.

* Test the plugin according to the test plan.


Documentation Impact
====================

Create the following documentation:

 * User Guide

 * Test Plan

 * Test Report.

