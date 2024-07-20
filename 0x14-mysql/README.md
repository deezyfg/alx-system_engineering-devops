# 0x14. MySQL

## Concepts

For this project, we expect you to look at this concept:

<details>
  <summary><strong>How to Fresh Reset and Install MySQL 5.7</strong></summary><br>

  <!-- Images -->
  <div align="center">
    <a href='https://postimages.org/' target='_blank'>
      <img src='https://i.postimg.cc/L559tXDF/image1.png' alt='Screenshot 1' style="max-width: 100%;">
      <img src='https://i.postimg.cc/tTXCgDVT/image2.png' alt='Screenshot 2' style="max-width: 100%;">
    </a>
  </div>

  <!-- Links for Screenshots -->
  <ul>
    <li><strong>Links from screenshots:</strong>
      <ul>
        <li><a href="https://docs.google.com/document/d/1btVRofXP75Cj90_xq2x8AmzuMPOKq6D_Dt_SCDD6GrU/edit" target="_blank">For a comprehensive guide, click here 📄</a></li>
      </ul>
    </li>
  </ul>
</details>


<details>
  <summary><strong>Database Administration</strong></summary><br>

  <ul>
    <li><a href="https://www.techtarget.com/searchdatamanagement/definition/database">What is a database</a></li>
    <li><a href="https://www.digitalocean.com/community/tutorials/how-to-choose-a-redundancy-plan-to-ensure-high-availability#sql-replication">What is a database primary/replicate cluster</a></li>
    <li><a href="https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql">MySQL primary/replicate setup</a></li>
    <li><a href="https://www.databasejournal.com/ms-sql/developing-a-sql-server-backup-strategy/">Build a robust database backup strategy</a></li>
  </ul>
</details>


<details>
<summary><strong>Web stack debugging</strong></summary><br>
<ul>
  <li>
    <h2>Intro</h2>
    <ul>
      <li>Debugging usually takes a big chunk of a software engineer’s time. The art of debugging is tough and it takes years, even decades to master, and that is why seasoned software engineers are the best at it… experience. They have seen lots of broken code, buggy systems, weird edge cases and race conditions.</li>
    </ul>
    <p align="center">
      <a href="https://postimages.org">
        <img src="https://i.postimg.cc/mgZwcKpR/image.png">
      </a>
    </p>
  </li>
</ul>

<h2>Non-exhaustive guide to debugging</h2>

<h3>School specific</h3>
<p>If you are struggling to get something right that is run on the checker, like a Bash script or a piece of code, keep in mind that you can simulate the flow by starting a Docker container with the distribution that is specified in the requirements and by running your code. Check the <strong>Docker</strong> concept page for more info.</p>


<details>
<summary>Test and verify your assumptions</summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/rFMtkCt8/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary>Get a quick overview of the machine state</summary><br>
<a href="https://www.youtube.com/watch?v=1_gqlbADaAw&feature=youtu.be">Youtube video First 5 Commands When I Connect on a Linux Server</a>
<p>When you connect to a server/machine/computer/container you want to understand what’s happened recently and what’s happening now, and you can do this with <a href="https://www.linux.com/training-tutorials/first-5-commands-when-i-connect-linux-server/">5 commands</a> in a minute or less:</p>

<h3><code>w</code></h3>
<ul>
  <li>Shows server <a href="https://www.techtarget.com/whatis/definition/uptime-and-downtime">uptime</a> which is the time during which the server has been continuously running</li>
  <li>Shows which users are connected to the server</li>
  <li>Load average will give you a good sense of the server health - (read more about load <a href="https://scoutapm.com/blog/understanding-load-averages">here</a> and <a href="https://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html">here</a>)</li>
</ul>

<h3><code>history</code></h3>
<ul>
  <li>Shows which commands were previously run by the user you are currently connected to</li>
  <li>You can learn a lot about what type of work was previously performed on the machine, and what could have gone wrong with it</li>
  <li>Where you might want to start your debugging work</li>
</ul>

