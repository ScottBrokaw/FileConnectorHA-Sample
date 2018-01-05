# FileConnectorHA-Sample
This is a sample for a method to have the File Connector stage within InfoSphere Information Server DataStage use the active Hadoop NameNode.

The concept is to use a simple shell script determine the active NameNode and subsequently updates a [DataStage Value File](http://www.ibm.com/support/docview.wss?uid=swg21610390) that a job can pickup and used at runtime.

If you had multiple value files, i.e. for each project, you could easily extend the script to update multiple value files at once.

Easiest way to ensure the script runs at approriate inverval is to place it into crontab

*/5 * * * * /home/dsadm/FindActiveNameNode.sh

For example, this runs every 5 minutes and updates the Value file.
