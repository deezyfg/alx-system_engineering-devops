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