<h3><code>top</code></h3>
<ul>
  <li>Shows what is currently running on this server</li>
  <li>Order results by CPU, memory utilization and catch the ones that are resource intensive</li>
</ul>

<h3><code>df</code></h3>
<ul>
  <li>Shows disk utilization</li>
</ul>

<h3><code>netstat</code></h3>
<ul>
  <li>What port and IP your server is listening on</li>
  <li>What processes are using sockets</li>
  <li>Try netstat -lpn on a Ubuntu machine</li>
</ul>
</details>

<details>
<summary>Machine</summary><br>
<p>Debugging is pretty much about verifying assumptions, in a perfect world the software or system we are working on would be working perfectly, the server is in perfect shape and everybody is happy. But actually, it NEVER goes this way, things ALWAYS fail (it’s tremendous!).</p>

<p>For the machine level, you want to ask yourself these questions:</p>
<ul>
  <li>Does the server have free disk space? - <strong><code>df</code></strong></li>
  <li>Is the server able to keep up with CPU load? - <strong><code>w</code></strong>, <strong><code>top</code></strong>, <strong><code>ps</code></strong></li>
  <li>Does the server have available memory? <strong><code>free</code></strong></li>
  <li>Are the server disk(s) able to keep up with read/write IO? - <strong><code>htop</code></strong></li>
</ul>

<p>If the answer is <strong>no</strong> for any of these questions, then that might be the reason why things are not going as expected. There are often 3 ways of solving the issue:</p>

<ul>
  <li>Free up resources (stop process(es) or reduce their resource consumption)</li>
  <li>Increase the machine resources (adding memory, CPU, disk space…)</li>
  <li>Distributing the resource usage to other machines</li>
</ul>
</details>

<details>
<summary>Network issue</summary><br>
<p>For the machine level, you want to ask yourself these questions:</p>

<ul>
  <li>Does the server have the expected network interfaces and IPs up and running? <strong><code>ifconfig</code></strong></li>
  <li>Does the server listen on the sockets that it is supposed to? <strong><code>netstat</code></strong> (<strong><code>netstat -lpd</code></strong> or <strong><code>netstat -lpn</code></strong>)</li>
  <li>Can you connect from the location you want to connect from, to the socket you want to connect to? <strong><code>telnet</code></strong> to the IP + PORT (<strong><code>telnet 8.8.8.8 80</code></strong>)</li>
  <li>Does the server have the correct firewall rules? <strong><code>iptables</code></strong>, <strong><code>ufw</code></strong>:
    <ul>
      <li><strong><code>iptables -L</code></strong></li>
      <li><strong><code>sudo ufw status</code></strong></li>
    </ul>
  </li>
</ul>
</details>

<details>
<summary>Process issue</summary><br>
<p>If a piece of Software isn’t behaving as expected, it can obviously be because of above reasons… but the good news is that there is more to look into (there is ALWAYS more to look into actually).</p>

<ul>
  <li>Is the software started? <strong><code>init</code></strong>, <strong><code>init.d</code></strong>:
    <ul>
      <li><strong><code>service NAME_OF_THE_SERVICE status</code></strong></li>
      <li><strong><code>/etc/init.d/NAME_OF_THE_SERVICE status</code></strong></li>
    </ul>
  </li>
  <li>Is the software process running? <strong><code>pgrep</code></strong>, <strong><code>ps</code></strong>:
    <ul>
      <li><strong><code>pgrep -lf NAME_OF_THE_PROCESS</code></strong></li>
      <li><strong><code>ps auxf</code></strong></li>
    </ul>
  </li>
  <li>Is there anything interesting in the logs? look for log files in <strong><code>/var/log/</code></strong> and <strong><code>tail -f</code></strong> is your friend</li>
</ul>
</details>

<details>
<summary>Debugging is fun</summary><br>
<p>Debugging can be frustrating, but it will definitely be part of your job, it requires experience and methodology to become good at it. The good news is that bugs are never going away, and the more experienced you become, trickier bugs will be assigned to you! Good luck 😃</p>

