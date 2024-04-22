# 0x0D. Web stack debugging #0 

<p align="center">
  <img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/265/uWLzjc8.jpg" />
</p>

## Background Context

The Webstack debugging series will train you in the art of debugging. Computers and software rarely work the way we want (that’s the “fun” part of the job!).

Being able to debug a webstack is essential for a Full-Stack Software Engineer, and it takes practice to be a master of it.

In this debugging series, broken/bugged webstacks will be given to you, the final goal is to come up with a Bash script that once executed, will bring the webstack to a working state. But before writing this Bash script, you should figure out what is going on and fix it manually.

Let’s start with a very simple example. My server must:

* have a copy of the `/etc/passwd` file in `/tmp`
* have a file named `/tmp/isworking` containing the string `OK`

Let’s pretend that without these 2 elements, my web application cannot work.

Let’s go through this example and fix the server.

```
vagrant@vagrant:~$ docker run -d -ti ubuntu:14.04
Unable to find image 'ubuntu:14.04' locally
14.04: Pulling from library/ubuntu
34667c7e4631: Already exists
d18d76a881a4: Already exists
119c7358fbfc: Already exists
2aaf13f3eff0: Already exists
Digest: sha256:58d0da8bc2f434983c6ca4713b08be00ff5586eb5cdff47bcde4b2e88fd40f88
Status: Downloaded newer image for ubuntu:14.04
76f44c0da25e1fdf6bcd4fbc49f4d7b658aba89684080ea5d6e8a0d832be9ff9
vagrant@vagrant:~$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
76f44c0da25e        ubuntu:14.04        "/bin/bash"         13 seconds ago      Up 12 seconds                           infallible_bhabha
vagrant@vagrant:~$ docker exec -ti 76f44c0da25e /bin/bash
root@76f44c0da25e:/# ls /tmp/
root@76f44c0da25e:/# cp /etc/passwd /tmp/
root@76f44c0da25e:/# echo OK > /tmp/isworking
root@76f44c0da25e:/# ls /tmp/
isworking  passwd
root@76f44c0da25e:/#
vagrant@vagrant:~$
```

Then my answer file would contain:

```
sylvain@ubuntu:~$ cat answerfile
#!/usr/bin/env bash
# Fix my server with these magic 2 lines
cp /etc/passwd /tmp/
echo OK > /tmp/isworking
sylvain@ubuntu:~$
```

Note that as you cannot use interactive software such as emacs or vi in your Bash script, everything needs to be done from the command line (including file edition).

## Installing Docker

For this project you will be given a container which you can use to solve the task. **If** you would like to have Docker so that you can experiment with it and/or solve this problem locally, you can install it on your machine, your Ubuntu 14.04 VM, or your Ubuntu 16.04 VM if you upgraded.

