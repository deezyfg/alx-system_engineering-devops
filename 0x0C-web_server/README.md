# 0x0C. Web server

<p align="center">
  <img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/266/8Gu52Qv.png" />
</p>

## Background Context

[Web Server](https://www.youtube.com/watch?v=AZg4uJkEa-4)

In this project, some of the tasks will be graded on 2 aspects:

1. Is your `web-01` server configured according to requirements
2. Does your answer file contain a Bash script that automatically performs commands to configure an Ubuntu machine to fit requirements (meaning without any human intervention)

For example, if I need to create a file `/tmp/test` containing the string `hello world` and modify the configuration of Nginx to listen on port `8080` instead of `80`, I can use `emacs` on my server to create the file and to modify the Nginx configuration file `/etc/nginx/sites-enabled/default.`

But my answer file would contain:

```
sylvain@ubuntu cat 88-script_example
#!/usr/bin/env bash
# Configuring a server with specification XYZ
echo hello world > /tmp/test
sed -i 's/80/8080/g' /etc/nginx/sites-enabled/default
sylvain@ubuntu
```

As you can tell, I am not using `emacs` to perform the task in my answer file. This exercise is aiming at training you on automating your work. If you can automate tasks that you do manually, you can then automate yourself out of repetitive tasks and focus your energy on something more interesting. For an [SRE](https://www.atlassian.com/incident-management/devops/sre), that comes very handy when there are hundreds or thousands of servers to manage, the work cannot be only done manually. Note that the checker will execute your script as the `root` user, you do not need to use the `sudo` command.

![image](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/266/82VsYEC.jpg)

A good Software Engineer is a [lazy Software Engineer.](https://www.techwell.com/techwell-insights/2013/12/why-best-programmers-are-lazy-and-act-dumb) 

**Tips:** to test your answer Bash script, feel free to reproduce the checker environment:

* start a `Ubuntu 16.04` sandbox
* run your script on it
* see how it behaves

## Resource

<details>
<summary><a href="https://www.gnu.org/software/libc/manual/html_node/Processes.html#Processes">Child Process</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/bw6hYBS5/image.png' border='0' alt='image'/></a>
</details>

- [Background contenxt](https://www.youtube.com/watch?v=AZg4uJkEa-4)
- [How the web works](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works)
- [Nginx](https://en.wikipedia.org/wiki/Nginx)
- [How to Configure Nginx](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
- [Root and sub domain](https://landingi.com/help/domains-vs-subdomains/)
- [HTTP requests](https://www.tutorialspoint.com/http/http_methods.htm)
- [HTTP redirection](https://moz.com/learn/seo/redirection)
- [Not found HTTP response code](https://en.wikipedia.org/wiki/HTTP_404)
- [Logs files on Linux](https://www.cyberciti.biz/faq/ubuntu-linux-gnome-system-log-viewer/)

**For reference:**
- [RFC 7231 (HTTP/1.1)](https://datatracker.ietf.org/doc/html/rfc7231)
- [RFC 7540 (HTTP/2)](https://datatracker.ietf.org/doc/html/rfc7540)

**man or help**
- scp
- curl

## Learning Objectives

At the end of this project, you are expected to be able to [explain to anyone](https://fs.blog/feynman-learning-technique/), **without the help of Google**:

### General

* What is the main role of a web server
* What is a child process
* Why web servers usually have a parent process and child processes
* What are the main HTTP requests

### DNS

* What DNS stands for
* What is DNS main role

### DNS Record Types
* `A`
* `CNAME`
* `TXT`
* `MX`

## Requirements

### General

* Allowed editors: `vi`, `vim`, `emacs`
* All your files will be interpreted on Ubuntu 16.04 LTS
* All your files should end with a new line
* A `README.md` file, at the root of the folder of the project, is mandatory
* All your Bash script files must be executable
* Your Bash script must pass `Shellcheck` (version `0.3.7`) without any error
* The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
* The second line of all your Bash scripts should be a comment explaining what is the script doing
* You can’t use `systemctl` for restarting a process

## Tasks

<details>
<summary><a href="./0-transfer_file">0. Transfer a file to your server</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/j2P4SmgY/image.png' border='0' alt='image'/></a><br>
<strong>File:</strong> [0-transfer_file](0-transfer_file)
</details>


<details>
<summary><a href="./1-install_nginx_web_server">1. Install nginx web server</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/QMbf1FrY/image.png' border='0' alt='image'/></a>
<a href='https://postimg.cc/621fsx68' target='_blank'><img src='https://i.postimg.cc/vTGqVGpt/image.png' border='0' alt='image'/></a>
<a href='https://i.postimg.cc/TPQPw0rV/Screenshot-from-2024-04-22-07-32-39.png' target='_blank'><img src='https://i.postimg.cc/TPQPw0rV/Screenshot-from-2024-04-22-07-32-39.png' border='0' alt='image'/></a>
<ul>
  <li><a href='https://askubuntu.com/questions/672892/what-does-y-mean-in-apt-get-y-install-command' target='_blank'>-y on apt-get command</a></li>
</ul>
<strong>File:</strong> [1-install_nginx_web_server](1-install_nginx_web_server)
</details>


<details>
<summary><a href="./2-setup_a_domain_name">2. Setup a domain name</a></summary><br>
<a href='https://postimg.cc/svdGgYqp' target='_blank'><img src='https://i.postimg.cc/t4v40jxh/Image.png' border='0' alt='image'/></a>
<a href='https://postimg.cc/svdGgYqp' target='_blank'><img src='https://i.postimg.cc/Hs2L25Wv/Image2.png' border='0' alt='image'/></a>
<a href='https://postimg.cc/svdGgYqp' target='_blank'><img src='https://i.postimg.cc/FHHHnR7r/Image3.png' border='0' alt='image'/></a>
<ul>
  <li><a href='https://get.tech/' target='_blank'>.TECH Domains</a></li>
  <li><a href='https://education.github.com/student/verify?school_id=7806&student_id=ALX-530428&signature=aecd3158eb7ab0ca40f850627ad8c53c48f3d8be3aba5a9a7acbb66323645b26' target='_blank'>tools space</a></li>
  <li><a href='https://education.github.com/pack' target='_blank'>GitHub Student Developer Pack</a></li>
  <li><a href='https://whois.whoisxmlapi.com/' target='_blank'>https://whois.whoisxmlapi.com/</a></li>
</ul>
<strong>File:</strong> [2-setup_a_domain_name](2-setup_a_domain_name)
</details>


<details>
<summary><a href="./3-redirection">3. Redirection</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/tTmZ8GqZ/image.png' border='0' alt='image'/></a>
<ul>
  <li><a href='https://stackoverflow.com/questions/26041088/sed-replace-line-with-multiline-variable' target='_blank'>Replace a line with multiple lines with sed</a></li>
</ul>
<strong>File:</strong> [3-redirection](3-redirection)
</details>


<details>
<summary><a href="./4-not_found_page_404">4. Not found page 404</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/zvhdBrG6/image.png' border='0' alt='image'/></a>
<strong>File:</strong> [4-not_found_page_404](4-not_found_page_404)
</details>


<details>
<summary><a href="./7-puppet_install_nginx_web_server.pp">5. Install Nginx web server (w/ Puppet)</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/Vs2dxb0D/image.png' border='0' alt='image'/></a>
<strong>File:</strong> [7-puppet_install_nginx_web_server.pp](7-puppet_install_nginx_web_server.pp)
</details>

---

# Additional Information

## Transfer Files Using SCP (Secure Copy Protocol)

To transfer files from your local terminal to a server or between Linux machines, you can use SCP (Secure Copy Protocol). Follow these steps to accomplish this:

### 1. Log in to Your Server:

Access your server directly using the SSH automation setup in the the previous section [0x0B-ssh](../0x0B-ssh), typically by entering:

```
web01
```

Then, check the contents of the directory:
```
ls -la
```

### 2. Transfer a File from Local Machine to Server:

Use the `scp` command to transfer a file from your local machine to the server. Execute the following command, specifying the path to the file you wish to transfer:

```
scp <filename> <username of the server>@<IP address>:<path to store the file on the server>
```
Replace `<filename>` with the name of the file, `<username of the server>` with your server's username, `<IP address>` with the server's IP address, and `<path to store the file on the server>` with the desired destination path on the server.

For example, consider the following command:
```
scp dummy ubuntu@18.209.225.255:/home/ubuntu
```
This command transfers the file named `"dummy"` from the local machine to the server with the username `"ubuntu"` at the IP address `"18.209.225.255"`, and stores it in the directory `"/home/ubuntu"` on the server.

### 3. Check Transfer on Server:

Verify if the file has been successfully transferred by navigating to the directory on the server and checking its contents:
```
ls -la
```

4. ### Using Specific SSH Keys for File Transfer:

If you have multiple SSH keys, specify which one to use with the `-i` option followed by the path to the desired SSH key:
```
scp -i <path to your ssh key> <filename> <username of the server>@<IP address>:<path to store the file on the server>
```
Replace `<path to your SSH key>` with the path to your specific SSH key file, `<filename>` with the name of the file to transfer, `<username of the server>` with your server's username, `<IP address>` with the server's IP address, and `<path to store the file on the server>` with the desired destination path on the server.

This command specifies the SSH key (`<path to your ssh key>`) to be used during the file transfer operation. It ensures that the file is securely transferred using the specified SSH key, enhancing authentication and access control measures.

For example:
```
scp -i ~/.ssh/id_rsa dummy ubuntu@18.209.225.255:/home/ubuntu
```
This command transfers the file named `"dummy"` from the local machine to the server with the username `"ubuntu"` at the IP address `"18.209.225.255"`, using the SSH key located at `"~/.ssh/id_rsa"` for authentication, and stores it in the directory `"/home/ubuntu"` on the server.


## Installing and Setting Up NGINX Using Scripts

Follow these steps to install and set up NGINX using scripts:

### 1. Log in to Your Server:

Access your server directly using the SSH automation setup in the the previous section [0x0B-ssh](../0x0B-ssh), typically by entering:

```
web01
```

Then, check the contents of the directory:
```
ls -la
```

### 2. Create and Run the NGINX Setup Script:

* Create a file named `nginx-setup` on your SSH server and insert the contents from [4-not_found_page_404](4-not_found_page_404) into it. Execute the following command to create the file:
```
nano nginx-setup  # Use nano or any preferred text editor to create the file
```

* Make the file executable:
```
chmod u+x nginx-setup
```

* Execute the file to install NGINX:
```
./nginx-setup
```

* Verify NGINX Installation:
After installation, ensure NGINX is running properly by executing:
```
curl localhost
```

You should receive the output:
```
Hello World!
```

Now, if you paste your server's IP address into any web browser, you should see the string "Hello World!" displayed.

3. Testing Redirection:
You can test redirection by accessing `<your_ip_address>/redirect_me/` in a web browser. Replace `<your_ip_address>` with the actual IP address of your server.
Example:
```
54.167.187.16/redirect_me/
```

* Alternatively, you can use the following command in your terminal to check redirection using curl:

```
curl localhost/redirect_me/
```

You should receive the output:
```
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.18.0 (Ubuntu)</center>
</body>
</html>
```
This confirms that redirection is functioning properly.

### 4. Using Your Domain Name:

If you have a domain name set up, you can also test NGINX using it:

```
curl <domain_name>
```
Replace `<domain_name>` with the actual domain name you have set up for your server.

For example:
```
curl opokumensahpeter.tech
```

You should receive the output:
```
Hello World!
```

This confirms that NGINX is serving the expected content.

Remember, you can use various text editors like nano, emacs, vi, or vim depending on your preference. Additionally, when using nano, you can paste text by pressing `Ctrl + Shift + V`. To save and exit nano, use `Ctrl + O` to write out the file, followed by `Enter`, and `Ctrl + X` to exit.

## Author

* [Peter Opoku-Mensah](https://github.com/deezyfg)