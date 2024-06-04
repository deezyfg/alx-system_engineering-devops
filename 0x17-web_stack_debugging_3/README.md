# 0x17. Web stack debugging #3

This project contains tasks for learning about how to debug web stack issues using **`tmux`** and **`strace`** tools.

tasks for learning about how to debug web stacks.

## Concepts

For this project, we expect you to look at these concepts:

<details>
<summary>Web Server</summary><br>

**Do not mix up web server and server.**

A web server is a software that delivers web pages. A server is an actual computer.

But you might hear people referring to a **web server** using the word **server**. (Check out the **server** concept page to learn more about this.)

As mentioned above, a server is a physical machine, an actual computer, but in the Cloud era that could also be a virtual computer, generally called a VM ([Virtual Machine](https://en.wikipedia.org/wiki/Virtual_machine)) or [container](https://www.cio.com/article/247005/what-are-containers-and-why-do-you-need-them.html).

## Readme:

* [Wikipedia page about web server](https://en.wikipedia.org/wiki/Web_server)
* [Web server](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Web_mechanics/What_is_a_web_server)
* [What is a Web Server?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Web_mechanics/What_is_a_web_server)

</details>


<details>
<summary>Web stack debugging</summary><br>
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

</details>

</details>


## Background Context

![Image](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/293/d42WuBh.png)

When debugging, sometimes logs are not enough. Either because the software is breaking in a way that was not expected and the error is not being logged, or because logs are not providing enough information. In this case, you will need to go down the stack, the good news is that this is something Holberton students can do :)

Wordpress is a very popular tool, it allows you to run blogs, portfolios, e-commerce and company websites… It [actually powers 26% of the web](https://managewp.com/blog/statistics-about-wordpress-usage), so there is a fair chance that you will end up working with it at some point in your career.

Wordpress is usually run on LAMP (Linux, Apache, MySQL, and PHP), which is a very widely used set of tools.

The web stack you are debugging today is a Wordpress website running on a LAMP stack.

## Requirements

### General
* All your files will be interpreted on Ubuntu 14.04 LTS
* All your files should end with a new line
* A `README.md` file at the root of the folder of the project is mandatory
* Your Puppet manifests must pass `puppet-lint` version 2.1.1 without any errors
* Your Puppet manifests must run without error
* Your Puppet manifests first line must be a comment explaining what the Puppet manifest is about
* Your Puppet manifests files must end with the extension `.pp`
* Files will be checked with Puppet v3.4

## More Info

### Install puppet-lint

```
$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
```

## Tasks

### [0. Strace is your friend](0-strace_is_your_friend.pp)

Using `strace`, find out why Apache is returning a 500 error. Once you find the issue, fix it and then automate it using Puppet (instead of using Bash as you were previously doing).

**Hint:**

* `strace` can attach to a current running process
* You can use [tmux](https://hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/) to run [strace](https://strace.io/) in one window and `curl` in another one

Requirements:

* Your `0-strace_is_your_friend.pp` file must contain Puppet code
* You can use whatever Puppet resource type you want for you fix

Example:

```
root@e514b399d69d:~# curl -sI 127.0.0.1
HTTP/1.0 500 Internal Server Error
Date: Fri, 24 Mar 2017 07:32:16 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Connection: close
Content-Type: text/html

root@e514b399d69d:~# puppet apply 0-strace_is_your_friend.pp
Notice: Compiled catalog for e514b399d69d.ec2.internal in environment production in 0.02 seconds
Notice: /Stage[main]/Main/Exec[fix-wordpress]/returns: executed successfully
Notice: Finished catalog run in 0.08 seconds
root@e514b399d69d:~# curl -sI 127.0.0.1:80
root@e514b399d69d:~#
HTTP/1.1 200 OK
Date: Fri, 24 Mar 2017 07:11:52 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Link: <http://127.0.0.1/?rest_route=/>; rel="https://api.w.org/"
Content-Type: text/html; charset=UTF-8

root@e514b399d69d:~# curl -s 127.0.0.1:80 | grep Holberton
<title>Holberton &#8211; Just another WordPress site</title>
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Feed" href="http://127.0.0.1/?feed=rss2" />
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Comments Feed" href="http://127.0.0.1/?feed=comments-rss2" />
        <div id="wp-custom-header" class="wp-custom-header"><img src="http://127.0.0.1/wp-content/themes/twentyseventeen/assets/images/header.jpg" width="2000" height="1200" alt="Holberton" /></div>  </div>
                            <h1 class="site-title"><a href="http://127.0.0.1/" rel="home">Holberton</a></h1>
        <p>Yet another bug by a Holberton student</p>
root@e514b399d69d:~#
```

<br>

---

# Additional Information 

## Tmux in Linux:
**Tmux**, short for **“terminal multiplexer,”** is a powerful command-line tool in Linux that enables users to manage multiple terminal sessions within a single window. It is useful for running more than one command-line program at the same time, facilitating multitasking and efficient workflow organization. tmux is one of the favorite terminal multiplexer for most Linux users.  

## Remote Collaboration:
**Tmux** is invaluable when collaborating with others on remote servers. Multiple users can connect to the same Tmux session, enabling real-time collaboration, troubleshooting, and pair programming.

## Basic tmux keybindings:
Splitting the terminal into two panes vertically and horizontally is achieved by the following keyboard shortcuts:
* **`Ctrl + b + % (percent sign)`** to split the current window into two panes vertically.
* **`Ctrl + b + " (quotation mark)`** to split the current window into two panes horizontally.

## Navigation Commands:
The key commands to switch between tmux windows and panes are:
* **`Ctrl + b`**, then **`Arrow Key`** (**`Left, Right, Up, Down`**)
* **`Ctrl + b`**, then **`Left Arrow`** - Move to the pane on the left
* **`Ctrl + b`**, then **`Right Arrow`** - Move to the pane on the right
* **`Ctrl + b`**, then **`Up Arrow`** - Move to the pane above
* **`Ctrl + b`**, then **`Down Arrow`** - Move to the pane below

*These commands allow you to navigate between the different panes within a tmux window.*

Additionally, you can use these commands to switch between tmux windows:
* **`Ctrl + b`**, then **`n`** - Move to the next window
* **`Ctrl + b`**, then **`p`** - Move to the previous window
* **`Ctrl + b`**, then **`0`** (or **`1, 2, 3,`** etc.) - Move to a specific window number

### Other Useful commands:
* **`Ctrl+B D`** — Detach from the current session.
* **`Ctrl+B X`** — Close pane.
* **`Ctrl+B C`** — Create a new window.
* **`Ctrl+B :`** — Enter the command line to type commands. Tab completion is available.
* **`Ctrl+B ?`** — View all keybindings. Press `Q` to exit.
* **`Ctrl+B W`** — Open a panel to navigate across windows in multiple sessions.
* **`tmux ls:`** To list sessions

## STRACE:
**Strace** is a powerful tool for debugging system calls made by a process.
* **Note:** `Nginx` failing and returning a `500` error indicates an issue with configuration file(s). 

## How Strace Helps:
**Strace** allows us to monitor every system call made by the `Nginx` process during startup. By analyzing these calls, we gain valuable insights into the start-up attempt, we can see every response from  every system call, that way, we will pin-point the configuration(file) that has any particular error or unexpected response. Finally we can trace the error to its nginx configuration file and deal with the issue.

## How To Install Strace
The **`strace`** command is usually pre-installed on most Linux distributions. * However, if it's not, you can install it on Debian-based distributions like `Ubuntu` with the command **`sudo apt-get install strace`** .
* For RPM-based distributions like `CentOS`, use the command `sudo yum install strace`.

<br>

### How To Go About The Tasks On the Remote Server:
1. Update packages with the command: `sudo apt update`
 
2. Install **`tmux`** with the command: `sudo apt-get install tmux`

3. Start a **`tmux`** session with the command: `tmux`
This command will start a **`tmux`** session with a nice green status bar at the bottom.

4. Next, we start another **`tmux`** session by dividing the window into two panes vertically by pressing **`Ctrl + b + %`**

5. * On **`tmux window 1`**, use **`curl`** to test the server, and on **`tmux window 2`**, use **`strace`** to monitor the system calls made by the `Nginx` process.
   * However, to use `strace`, we need to know the PID (Process ID) of the Apache process, as we need to run **`strace`** attached to the Apache process PID. To switch between **`tmux`** windows, use the keyboard shortcut: **`Ctrl + b`**, then **`Arrow key (Left, Right, Up, Down)`**.

6. Now, obtain the Apache process PID on **`tmux window 1`** using the command: `ps aux | grep apache`
This command will display the available apache process PIDs.

7. * After obtaining the PID on **`tmux window 1`**, now go to **tmux window 2`** to attach **`strace`** to the Apache process PIDs with the command: `sudo strace -p <PID>`.
* Replace `<PID>` with the Apache process PID. If the output from the strace command is not what you're looking for, press `Ctrl + C` to quit the strace process. Then, run the same command for the next Apache process PID until you find the one you're interested in.
* To confirm you have the correct PID, the **`strace`** output should start with something similar to the following example:
```
$ sudo strace -p 288
Process 288 attached.
accept4(3,
```
This indicates that the **`strace`** command is successfully attached to the Apache process with the specified PID.

8. * After that, move back to **`tmux window 1`** and use the **curl** command: `curl -sI 127.0.0.1`
      * Note that the first `curl` gives us the error message on **`tmux window 1`**
      * Again, use `curl` on **`tmux window 1`** with the same command. Doing so, you realize the second `curl` gives us another error on **`tmux window 2`**.
      * Looking at the error at **`tmux window 2`** we can see a **`"No such file or directory"`** message and we can see the parent directory that is housing the non-existing file.
      * /`var/www/html` directory is housing a file with a `.phpp` extension instead of `.php`. Press `Ctrl + C` on **`tmux window 2`** to quit the error message.

9. Let's attach **`strace`** to the other PID on **`tmux window 2`** using the command: `sudo strace -p <PID>` and then use the **curl** command: `curl -sI 127.0.0.1` **twice** on **`tmux window 1`** to see the error message on both **`tmux window 1`** and **`tmux window 2`**. You'll get the same feedback error message. 

10. * Now, we close both **`tmux`** sessions by running `tmux kill-session` and then figure out the file housing the wrong extension. I think it is a typographic error.
      * To search for an occurrence of an instinctive `.phpp` we use this command: `grep -ro "phpp" /var/www/html`
      * This command shows all files that have phpp inside. Now we check them visually to see how to write the wrong. Use this command to locate the line number containing the phpp: `grep -n "phpp" /var/www/html/wp-settings.php`
      * Now that you know the line number, you go for visual checking by opening the file: `vi /var/www/html/wp-settings.php`

11. Next, we write a puppet file to fix the wrong extension by making modification for the right `.php` extension


**File:** [0-strace_is_your_friend.pp](0-strace_is_your_friend.pp)

```
# Fixes bad "phpp" extensions to "php" in the WordPress file "wp-settings.php".

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
```

##### NOTE:
* `sed`: Stream Editor, a command-line tool for text manipulation.
* `-i`: In-place editing. It tells sed to modify the file in place.
* `s/phpp/php/g`: This is a substitution expression that replaces all occurrences of `phpp` with `php`.
* `/var/www/html/wp-settings.php`: The path to the file for substitution
* `path`: The path attribute specifies the directories where the system should search for the command specified in the command attribute. In this case, `/usr/local/bin/:/bin/` are included in the search path.

12. Now, we apply puppet by running the command: **`puppet apply 0-strace_is_your_friend.pp`**