* [Mac OS](https://docs.docker.com/desktop/install/mac-install/)
* [Windows](https://docs.docker.com/desktop/install/windows-install/)
* [Ubuntu 14.04](https://www.liquidweb.com/kb/how-to-install-docker-on-ubuntu-14-04-lts/) (Note that Docker for Ubuntu 14 is deprecated and you will have to make some adjustments to the instructions when installing)
* [Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

## Resource

### Concepts

<details>
<summary>Network basics</summary><br>
<ul>
  <li>Networking is a big part of what made computers so powerful and why the Internet exists. It allows machines to communicate with each other.
    <ul>
      <li><a href="https://www.techtarget.com/searchnetworking/definition/protocol">What is a protocol.</a></li>
      <li><a href="https://computer.howstuffworks.com/internet/basics/what-is-an-ip-address.htm">What is an IP address.</a></li>
      <li><a href="https://www.techtarget.com/searchnetworking/definition/TCP-IP">What is TCP/IP.</a></li>
      <li><a href="https://www.lifewire.com/port-numbers-on-computer-networks-817939">What is an Internet Protocol (IP) port?.</a></li>
    </ul>
  </li>
</ul>
</details>

<details>
<summary>Docker</summary><br>
<ul>
  <li>Readme
    <ul>
      <li><a href="https://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/">What is Docker and why is it popular</a></li>
    </ul>
  </li>
</ul>

<details>
<summary>Let's first pull a Docker image and run a container:</summary><br>
<p align="center">
  <img src="https://i.postimg.cc/13tHWGzc/image.png" border="0" alt="image"/>
</p>
</details>

Note that the `docker` command will pull the Ubuntu docker container image from the Internet and run it. I let you look at the meaning of the flags using the command `docker run --help`, the main idea is that it keeps the container up and running.

<details>
<summary>To execute a command on the Docker container, use *docker exec*:</summary><br>
<p align="center">
  <img src="https://i.postimg.cc/fLLDygWS/image.png" border="0" alt="image"/>
</p>
</details>

<details>
<summary>If you want to connect to your Docker container and use Bash, you need to use *docker exec -ti*:</summary><br>
<p align="center">
  <img src="https://i.postimg.cc/433xH3B3/image.png" border="0" alt="image"/>
</p>
</details>

<details>
<summary>If you want to stop a container, use *docker stop*:</summary><br>
<p align="center">
  <img src="https://i.postimg.cc/sxCzmf97/image.png" border="0" alt="image"/>
</p>
</details>

</details>

<details>
<summary>Web stack debugging</summary><br>
<ul>
  <li>Intro
    <ul>
      <li>Debugging usually takes a big chunk of a software engineer’s time. The art of debugging is tough and it takes years, even decades to master, and that is why seasoned software engineers are the best at it… experience. They have seen lots of broken code, buggy systems, weird edge cases and race conditions.</li>
    </ul>
  </li>
</ul>
<p align="center">
  <img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/45dffb0b1da8dc2ce47e340d7f88b05652c0f486.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20220105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220105T050302Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=d499fde872931932fc76dedd39b4298797482fd9b7ca1fc09f0a885ea8aa1cae" border="0" alt="image"/>
</p>
</details>

<details>
<summary>Test and verify your assumptions</summary><br>
<p align="center">
  <img src="https://i.postimg.cc/rFMtkCt8/image.png" border="0" alt="image"/>
</p>
</details>

<ul>
  <li>Debugging is fun
    <ul>
      <li>Debugging can be frustrating, but it will definitely be part of your job, it requires experience and methodology to become good at it. The good news is that bugs are never going away, and the more experienced you become, trickier bugs will be assigned to you! Good luck 😃</li>
    </ul>
  </li>
</ul>

<p align="center">
  <img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/bae58c9f066a9668001ef4b4c39778407439d2f9.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20220105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220105T050302Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=67d4c1d736b92bef534ab94427ff3bef2c8ad4b498cafb512fbe6f6ddefec9ba" border="0" alt="image"/>
</p>

**man or help:**

* `curl`

## Requirements

### General

* Allowed editors: `vi`, `vim`, `emacs`
* All your files will be interpreted on Ubuntu 14.04 LTS
* All your files should end with a new line
* A `README.md` file, at the root of the folder of the project, is mandatory
* All your Bash script files must be executable
* Your Bash scripts must pass `Shellcheck` without any error
* Your Bash scripts must run without error
* The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
* The second line of all your Bash scripts should be a comment explaining what is the script doing

## Tasks

<details>
<summary><a href="./0-give_me_a_page">0. Give me a page!</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/yxybJXPm/image.png' border='0' alt='image'/></a>
<br>
<ul>
  <li>Advice: Install Docker on your local machine, then pull the Docker image, debug the issue, and proceed.</li>
</ul>
<strong>AVOID INSTALLING DOCKER IN UBUNTU 14.04</strong>
<ul>
  <li>It is recommended to install Ubuntu 16.04 to avoid compatibility issues with Docker and ensure optimal performance.</li>
  <li><a href='https://en.wikipedia.org/wiki/Apache_HTTP_Server' target='_blank'>Apache</a></li>
</ul>
<strong>File:</strong> [0-give_me_a_page](0-give_me_a_page)
</details>