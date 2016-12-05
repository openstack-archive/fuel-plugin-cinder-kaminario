Verification
============

Log in to the controller node from the Fuel-master node:

1. Verify the status of cinder-volume service for Kaminario backend

   .. code-block:: console
   
      $ cinder service-list

   .. image:: ./images/service_list.png
      :width: 400pt
      :alt: service_list



2. Create a volume. Verify the volume and volume group from the Kaminario K2 all-flash array dashboard.

   .. code-block:: console

      $ cinder create --name volume 1

   .. image:: ./images/cinder_create_success.png
      :width: 400pt
      :alt: cinder_create_success

   .. image:: ./images/iscsi_dashboard.png
      :width: 400pt
      :alt: iscsi_dashboard

*Note:* The volume name is **cv-<cinder-volume-id>** and volume group name is **cvg-<cinder-volume-id>**.

3. Run the OpenStack Test Framework (OSTF). From the Fuel web UI:

	* Click the **Health Check** tab
        * Select the **Select All** checkbox
        * Click **Run Tests**.

	*Note:* The Kaminario Fuel plugin verification is mainly based on the Functional tests.


Troubleshooting
===============

On failure of the verification of Kaminario Fuel plugin or any Cinder volume operations related to the Kaminario backend, check the following log files to identify the root cause of the failure:

#. **/var/log/cinder/cinder-volume.log**
#. **/var/log/cinder/cinder-api.log**
#. **/var/log/cinder/cinder-scheduler.log**
#. **/var/log/nova/nova-compute.log**

Check the status of cinder volume service for Kaminario K2 backend.

   .. code-block:: console

      $ cinder service-list

   .. image:: ./images/cinder_service_list.png
      :width: 400pt
      :alt: cinder_service_list

The failures may be caused due to many causes, the following are few of them:

1. Kaminario rest-api version is lower than 2.2.0.
2. Kaminario K2 all-flash array version is lower than 5.8.
3. Data path between the Fuel nodes (having cinder and compute role) and the Kaminario K2 all-flash array is not present or inaccessible:

   .. image:: ./images/FC_HBA.png
      :width: 400pt
      :alt: FC_HBA

   .. image:: ./images/volume_attach.png
      :width: 400pt
      :alt: volume_attach

   .. image:: ./images/wwn_wrong.png
      :width: 400pt
      :alt: wwn_wrong



4. Management IP of the Kaminario backend is not correct or inaccessible from the Fuel node having the Cinder role.
5. Wrong credentials (username and password) used for the Kaminario backend.
6. Improper configuration of the Kaminario Fuel plugin configuration options for; creating volume type and setting default volume type.
7. Improper use of Kaminario Fuel plugin configuration options like Filter Function, Goodness Function, Scheduler weighers and Scheduler filters.
8. Others.