<img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/bae58c9f066a9668001ef4b4c39778407439d2f9.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20240513%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240513T085722Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=6bcafa53b6ddc122890f91e949dcbeb33b676be3ca05094194c30fe9a661779b">
</details>

</details>

<p align="center">
  <img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/280/KkrkDHT.png"/>
</p>

## Resources

**Read or watch:**

* [What is a primary-replica cluster](https://www.digitalocean.com/community/tutorials/how-to-choose-a-redundancy-plan-to-ensure-high-availability#sql-replication)
* [MySQL primary replica setup](https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql)
* [Build a robust database backup strategy](https://www.databasejournal.com/ms-sql/developing-a-sql-server-backup-strategy/)
* [Signature Checking Using GnuPG](https://dev.mysql.com/doc/refman/5.7/en/checking-gpg-signature.html)

**man or help:**

* `mysqldump`

## Learning Objectives

At the end of this project, you are expected to be able to [explain to anyone](https://fs.blog/feynman-learning-technique/), **without the help of Google:**

### General

* What is the main role of a database
* What is a database replica
* What is the purpose of a database replica
* Why database backups need to be stored in different physical locations
* What operation should you regularly perform to make sure that your database backup strategy actually works


## Requirements

### General

* Allowed editors: `vi`, `vim`, `emacs`
* All your files will be interpreted on Ubuntu 16.04 LTS
* All your files should end with a new line
* A `README.md` file, at the root of the folder of the project, is mandatory
* All your Bash script files must be executable
* Your Bash script must pass `Shellcheck` (version `0.3.7-5~ubuntu16.04.1` via `apt-get`) without any error
* The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
* The second line of all your Bash scripts should be a comment explaining what is the script doing

## Mandatory Tasks

### 0. Install MySQL

First things first, let’s get MySQL installed on **both** your `web-01` and `web-02` servers.

* MySQL distribution must be `5.7.x`
* Make sure that **task #3** of your **SSH project** is completed for `web-01` and `web-02`. The checker will connect to your servers to check MySQL status
* Please make sure you have your `README.md` pushed to GitHub.

Example:
```
ubuntu@229-web-01:~$ mysql --version
mysql  Ver 14.14 Distrib 5.7.25, for Linux (x86_64) using  EditLine wrapper
ubuntu@229-web-01:~$
```
 
### 1. Let us in!

In order for us to verify that your servers are properly configured, we need you to create a user and password for **both** MySQL databases which will allow the checker access to them.

* Create a MySQL user named `holberton_user` on both `web-01` and `web-02` with the host name set to `localhost` and the password `projectcorrection280hbtn`. This will allow us to access the replication status on both servers.
* Make sure that `holberton_user` has permission to check the primary/replica status of your databases.
* In addition to that, make sure that **task #3** of your **SSH project** is completed for `web-01` and `web-02`. **You will likely need to add the public key to `web-02` as you only added it to `web-01` for this project.** The checker will connect to your servers to check MySQL status

Example:
```
ubuntu@229-web-01:~$ mysql -uholberton_user -p -e "SHOW GRANTS FOR 'holberton_user'@'localhost'"
Enter password:
+-----------------------------------------------------------------+
| Grants for holberton_user@localhost                             |
+-----------------------------------------------------------------+
| GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost' |
+-----------------------------------------------------------------+
ubuntu@229-web-01:~$
```
 
## 2. If only you could see what I've seen with your eyes

In order for you to set up replication, you’ll need to have a database with at least one table and one row in your primary MySQL server (web-01) to replicate from.

* Create a database named `tyrell_corp`.
* Within the `tyrell_corp` database create a table named `nexus6` and add at least one entry to it.
* Make sure that `holberton_user` has `SELECT` permissions on your table so that we can check that the table exists and is not empty.

```
ubuntu@229-web-01:~$ mysql -uholberton_user -p -e "use tyrell_corp; select * from nexus6"
Enter password:
+----+-------+
| id | name  |
+----+-------+
|  1 | Leon  |
+----+-------+
ubuntu@229-web-01:~$
```
 
### 3. Quite an experience to live in fear, isn't it?

Before you get started with your primary-replica synchronization, you need one more thing in place. On your **primary** MySQL server (web-01), create a new user for the replica server.

* The name of the new user should be `replica_user`, with the host name set to `%`, and can have whatever password you’d like.
* `replica_user` must have the appropriate permissions to replicate your primary MySQL server.
* `holberton_user` will need SELECT privileges on the `mysql.user` table in order to check that `replica_user` was created with the correct permissions.
```
ubuntu@229-web-01:~$ mysql -uholberton_user -p -e 'SELECT user, Repl_slave_priv FROM mysql.user'
+------------------+-----------------+
| user             | Repl_slave_priv |
+------------------+-----------------+
| root             | Y               |
| mysql.session    | N               |
| mysql.sys        | N               |
| debian-sys-maint | Y               |
| holberton_user   | N               |
| replica_user     | Y               |
+------------------+-----------------+
ubuntu@229-web-01:~$
```

### 4. Setup a Primary-Replica infrastructure using MySQL

Having a replica member on for your MySQL database has 2 advantages:

* Redundancy: If you lose one of the database servers, you will still have another working one and a copy of your data
* Load distribution: You can split the read operations between the 2 servers, reducing the load on the primary member and improving query response speed

#### Requirements:

* MySQL primary must be hosted on `web-01` - do not use the `bind-address`, just comment out this parameter
* MySQL replica must be hosted on `web-02`
* Setup replication for the MySQL database named `tyrell_corp`
* Provide your MySQL primary configuration as answer file(`my.cnf` or `mysqld.cnf`) with the name `4-mysql_configuration_primary`
* Provide your MySQL replica configuration as an answer file with the name `4-mysql_configuration_replica`

#### Tips:

* Once MySQL replication is setup, add a new record in your table via MySQL on `web-01` and check if the record has been replicated in MySQL `web-02`. If you see it, it means your replication is working!
* **Make sure that UFW is allowing connections on port 3306 (default MySQL port) otherwise replication will not work.**

Example:

**`web-01`**

```
ubuntu@web-01:~$ mysql -uholberton_user -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1467
Server version: 5.5.49-0ubuntu0.14.04.1-log (Ubuntu)

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show master status;
+------------------+----------+--------------------+------------------+
| File             | Position | Binlog_Do_DB       | Binlog_Ignore_DB |
+------------------+----------+--------------------+------------------+
| mysql-bin.000009 |      107 | tyrell_corp          |                  |
+------------------+----------+--------------------+------------------+
1 row in set (0.00 sec)

mysql>
```

**`web-02`**

```
root@web-02:/home/ubuntu# mysql -uholberton_user -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 53
Server version: 5.5.49-0ubuntu0.14.04.1-log (Ubuntu)

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show slave status\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 158.69.68.78
                  Master_User: replica_user
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysql-bin.000009
          Read_Master_Log_Pos: 107
               Relay_Log_File: mysql-relay-bin.000022
                Relay_Log_Pos: 253
        Relay_Master_Log_File: mysql-bin.000009
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 107
              Relay_Log_Space: 452
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 1
1 row in set (0.00 sec)

mysql> 
```

**File:** [4-mysql_configuration_primary](4-mysql_configuration_primary), [4-mysql_configuration_replica](4-mysql_configuration_replica)

### 5. MySQL backup

What if the data center where both your primary and replica database servers are hosted are down because of a power outage or even worse: flooding, fire? Then all your data would inaccessible or lost. That’s why you want to backup and store them in a different system in another physical location. This can be achieved by dumping your MySQL data, compressing them and storing them in a different data center.

Write a Bash script that generates a MySQL dump and creates a compressed archive out of it.

Requirements:

* The MySQL dump must contain all your MySQL databases
* The MySQL dump must be named `backup.sql`
* The MySQL dump file has to be compressed to a `tar.gz` archive
* This archive must have the following name format: `day-month-year.tar.gz`
* The user to connect to the MySQL database must be `root`
* The Bash script accepts one argument that is the password used to connect to the MySQL database

Example:
```
ubuntu@03-web-01:~$ ls
5-mysql_backup
ubuntu@03-web-01:~$ ./5-mysql_backup mydummypassword
backup.sql
ubuntu@03-web-01:~$ ls
01-03-2017.tar.gz  5-mysql_backup  backup.sql
ubuntu@03-web-01:~$ more backup.sql
-- MySQL dump 10.13  Distrib 5.7.25, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database:
-- ------------------------------------------------------
-- Server version   5.7.25-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `tyrell_corp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tyrell_corp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tyrell_corp`;

--
-- Table structure for table `nexus6`
--

DROP TABLE IF EXISTS `nexus6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nexus6` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
ubuntu@03-web-01:~$
ubuntu@03-web-01:~$ file 01-03-2017.tar.gz
01-03-2017.tar.gz: gzip compressed data, from Unix, last modified: Wed Mar  1 23:38:09 2017
ubuntu@03-web-01:~$
```

**File:** [5-mysql_backup](5-mysql_backup)


---

# How To Go About With Task 4

## Introduction
This guide provides step-by-step instructions for **setting up MySQL Master-Slave replication** on two servers (`web01` as the master and `web02` as the slave). It includes both a detailed method and an alternative method for ease of use.

## Method 1: Detailed Method

### Setting Up the Master Server (`web01`)
**File:** [4-mysql_configuration_primary](4-mysql_configuration_primary)

1. Log into the master server `web02` via SSH.

2. Open the MySQL configuration file for editing on the primary server `web01`:
```
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
```

Add the following lines under `[mysqld]`:
```
binlog_do_db    = tyrell_corp
log_bin         = /var/log/mysql/mysql-bin.log
server-id       = 1
```

3. Restart MySQL to apply the changes:
```
sudo service mysql restart
```

4. Verify that MySQL is running:
```
sudo service mysql status
```

Press **`q`** to quit the status view.

5. Log into the MySQL prompt and enter the password when prompted to retrieve the binary log file name and position:
```
mysql -u root -p
```

6. Run the following command and note down the `File` and `Position` values:
```
SHOW MASTER STATUS;
```

**Example:**
```
* **File:** mysql-bin.000001
* **Position:** 154
```
This will be needed for the replica configuration.
 
7. Exit the MySQL prompt and the `web01` server:
```
exit
```


### Setting Up the Slave Server (`web02`)
**File:** [4-mysql_configuration_replica](4-mysql_configuration_replica)

1. Log into the replica server `web02` via SSH.

2. Open the MySQL configuration file for editing:
```
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
```

Add the following lines under [mysqld]:
```
binlog_do_db = tyrell_corp
relay-log = /var/log/mysql/mysql-relay-bin.log
log_bin = /var/log/mysql/mysql-bin.log
server-id = 2
```

3. Restart MySQL to apply the changes:
```
sudo service mysql restart
```

4. Verify that MySQL is running:
```
sudo service mysql status
```

Press **`q`** to quit the status view.

5. Log into the MySQL prompt and enter the password when prompted:
```
mysql -u root -p
```

6. Configure the replica settings using the `File` and `Position` values obtained from the master server (`web01`):
```
CHANGE MASTER TO
MASTER_HOST='insert your web-01 ip address',
MASTER_USER='replica_user',
MASTER_PASSWORD='insert your replication user password here',
MASTER_LOG_FILE='insert the value from SHOW MASTER STATUS',
MASTER_LOG_POS=insert the value from SHOW MASTER STATUS position;
```
Replace the placeholders with the actual values you retrieved from the master server's `SHOW MASTER STATUS` command.


##### Task-Specific Configuration:**
For this specific task, use the following configuration:
```
CHANGE MASTER TO 
MASTER_HOST='54.167.187.16',
MASTER_USER='replica_user',
MASTER_PASSWORD='projectcorrection280hbtn',
MASTER_LOG_FILE='mysql-bin.000001',
MASTER_LOG_POS=154;
```

7. Start the replication process:
```
START SLAVE;
```

8. Verify that the replication is running without errors:
```
SHOW SLAVE STATUS\G;
```

After this command is run, confirm that `Slave_IO_Running` and `Slave_SQL_Running` are set to `'Yes`' to indicate the replica is working properly.

9. Exit the MySQL prompt:
```
exit
```


#### Firewall Configuration for MySQL Access
Ensure that UFW (Uncomplicated Firewall) is allowing connections on port `3306` (default MySQL port) on both servers otherwise replication will not work.

##### On `web01`:
1. Check the current firewall rules to see if port 3306 is already allowed:
```
sudo ufw status
```
This command will display the status of ufw (Uncomplicated Firewall) and list all active rules. Look for any existing rule that allows traffic on port 3306.

2. Allow MySQL Port 3306 (If not allowed):
```
sudo ufw allow 3306
```

3.  Verify the New Rule after it has been successfully added:
```
sudo ufw status
```
You should now see a new entry allowing traffic on port 3306.

4. Exit the server once you've confirmed the firewall configuration:
```
exit
```

##### On `web02`:
1. Check the current firewall rules to see if port 3306 is already allowed:
```
sudo ufw status
```
This command will display the status of ufw (Uncomplicated Firewall) and list all active rules. Look for any existing rule that allows traffic on port 3306.

2. Allow MySQL Port 3306 (If not allowed):
```
sudo ufw allow 3306
```

3.  Verify the New Rule after it has been successfully added:
```
sudo ufw status
```
You should now see a new entry allowing traffic on port 3306.

4. Exit the server once you've confirmed the firewall configuration:
```
exit
```


#### Testing the MySQL Replication Setup
After configuring the master-slave replication, it's important to verify that everything is set up correctly. Follow these steps to test the configuration on the master server (`web01`) and slave server (`web02`):

##### On `web01`:
1. Connect to your `web01` server via SSH if you haven't already.
2. Once connected, access the MySQL server using the following command:
```
mysql -uholberton_user -p
```
3. When prompted, enter the password:
```
projectcorrection280hbtn
```
4. After successfully logging into MySQL, run the following command to view the master status:
```
SHOW MASTER STATUS;
```
5. Once you've verified the master status, exit the MySQL prompt:
```
exit
```

##### On `web02`:
1. Connect to your `web02` server via SSH if you haven't already.
2. Once connected, access the MySQL server using the following command:
```
mysql -uholberton_user -p
```
3. When prompted, enter the password:
```
projectcorrection280hbtn
```
4. After successfully logging into MySQL, run the following command to view the master status:
```
SHOW MASTER STATUS;
```
5. Once you've verified the master status, exit the MySQL prompt:
```
exit
```

---

## Method 2: Simplified Script-Based Method
### Master Server (`web01`)
1. Create a [setup_master](setup_master) file with its contents on the server to automate the process.

2. Make the script executable:
```
chmod +x setup_master
```

3. Execute the script with `sudo` privileges to apply configurations:
```
sudo ./setup_master
```

4. Log into the MySQL prompt and enter the password when prompted to retrieve the binary log file name and position:
```
mysql -u root -p
```

5. Run the following command and note down the `File` and `Position` values:
```
SHOW MASTER STATUS;
```

**Example:**
```
* **File:** mysql-bin.000001
* **Position:** 154
```
This will be needed for the replica configuration.
 
6. Exit the MySQL prompt and the `web01` server:
```
exit
```


### Slave Server (`web02`)
1. Create a [setup_slave](setup_slave) file with its contents on the server to automate the process.

2. Make the script executable:
```
chmod +x setup_slave
```

3. Execute the script with `sudo` privileges to apply configurations:
```
sudo ./setup_slave
```

4. Configure the replica settings using the `File` and `Position` values obtained from the master server (`web01`) as described in **Method 1.**

5. Start the replication process and verify the status as described in **Method 1.**

#### Testing the MySQL Replication Setup
Follow the testing steps described in **Method 1** to ensure the replication is working correctly.

---

## Author

* [Peter Opoku-Mensah](https://github.com/deezyfg)