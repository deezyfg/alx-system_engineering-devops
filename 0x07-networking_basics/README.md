<center> <h1>0x07. Networking basics #0</h1> </center>

Networking is a fundamental aspect of computer systems, and understanding its basics is crucial for anyone involved in the field of technology. This project is focused on networking basics, covering essential concepts and protocols necessary for understanding network communication. Through resources and practical tasks, it explores topics such as the OSI model, different types of networks (LAN, WAN, Internet),  MAC and IP addresses, TCP/UDP protocols, and network diagnostics using tools like netstat and ping. 

## Table Of Contents

1. [Resources](#resources)
2. [Learning Objectives](#learning-objectives)
3. [Prerequisites](#prerequisites)
4. [More Info](#more-info)
5. [Outlined Project Tasks](outlined_project_tasks)
5. [Structured Overview of Repository Contents](structured-overview-of-repository-contents)
    - [0-OSI_model](0-OSI_model)
    - [1-types_of_network](1-repetition_token_0rb)
    - [2-MAC_and_IP_address](2-MAC_and_IP_address)
    - [3-UDP_and_TCP](3-UDP_and_TCP)
    - [4-TCP_and_UDP_ports](4-tcp_and_udp_ports)
    - [5-is_the_host_on_the_network](5-is_the_host_on_the_network)
6. [Author](#author)

## Resources

**Read or watch:**

* [OSI model](https://en.wikipedia.org/wiki/OSI_model)
* [Different types of network](https://www.lifewire.com/lans-wans-and-other-area-networks-817376)
* [LAN network](https://en.wikipedia.org/wiki/Local_area_network)
* [WAN network](https://en.wikipedia.org/wiki/Wide_area_network)
* [Internet](https://en.wikipedia.org/wiki/Internet)
* [MAC address](https://whatismyipaddress.com/mac-address)
* [What is an IP address](https://www.bleepingcomputer.com/tutorials/ip-addresses-explained/)
* [Private and public address](https://www.iplocation.net/public-vs-private-ip-address)
* [IPv4 and IPv6](https://www.webopedia.com/insights/ipv6-ipv4-difference/)
* [Localhost](https://en.wikipedia.org/wiki/Localhost)
* [TCP and UDP](https://www.howtogeek.com/190014/htg-explains-what-is-the-difference-between-tcp-and-udp/)
* [TCP/UDP ports List](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)
* [What is ping /ICMP](https://en.wikipedia.org/wiki/Ping_%28networking_utility%29)
* [Positional parameters](https://www.adminschoice.com/bash-positional-parameters)

**man or help:**

* `netstat`
* `ping`

## Learning Objectives

At the end of this project, you are expected to be able to [explain to anyone](https://fs.blog/feynman-learning-technique/), without the help of Google:

### OSI Model

* What it is
* How many layers it has
* How it is organized

### What is a LAN

* Typical usage
* Typical geographical size

### What is a WAN

* Typical usage
* Typical geographical size

### What is the Internet

* What is an IP address
* What are the 2 types of IP address
* What is `localhost`
* What is a subnet
* Why IPv6 was created

### TCP/UDP

* What are the 2 mainly used data transfer protocols for IP (transfer level on the OSI schema)
* What is the main difference between TCP and UDP
* What is a port
* Memorize SSH, HTTP and HTTPS port numbers
* What tool/protocol is often used to check if a device is connected to a network

## Prerequisites

* Allowed editors: `vi`, `vim`, `emacs`
* All your Bash script files will be interpreted on Ubuntu 20.04 LTS
* All your files should end with a new line
* A `README.md` file, at the root of the folder of the project, is mandatory
* All Bash script files must be executable
* Your Bash script must pass `shellcheck` without any error
* The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
* The second line of all your Bash scripts should be a comment explaining what is the script doing


## More Info

The second line of all your Bash scripts should be a comment explaining what is the script doing

For multiple choice question type tasks, just type the number of the correct answer in your answer file, add a new line for every new answer, example:

What is the most important position in a software company?

1. Project manager
2. Backend developer
3. System administrator

```
sylvain@ubuntu$ cat foo_answer_file
3
sylvain@ubuntu$
```
Source for question 1 [here](https://twitter.com/devopsreact/status/831922429215662080)

## Outlined Project Tasks

<details>
  <summary><a href="./0-OSI_model"><strong>0. OSI model</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/Bv1PWt5X/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>OSI Model: Network communication framework with layered abstraction.</em></figcaption>
    </figure>
  </div>
</details>


<details>
  <summary><a href="./1-types_of_network"><strong>1. Types of network</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/nLCTkX2r/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>Types of Network: LAN for local, WAN for wider connections.</em></figcaption>
    </figure>
  </div>
</details>

<details>
  <summary><a href="./2-MAC_and_IP_address"><strong>2. MAC and IP address</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/pXmD4w8c/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>MAC and IP Address: Unique identifiers for network interfaces.</em></figcaption>
    </figure>
  </div>
</details>

<details>
  <summary><a href="./3-UDP_and_TCP"><strong>3. UDP and TCP</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/9X6P9WrP/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>UDP and TCP: Protocols for reliable and fast data transfer.</em></figcaption>
    </figure>
  </div>
</details>

<details>
  <summary><a href="./4-TCP_and_UDP_ports"><strong>4. TCP and UDP ports</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/9Mq6xmVP/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>UDP and TCP: Protocols for reliable and fast data transfer.</em></figcaption>
    </figure>
  </div>
</details>

<details>
  <summary><a href="./5-is_the_host_on_the_network"><strong>5. Is the host on the network</strong></a></summary><br>
  <div align="center">
    <figure>
      <a href='https://postimages.org/' target='_blank'>
        <img src='https://i.postimg.cc/g0KXxW1D/image.png' border='0' alt='image' style="max-width: 100%;">
      </a>
      <figcaption><em>Is the Host on the Network: Bash script to ping an IP address.</em></figcaption>
    </figure>
  </div>
</details>

<br>
<br>
<center><h3>Structured Overview of Repository Contents</h3> </center>

| Tasks | Files | Description |
| ----- | ----- | ----------- |
| 0: OSI model | [/0-OSI_model](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x07-networking_basics/0-OSI_model) | Text file containing content about the OSI model (2 lines) |
| 1: Types of network | [1-types_of_network](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x07-networking_basics/1-types_of_network) | Text file containing content about types of networks (3 lines) |
| 2: MAC and IP address | [2-MAC_and_IP_address](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x07-networking_basics/2-MAC_and_IP_address) | Text file containing content about MAC and IP addresses (2 lines) |
| 3: UDP and TCP | [3-UDP_and_TCP](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x07-networking_basics/3-UDP_and_TCP) | Text file containing content about UDP and TCP (1 line)
| 4: TCP and UDP ports | [4-TCP_and_UDP_ports](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x07-networking_basics/4-TCP_and_UDP_ports) | Bash script that displays listening sockets along with the PID and name of the program to which each socket belongs. |
| 5. Is the host on the network | [5-is_the_host_on_the_network](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x07-networking_basics/5-is_the_host_on_the_network) | Bash script that pings an IP address passed as an argument. |
| 6: README File | [README.md](https://github.com/deezyfg/alx-system_engineering-devops/blob/master/0x07-networking_basics/README.md) | README file containing information about the repository |

<br>
<br>
## Author

[Peter Opoku-Mensah](https://github.com/deezyfg)