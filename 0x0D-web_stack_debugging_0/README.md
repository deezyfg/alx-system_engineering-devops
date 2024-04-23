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

---

# Additional Information

## Debugging Apache2 Server in Docker Container

In this task, you'll learn how to debug and fix issues in a Docker container running an Apache2 server. Follow the steps below to get started:

### Step 1: Install Docker

Before getting started, make sure to install Docker on your local machine. Ensure it's properly installed and running.

* [Install Docker on Ubuntu (4 Easy Ways)](https://kinsta.com/blog/install-docker-ubuntu/)
* [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)
* [Install Docker Desktop on Mac](https://docs.docker.com/desktop/install/mac-install/)

### Step 2: Verify Docker Version

To verify the version of Docker installed on your system, you can use either of the following commands:

```
docker -v
```

or

```
docker --version
```

### Step 3: Run Docker Container with Apache2

To run the specified Docker container with Apache2 installed, follow these steps:

1. Open your terminal.
2. Execute the following command:

```
docker run -p 8080:80 -d -it holbertonschool/265-0
```

This command starts a Docker container based on the `holbertonschool/265-0 image`, while also mapping port `8080` on your host to port `80` in the container.

**NOTE**:

**(a)** By default, Docker commands require `root` privileges, necessitating the use of `sudo` as a prefix. Attempting to run Docker commands without `sudo` results in an error message like the following:
```
docker: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Head "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
```

Running a command like `sudo docker run -p 8080:80 -d -it holbertonschool/265-0` will prompt for the `sudo` password, which is typically the user's password on their device, and then proceed with the Docker operations. It may display output similar to:
```
Unable to find image 'holbertonschool/265-0:latest' locally
latest: Pulling from holbertonschool/265-0
c60055a51d74: Pull complete 
755da0cdb7d2: Pull complete 
1403e424ed38: Pull complete 
37c9a9113595: Pull complete 
a3d9f8479786: Pull complete 
72050e30266b: Pull complete 
Digest: sha256:72581a2b9f94f33f6c3e8a133607ed208d20f8f35c5b6b15183615a2b735ae1a
Status: Downloaded newer image for holbertonschool/265-0:latest
d9dc2fa2ddedd7c1cce0ad97d901d4813452d5fbbf3a0e671a2a616a8c16520a
```

**(b)** To bypass this requirement, you can add your user to the `docker` group, which Docker automatically creates during installation to authorize interaction without `sudo`. Execute the following command to add your user to the docker group:
```
sudo usermod -aG docker $USER
```
After executing this command, ensure you log out and then log back in to apply the changes.

You can learn more about this process in detail by visiting this [link.](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04#step-2-executing-the-docker-command-without-sudo-optional)

**(c)** If you are unsure about your username, you can check the current user by running the `whoami` command:
```
whoami
```

This command will display the username of the current user within the Docker container.

### Step 4: Check Docker Container Status

You can verify that the container is running by using the following command:
```
sudo docker ps
```

This command will list the running Docker containers, displaying details such as the container ID, image, command, status, and exposed ports.

An example output might resemble:
```
CONTAINER ID   IMAGE                   COMMAND       CREATED              STATUS              PORTS                                   NAMES
d9dc2fa2dded   holbertonschool/265-0   "/bin/bash"   About a minute ago   Up About a minute   0.0.0.0:8080->80/tcp, :::8080->80/tcp   objective_sutherland
```

deezyfg@deezyfg:~$ sudo docker ps
CONTAINER ID   IMAGE                   COMMAND       CREATED              STATUS              PORTS                                   NAMES
d9dc2fa2dded   holbertonschool/265-0   "/bin/bash"   About a minute ago   Up About a minute   0.0.0.0:8080->80/tcp, :::8080->80/tcp   objective_sutherland

These outputs demonstrate successful Docker operations performed with sudo, where the sudo password is typically the user's password on their device.

### Step 5: Access Docker Container Terminal

To access the terminal within your Docker container, you can use the `docker exec` command with the `-ti` options to open an interactive terminal session. Here's the command:
```
sudo docker exec -ti CONTAINER_ID /bin/bash
```

Replace **`CONTAINER_ID`** with the actual ID or name of your Docker container.

For example, if your container ID is **`d9dc2fa2dded`**, the command would be:
```
sudo docker exec -ti d9dc2fa2dded /bin/bash
```
This command will open an interactive Bash session within the specified Docker container, allowing you to execute commands and interact with the container's filesystem.

If you are unsure how to obtain the container ID, you can use the command `sudo docker ps`. This will list all running Docker containers along with their IDs.

### Step 6: Verify Container Access

After accessing the Docker container terminal, you can verify by executing the command `ls`. This will list the contents of the current directory within the container:
```
root@d9dc2fa2dded:/# ls
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr
```

### Step 7: Test Apache2 Server and Troubleshoot

**Open a Second Terminal Window**

In a new terminal window, execute the following command:

```
curl 0:8080
```

If you receive a response like this:

```
curl: (52) Empty reply from server
```

It indicates that there is an issue with the Apache2 server running inside the Docker container. Proceed back to the first terminal to diagnose and resolve the problem.

This step helps identify any potential issues with the  Docker container's Apache2 server configuration, allowing for troubleshooting and resolution in the first Terminal.

### Step 8: Check Apache2 Server Status

* In the first terminal window, execute the following command:
```
sudo service apache2 status
```

If Apache2 is not running, you will receive an output similar to:
```
 * apache2 is not running
```

* In this case, where Apache2 is not running, execute the command:
```
sudo service apache2 start
```

You will receive output similar to:
```
 * Starting web server apache2                                                  AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
 * 
```

* Check the status again:
```
sudo service apache2 status
```

You will receive output indicating that Apache2 is running:
```
 * apache2 is running
```

### Step 9: Verify Server Fix

Return to the second terminal.

Execute the command again:
```
curl 0:8080
```

If the server is now functioning correctly, you will receive a response such as:
```
Hello Holberton
```

This confirms that the server issue has been successfully resolved, and `Apache2` is now responding appropriately to requests.

After resolving the server issue, it is necessary to document the commands used. In this case, only one command was used which is **`sudo service apache2 start`**. Ensure to create a script file using a text editor such as **`emacs**`` and include the command within it.