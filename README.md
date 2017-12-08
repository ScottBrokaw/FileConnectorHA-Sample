# FileConnectorHA-Sample
This is a sample for a metyhod to have the File Connector stage within InfoSphere Information Server DataStage use the active Hadoop NameNode.

The concept is to use a simple shell script that determines the active NameNode and subsequently updates a DataStage Value File that a job can pickup and use at runtime.

If you had multiple value files, i.e. for each project, you could easily extend the script to update multiple value files at once.

Easiest way to ensure the script runs at approriate inverval is to place it into crontab

*/5 * * * * /home/dsadm/FindActiveNameNode.sh

For exampple, this runs every 5 minutes and updates the Value file.
