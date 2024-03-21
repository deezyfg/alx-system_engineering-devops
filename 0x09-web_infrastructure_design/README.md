# 0x09. Web infrastructure design 

This repository comprises links to diagrams illustrating web infrastructures. Its primary objective is to provide a high-level understanding of how web infrastructures are structured and the components they entail.
Functioning as a thorough guide to web infrastructure design, this repository offers extensive coverage of its components, fundamental principles, and best practices. It offers invaluable insights to aid in the development of web systems that prioritize scalability, security, and uninterrupted availability.

---

## Table Of Contents

1. [Concepts](#concepts)
    - [DNS](#dns)
    - [Monitoring](#monitoring)
    - [Web Server](#web-server)
    - [Network basics](#network-basics)
    - [Load balancer](#load-balancer)
    - [Server](#server)
2. [Resources](#resources)
3. [Learning Objectives](#learning-objectives)
4. [Requirements](#requirements)
5. [Tasks](#tasks)
6. [Infrastructure Designs](#infrastructure-designs)
    - [Simple Web Stack Infrastructure Design](#simple-web-stack-infrastructure-design)
    - [Distributed Web Infrastructure Design](#distributed-web-infrastructure-design)
    - [Secured and Monitored Web Infrastructure Design](#secured-and-monitored-web-infrastructure-design)
    - [Scale Up Infrastructure Design](#scale-up-infrastructure-design)
     
---

## Concepts

For this project, we expect you to look at these concepts:

<details id="dns">
  <summary><a href="#dns"><strong>DNS</strong></a></summary><br>

  <!-- Image -->
  <div align="center">
    <a href='https://postimages.org/' target='_blank'>
      <img src='https://i.postimg.cc/KvyYPJ8z/DNS.png' border='0' alt='image' style="max-width: 100%;">
    </a>
  </div>

  <!-- Links for Screenshot -->
  <ul>
    <li><strong>Links from screenshot</strong>
      <ul>
        <li><a href="https://howdns.works/" title="Learn everything about DNS in cartoon">Learn everything about DNS in cartoon</a></li>
        <li><a href="https://support.dnsimple.com/articles/a-record/" title="A Record">A Record</a></li>
        <li><a href="https://en.wikipedia.org/wiki/CNAME_record" title="CNAME Record">CNAME Record</a></li>
        <li><a href="https://en.wikipedia.org/wiki/MX_record" title="MX Record">MX Record</a></li>
        <li><a href="https://en.wikipedia.org/wiki/TXT_record" title="TXT Record">TXT Record</a></li>
        <li><a href="https://www.dnsknowledge.com/whatis/round-robin-dns/" title="Use DNS to scale with round-robin DNS">Use DNS to scale with round-robin DNS</a></li>
        <li><a href="https://support.dnsimple.com/articles/ns-record/" title="What’s an NS Record?">What’s an NS Record?</a></li>
        <li><a href="https://support.dnsimple.com/articles/soa-record/" title="What’s an SOA Record?">What’s an SOA Record?</a></li>
        <li><a href="https://serverfault.com/questions/145777/what-s-the-point-in-having-www-in-a-url" title=" What’s the point in having www in a url?"> What’s the point in having www in a url?</a></li>   
      </ul>
    </li>
  </ul>
</details>


<details id="monitoring">
  <summary><a href="#monitoring"><strong>Monitoring</strong></a></summary><br>

  <!-- Image -->
  <div align="center">
    <a href='https://postimages.org/' target='_blank'>
      <img src='https://i.postimg.cc/kXCzChcW/Monitoring.png' border='0' alt='image' style="max-width: 100%;">
    </a>
  </div>
</details>


<details id="web-server">
  <summary><a href="#web-server"><strong>Web Server</strong></a></summary><br>

  <!-- Image -->
  <div align="center">
    <a href='https://postimages.org/' target='_blank'>
      <img src='https://i.postimg.cc/FskGkbHD/Web-Server.png' border='0' alt='image' style="max-width: 100%;">
    </a>
  </div>

  <!-- Links for Screenshot -->
  <ul>
    <li><strong>Links from screenshot</strong>
      <ul>
        <li><a href="https://en.wikipedia.org/wiki/Virtual_machine" title="Virtual Machine">Virtual Machine</a></li>
        <li><a href="https://www.cio.com/article/247005/what-are-containers-and-why-do-you-need-them.html" title="What are containers and why do you need them?">What are containers and why do you need them?</a></li>
        <li><a href="https://en.wikipedia.org/wiki/Web_server" title="Wikipedia page about web server">Wikipedia page about web server</a></li>
        <li><a href="https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Web_mechanics/What_is_a_web_server" title="Web server">Web server</a></li>
        <li><a href="https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Web_mechanics/What_is_a_web_server" title="What is a Web Server?">What is a Web Server?</a></li>
      </ul>
    </li>
  </ul>
</details>


<details id="network-basics">
  <summary><a href="#network-basics"><strong>Network basics</strong></a></summary><br>

  <!-- Image -->
  <div align="center">
    <a href='https://postimages.org/' target='_blank'>
      <img src='https://i.postimg.cc/50tS6K7N/Network-Basics.png' border='0' alt='image' style="max-width: 100%;">
    </a>
  </div>

  <!-- Links for Screenshot -->
  <ul>
    <li><strong>Links from screenshot</strong>
      <ul>
        <li><a href="https://www.techtarget.com/searchnetworking/definition/protocol" title="What is a protocol">What is a protocol</a></li>
        <li><a href="https://computer.howstuffworks.com/internet/basics/what-is-an-ip-address.htm" title="What is an IP address">What is an IP address</a></li>
        <li><a href="https://www.avast.com/c-what-is-tcp-ip#" title="What is TCP/IP">What is TCP/IP</a></li>
        <li><a href="https://www.lifewire.com/port-numbers-on-computer-networks-817939" title="What is an Internet Protocol (IP) port?">What is an Internet Protocol (IP) port?</a></li>
      </ul>
    </li>
  </ul>
</details>


<details id="load-balancer">
  <summary><a href="#load-balancer"><strong>Load balancer</strong></a></summary><br>

  <!-- Image -->
  <div align="center">
    <a href='https://postimages.org/' target='_blank'>
      <img src='https://i.postimg.cc/Y0mzMG0p/Load-Balancer.png' border='0' alt='image' style="max-width: 100%;">
    </a>
  </div>

  <!-- Links for Screenshot -->
  <ul>
    <li><strong>Links from screenshot</strong>
      <ul>
        <li><a href="https://www.thegeekstuff.com/2016/01/load-balancer-intro/" title="Load-balancing">Load-balancing</a></li>
        <li><a href="https://community.f5.com/kb/technicalarticles/intro-to-load-balancing-for-developers-%E2%80%93-the-algorithms/273759" title="Load-balancing algorithms">Load-balancing algorithms</a></li>
      </ul>
    </li>
  </ul>
</details>


<details id="server">
  <summary><a href="#server"><strong>Server</strong></a></summary><br>

  <!-- Image -->
  <div align="center">
    <a href='https://postimages.org/' target='_blank'>
      <img src='https://i.postimg.cc/N0DckLgf/Server.png' border='0' alt='image' style="max-width: 100%;">
    </a>
  </div>

  <!-- Links for Screenshot -->
  <ul>
    <li><strong>Links from screenshot</strong>
      <ul>
        <li><a href="https://en.wikipedia.org/wiki/Server_(computing)#Hardware_requirement" title="What is a server">What is a server(computing)</a></li>
        <li><a href="https://www.youtube.com/watch?v=B1ANfsDyjeA" title="What is a server">What is a server.</a></li>
        <li><a href="https://www.youtube.com/watch?v=iuqXFC_qIvA&t=33s" title="Where are servers hosted (data centers)">Where are servers hosted (data centers)</a></li>
      </ul>
    </li>
  </ul>
</details>

---

## Resource

- [Web Infrastructure](https://youtu.be/lQNEW76KdYg)
- [What is a database](https://searchdatamanagement.techtarget.com/definition/database)
- [What’s the difference between a web server and an app server?](https://www.youtube.com/watch?v=S97eKyv2b9M)
- [DNS record types](https://pressable.com/?s=DNS&post_type=knowledgebase)
- [Single point of failure](https://en.wikipedia.org/wiki/Single_point_of_failure)
- [How to avoid downtime when deploying new code](https://softwareengineering.stackexchange.com/questions/35063/how-do-you-update-your-production-codebase-database-schema-without-causing-downt#answers-header)
- [High availability cluster (active-active/active-passive)](https://docs.oracle.com/cd/E17904_01/core.1111/e10106/intro.htm#ASHIA712)
- [What is HTTPS](https://www.instantssl.com/http-vs-https)
- [What is a firewall](https://www.webopedia.com/definitions/firewall/)
- [Load Balancing Algorithms and Techniques](https://kemptechnologies.com/load-balancer/load-balancing-algorithms-techniques/)
- [Active/Passive vs. Active/Active](https://kemptechnologies.com/fr/white-papers/unfog-confusion-active-passive-activeactive-load-balancing/)

## Learning Objectives

At the end of this project, you are expected to be able to [explain to anyone](https://fs.blog/feynman-learning-technique/), **without the help of Google**:

### General

* You must be able to draw a diagram covering the web stack you built with the sysadmin/devops track projects
* You must be able to explain what each component is doing
* You must be able to explain system redundancy
* Know all the mentioned acronyms: LAMP, SPOF, QPS

## Requirements

### General

* A `README.md` file, at the root of the folder of the project, is mandatory
* For each task, once you are done whiteboarding (on a whiteboard, piece of paper or software or your choice), take a picture/screenshot of your diagram
* This project will be manually reviewed:
* As each task is completed, the name of that task will turn green
* Upload a screenshot, showing that you completed the required levels, to any image hosting service (I personally use [imgur](https://imgur.com/) but feel free to use anything you want).
* For the following tasks, insert the link from of your screenshot into the answer file
* After pushing your answer file to GitHub, insert the GitHub file link into the URL box
* You will also have to whiteboard each task in front of a mentor, staff or student - no computer or notes will be allowed during the whiteboarding session
* Focus on what you are being asked:
* Cover what the requirements mention, we will explore details in a later project
* Keep in mind that you will have 30 minutes to perform the exercise, you will get points for what is asked in requirements
* Similarly in a job interview, you should answer what the interviewer asked for, be careful about being too verbose - always ask the interviewer if going into details is necessary - speaking too much can play against you
* In this project, again, avoid going in details if not asked

## Tasks

<details>
<summary><a href="./0-simple_web_stack.jpg">0. Simple web stack</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/jdk2SN17/image.png' border='0' alt='image'/></a>
<ul>
  <li>Links from screenshot
  <ul>
      <li><a href="https://en.wikipedia.org/wiki/LAMP_%28software_bundle%29">LAMP stack</a></li>
  </ul>
  </li>
</ul>
</details>

<details>
<summary><a href="./1-distributed_web_infrastructure.jpg">1. Distributed web infrastructure</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/MTwSdKn5/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary><a href="./2-secured_and_monitored_web_infrastructure.jpg">2. Secured and monitored web infrastructure</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/KYsZdtCJ/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary><a href="./3-scale_up.jpg">3. Scale up</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/13ndnc2x/image.png' border='0' alt='image'/></a>
<ul>
  <li>Links from screenshot
  <ul>
      <li><a href="https://www.nginx.com/resources/glossary/application-server-vs-web-server/">Application server vs web server</a></li>
  </ul>
  </li>
</ul>
</details>

---

## Infrastructure Designs

<details>
  <summary><strong><a href="#simple-web-stack-infrastructure-design">Simple Web Stack Infrastructure Design</a></strong></summary>

## Infrastructure Diagram

![Infrastructure Diagram](https://imgur.com/AnVFiU4.png)

---

## Explanation of Specifics

### What is a server

- **Explanation:** A server is a computer system or program that provides functionality for other programs or devices, known as clients.

### What is the role of the domain name

- **Explanation:** A domain name is a human-readable label that is used to identify and locate resources on the internet. It serves as the address for websites, allowing users to access them using familiar and easy-to-remember names instead of numerical IP addresses.

### What type of DNS record `www` is in `www.foobar.com`

- **Explanation:** The DNS record for www.foobar.com is a CNAME (Canonical Name) record. It aliases the www subdomain to the main domain foobar.com, allowing the website to be accessed using both www and non-www versions of the domain.

### What is the role of the web server

- **Explanation:** The web server's role is to handle HTTP requests from clients and serve web content, such as HTML files, images, and CSS stylesheets. 

### What is the role of the application server

- **Explanation:** The application server hosts the application codebase and is responsible for processing business logic, executing application code, and generating dynamic content by executing server-side code such as JSP, Ajax,
PHP, etc. in response to client requests. It communicates with the web server to fulfill user requests.

### What is the role of the database

- **Explanation:** The database stores and manages the data required by the application. It serves as a persistent storage mechanism for storing user data, application settings, and other information.

### What is the server using to communicate with the computer of the user requesting the website

- **Explanation:** The server communicates with users' computers over the internet using the HTTP (Hypertext Transfer Protocol) or HTTPS (HTTP Secure) protocols. When a user requests a website, their browser sends an HTTP request to the server, which responds with the requested web content.

## Identified Issues

### Single Point of Failure (SPOF):

- **Issue:** The current infrastructure is vulnerable to a Single Point of Failure (SPOF), meaning that if the server experiences a failure, the entire website becomes inaccessible. This lack of redundancy poses a significant risk, potentially resulting in extended periods of downtime and hindering user access to the website.

### Downtime when maintenance needed (like deploying new code web server needs to be restarted):

- **Issue:** The downtime period might exceed expectations because the server relies on a single codebase that may not be available at that time. Users may encounter interruptions or delays when accessing the website during maintenance activities.

### Cannot scale if too much incoming traffic:

- **Issue:** The infrastructure may encounter difficulty in effectively managing increased traffic, especially during peak periods or sudden surges. This is because the domain name directs traffic directly to the server without utilizing a load balancer, which would help distribute the load. Consequently, the high volume of users accessing the website's content could result in a suboptimal user experience or restrict the website's capacity to accommodate users.

</details>


<details>
  <summary><strong><a href="#distributed-web-infrastructure-design">Distributed Web Infrastructure Design</a></strong></summary>

## Infrastructure Diagram

![Infrastructure Diagram](https://imgur.com/zSxgNzf.png)

---

## Explanation of Specifics

### For every additional element, why you are adding it

- **Explanation:** The addition of a new server allows for the integration of a load balancer to manage high incoming traffic. It also eliminates the risk of a single point of failure inherent in having only one server.

### What distribution algorithm your load balancer is configured with and how it
works

- **Explanation:**  Our load balancer uses the Round Robin algorithm, distributing requests sequentially among servers unless a server is offline. Requests are served in order, starting from the first server after reaching the last. This algorithm is suitable when servers share equal specifications and persistent connections are limited.

### Is your load-balancer enabling an Active-Active or Active-Passive setup, explain the difference between both

- **Explanation:** The load balancer is configured for an Active-Active setup, where both nodes (servers) actively provide the same type of service simultaneously.  This differs from an Active-Passive setup, where not all nodes are active. In the case of two nodes, if the first node is already active, the second node must be passive or on standby. The key difference between these two architectures is performance. Active-active clusters give you access to the resources of all your servers during normal operation. In an active-passive cluster, the backup server only sees action during failover events.

### How a database Primary-Replica (Master-Slave) cluster works

- **Explanation:** The Primary-Replica (Master-Slave) replication enables data from a primary database server (the master) to be duplicated onto one or more other database servers (the replicas). Updates made on the master propagate to the replicas. Synchronous replication occurs when changes are applied to both the master and replica simultaneously, while asynchronous replication involves queuing changes to be written later. This setup enhances scalability by distributing read access across multiple servers and can also serve purposes like failover and data analysis.

### What is the difference between the Primary node and the Replica node in regard to the application

- **Explanation:** A primary node contains the original instance of the application, while a replica node is a duplicate of the primary node designed to provide redundant copies of the application codebase. These redundant copies safeguard against hardware failures and enhance capacity for serving read requests, such as document retrieval or searching.

## Identified Issues

### Single Point of Failure (SPOF):

- **Issue:** The infrastructure's primary vulnerability lies in its reliance on a single load balancer, posing a significant risk to service availability in the event of load balancer failure.

### Security issues (no firewall, no HTTPS)

- **Issue:** Security concerns arise from the application's communication over the insecure HTTP protocol, potentially exposing sensitive information to attackers. Additionally, the absence of a firewall leaves the system vulnerable to denial-of-service attacks and unauthorized access through open ports, leading to potential data breaches.

### No Monitoring:

- **Issue:** "You cannot fix or improve what you cannot measure" is a well-known saying in the tech industry. The absence of monitoring prevents the timely identification and resolution of problems, downtime, or security threats. Implementing monitoring tools enables proactive maintenance, enhances productivity, and improves the overall user experience.
---

## References
- [How does Software and Hardware Load Balancer Work? (Loadbalancer Algorithms Explained with Examples)](https://www.thegeekstuff.com/2016/01/load-balancer-intro/)
- [MySQL Master-Slave Replication on the Same Machine](https://www.toptal.com/mysql/mysql-master-slave-replication-tutorial)
- [What Is Active-Active Clustering](https://www.purestorage.com/au/knowledge/what-is-active-active.html)

</details>


<details>
  <summary><strong><a href="#secured-and-monitored-web-infrastructure-design">Secured and Monitored Web Infrastructure Design</a></strong></summary>

## Infrastructure Diagram

![Infrastructure Diagram](https://imgur.com/7koKeee.png)

---

## Explanation of Specifics

### For every additional element, why you are adding it

- **Explanation:** Three new components have been added: a firewall for each server to protect against potential attacks and exploitation, an SSL certificate for serving www.foobar.com over HTTPS, and three monitoring clients responsible for collecting logs and sending them to our data collector, Sumologic.

### What are firewalls for

- **Explanation:** A firewall is a network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules. It acts as a barrier between a trusted network and an untrusted network.

### Why is the traffic served over HTTPS

- **Explanation:** Traffic is now served over HTTPS instead of HTTP to ensure security. Unlike HTTP, which transfers data in plain text, HTTPS encrypts data using Transport Layer Security (TLS), thereby enhancing security.

### What monitoring is used for

- **Explanation:** Monitoring facilitates the proactive detection and diagnosis of web application performance issues, allowing for timely resolution.

### How the monitoring tool is collecting data

- **Explanation:** The monitoring tool collects logs from the application server, MySQL Database, and Nginx web server. In computing, logs are automatically generated and time-stamped records of events relevant to a specific system.

### Explain what to do if you want to monitor your web server QPS

- **Explanation:** To monitor web server QPS (Queries Per Second), network and application-level monitoring would be employed, especially considering that one web server handles 1K queries per second.

## Identified Issues

### Why terminating SSL at the load balancer level is an issue

- **Issue:** Terminating SSL at the load balancer level can be resource and CPU intensive due to decryption processes.  While this approach offloads decryption burden from servers, it may strain load balancer resources. However, the specific issue regarding this setup is currently unclear and requires further investigation.

### Why having only one MySQL server capable of accepting writes is an issue

- **Issue:** Relying on a single MySQL server for write operations poses a risk of downtime and data loss. If this server goes down, the application features requiring write access will be affected, potentially leading to service disruptions.

### Why having servers with all the same components (database, web server and
application server) might be a problem

- **Issue:** Having servers with identical components (database, web server, and application server) may lead to issues. If a bug arises in one component of a server, it would likely affect other servers as well, posing a challenge for maintaining system stability and integrity.

</details>


<details>
  <summary><strong><a href="#scale-up-infrastructure-design">Scale Up Infrastructure Design</a></strong></summary>

## Infrastructure Diagram

![Infrastructure Diagram](https://imgur.com/3oUL6KV.png)

---

## Explanation of Specifics

### For every additional element, why you are adding it

- **Explanation:** We have added one server and one load balancer. The addition of the new server allows for the separation of each component (web server: Nginx, application server: code base, and database: MySQL) onto separate servers, while also maintaining an extra server with all components to act as a backup in case of any component or server failure. Each server is equipped with monitoring capabilities and a firewall to ensure system security. Moreover, the addition of an extra load balancer assists in efficiently handling increased traffic across the entire infrastructure.

</details>

---

## Author

[Peter Opoku-Mensah](https://github.com/deezyfg/)