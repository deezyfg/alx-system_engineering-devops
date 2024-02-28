<center> <h1>0x08. Networking basics #1</h1> </center>

Building upon the foundational knowledge introduced in the previous project (0x07 - Networking basics), this project delves deeper into networking basics, emphasizing essential concepts such as localhost (127.0.0.1), understanding 0.0.0.0, hosts file configurations (/etc/hosts), and network interface display using commands like ifconfig and netcat. Through exploration of these topics, you'll enhance your understanding of network configurations and communication. Each script is crafted to address distinct challenges, contributing to a comprehensive exploration of networking fundamentals.

## Table Of Contents

1. [Resources](#resources)
2. [Learning Objectives](#learning-objectives)
3. [Prerequisites](#prerequisites)
4. [Outlined Project Tasks](outlined_project_tasks)
5. [Structured Overview of Repository Contents](structured-overview-of-repository-contents)
    - [0-change_your_home_IP](0-change_your_home_IP)
    - [1-show_attached_IPs](1-show_attached_IPs)
    - [100-port_listening_on_localhost](100-port_listening_on_localhost)
6. [Author](#author)

## Resources

**Read or watch:**

* [What is localhost](https://en.wikipedia.org/wiki/Localhost)
* [What is 0.0.0.0](https://en.wikipedia.org/wiki/0.0.0.0)
* [What is the hosts file](https://www.makeuseof.com/tag/modify-manage-hosts-file-linux/)
* [Netcat examples](https://www.thegeekstuff.com/2012/04/nc-command-examples/)

**man or help:**

* `ifconfig`
* `telnet`
* `nc`
* `cut`

## Learning Objectives

At the end of this project, you are expected to be able to [explain to anyone](https://fs.blog/feynman-learning-technique/), **without the help of Google**:

### General

* What is localhost/127.0.0.1
* What is 0.0.0.0
* What is `/etc/hosts`
* How to display your machine’s active network interfaces

## Prerequisites

* Allowed editors: `vi`, `vim`, `emacs`
* All your files will be interpreted on Ubuntu 20.04 LTS
* All your files should end with a new line
* A `README.md` file, at the root of the folder of the project, is mandatory
* All Bash script files must be executable
* Your Bash script must pass `Shellcheck` (version `0.7.0` via `apt-get`) without any errors
* The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
* The second line of all your Bash scripts should be a comment explaining what is the script doing

## Outlined Project Tasks

<details>
  <summary><a href="./0-change_your_home_IP"><strong>0. Change your home IP</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/3xVHtBns/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>Change Home IP: Bash script configures localhost and Facebook resolution.</em></figcaption>
    </figure>
  </div>
  <ul>
    <li>Links from screenshot
      <ul>
        <li><a href="http://blog.jonathanargentiero.com/docker-sed-cannot-rename-etcsedl8ysxl-device-or-resource-busy/">Docker sed</a></li>
      </ul>
    </li>
  </ul>
</details>


<details>
  <summary><a href="./1-show_attached_IPs"><strong>1. Show attached IPs</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/BbSbhcJG/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>Show Attached IPs: Bash script displays active IPv4 addresses.</em></figcaption>
    </figure>
  </div>
</details>


<details>
  <summary><a href="./100-port_listening_on_localhost"><strong>2. Port listening on localhost</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/RCYq1t22/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>Port Listening: Bash script listens on localhost port 98.</em></figcaption>
    </figure>
  </div>
</details>


<br>
<br>
<center><h3>Structured Overview of Repository Contents</h3> </center>

| Tasks | Files | Description |
| ----- | ----- | ----------- |
| 0: Change your home IP | [0-change_your_home_IP](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x08-networking_basics_2/0-change_your_home_IP) | Bash script to configures an Ubuntu server to map hostnames to specific IP addresses. |
| 1: Show attached IPs | [1-show_attached_IPs](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x08-networking_basics_2/1-show_attached_IPs) | Bash script that displays all active IPv4 IPs on the machine it’s executed on. |
| 2: Port listening on localhost| [100-port_listening_on_localhost](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x08-networking_basics_2/100-port_listening_on_localhost) | Bash script that listens on port 98 on localhost. |

## Author

[Peter Opoku-Mensah](https://github.com/deezyfg)