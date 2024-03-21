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

---

## Concepts

For this project, we expect you to look at these concepts:

<details>
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


<details>
  <summary><a href="#monitoring"><strong>Monitoring</strong></a></summary><br>

  <!-- Image -->
  <div align="center">
    <a href='https://postimages.org/' target='_blank'>
      <img src='https://i.postimg.cc/kXCzChcW/Monitoring.png' border='0' alt='image' style="max-width: 100%;">
    </a>
  </div>
</details>


<details>
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


<details>
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


<details>
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


<details>
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

## Author

[Peter Opoku-Mensah](https://github.com/deezyfg/)