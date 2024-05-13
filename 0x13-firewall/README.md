# 0x13. Firewall

## Concepts

For this project, we expect you to look at this concept:

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


<details>
<summary>Debugging is fun</summary><br>
<p>Debugging can be frustrating, but it will definitely be part of your job, it requires experience and methodology to become good at it. The good news is that bugs are never going away, and the more experienced you become, trickier bugs will be assigned to you! Good luck 😃</p>

<p><img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/bae58c9f066a9668001ef4b4c39778407439d2f9.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20240513%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240513T085722Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=6bcafa53b6ddc122890f91e949dcbeb33b676be3ca05094194c30fe9a661779b" alt="GIF"></p>
</details>


<p align="center">
  <img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/284/V1HjQ1Y.png" />
</p>

## Background Context

### Your servers without a firewall…

![Firewall GIF](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/155/holbertonschool-firewall.gif)

## Resources

**Read or watch:**

* [What is a firewall](https://en.wikipedia.org/wiki/Firewall_%28computing%29)

## More Info

As explained in the **web stack debugging guide** concept page, `telnet` is a very good tool to check if sockets are open with `telnet IP PORT`. For example, if you want to check if port 22 is open on `web-02`:

```
sylvain@ubuntu$ telnet web-02.holberton.online 22
Trying 54.89.38.100...
Connected to web-02.holberton.online.
Escape character is '^]'.
SSH-2.0-OpenSSH_6.6.1p1 Ubuntu-2ubuntu2.8

Protocol mismatch.
Connection closed by foreign host.
sylvain@ubuntu$
```

We can see for this example that the connection is successful: `Connected to web-02.holberton.online.`

Now let’s try connecting to port 2222:

```
sylvain@ubuntu$ telnet web-02.holberton.online 2222
Trying 54.89.38.100...
^C
sylvain@ubuntu$
```

We can see that the connection never succeeds, so after some time I just use `ctrl+c` to kill the process.

This can be used not just for this exercise, but for any debugging situation where two pieces of software need to communicate over sockets.

Note that the school network is filtering outgoing connections (via a network-based firewall), so you might not be able to interact with certain ports on servers outside of the school network. To test your work on `web-01`, please perform the test from outside of the school network, like from your `web-02` server. If you SSH into your `web-02 server`, the traffic will be originating from `web-02` and not from the school’s network, bypassing the firewall.

### Warning!

**Containers on demand cannot be used for this project (Docker container limitation)**

**Be very careful with firewall rules! For instance, if you ever deny port `22/TCP` and log out of your server, you will not be able to reconnect to your server via SSH, and we will not be able to recover it. When you install UFW, port 22 is blocked by default, so you should unblock it immediately before logging out of your server.**

## Tasks

### Mandatory Task

#### [0. Block all incoming traffic but](0-block_all_incoming_traffic_but)

Let’s install the `ufw` firewall and setup a few rules on `web-01`.

Requirements:

* The requirements below must be applied to `web-01` (feel free to do it on `lb-01` and `web-02`, but it won’t be checked)
* Configure `ufw` so that it blocks all incoming traffic, except the following TCP ports:
  - `22` (SSH)
  - `443` (HTTPS SSL)
  - `80` (HTTP)
* Share the `ufw` commands that you used in your answer file

### Advanced Task

#### 1. [Port forwarding](100-port_forwarding)

Firewalls can not only filter requests, they can also forward them.

Requirements:

* Configure `web-01` so that its firewall redirects port `8080/TCP` to port `80/TCP`.
* Your answer file should be a copy of the `ufw` configuration file that you modified to make this happen

Terminal in `web-01`:

```
root@03-web-01:~# netstat -lpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      2473/nginx
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      978/sshd
tcp6       0      0 :::80                   :::*                    LISTEN      2473/nginx
tcp6       0      0 :::22                   :::*                    LISTEN      978/sshd
udp        0      0 0.0.0.0:68              0.0.0.0:*                           594/dhclient
udp        0      0 0.0.0.0:54432           0.0.0.0:*                           594/dhclient
udp6       0      0 :::32563                :::*                                594/dhclient
Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node   PID/Program name    Path
unix  2      [ ACC ]     SEQPACKET  LISTENING     7175     433/systemd-udevd   /run/udev/control
unix  2      [ ACC ]     STREAM     LISTENING     6505     1/init              @/com/ubuntu/upstart
unix  2      [ ACC ]     STREAM     LISTENING     8048     741/dbus-daemon     /var/run/dbus/system_bus_socket
unix  2      [ ACC ]     STREAM     LISTENING     8419     987/acpid           /var/run/acpid.socket
root@03-web-01:~#
root@03-web-01:~# grep listen /etc/nginx/sites-enabled/default
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;
    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
#   listen 8000;
#   listen somename:8080;
#   listen 443;
root@03-web-01:~#
```

* My web server `nginx` is only listening on port `80`
* `netstat` shows that nothing is listening on `8080`

Terminal in `web-02`:

```
ubuntu@03-web-02:~$ curl -sI web-01.holberton.online:80
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 07 Mar 2017 02:14:41 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Tue, 04 Mar 2014 11:46:45 GMT
Connection: keep-alive
ETag: "5315bd25-264"
Accept-Ranges: bytes

ubuntu@03-web-02:~$ curl -sI web-01.holberton.online:8080
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 07 Mar 2017 02:14:43 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Tue, 04 Mar 2014 11:46:45 GMT
Connection: keep-alive
ETag: "5315bd25-264"
Accept-Ranges: bytes

ubuntu@03-web-02:~$
```

I use curl to query `web-01.holberton.online`, and since my firewall is forwarding the ports, I get a `HTTP 200` response on port `80/TCP` and also on port `8080/TCP`.

#### Useful Tip:

To set up port forwarding on **`web-01`**, follow these steps:

1. Open the configuration file by running `sudo nano /etc/ufw/before.rules`. You have the flexibility to choose any text editor, but for this demonstration, I used **Nano**.

2. Copy the contents of [100-port_forwarding](100-port_forwarding) and paste them into the `/etc/ufw/before.rules` file.

3. Save the changes and exit the editor.

4. Allow traffic on port `8080` by executing `sudo ufw allow 8080`.

5. Restart the UFW service with `sudo service ufw restart` to apply the changes.

6. Enable UFW with `sudo ufw enable`.

During the process, you may encounter a prompt asking whether to proceed with the operation, as it may disrupt existing SSH connections. Type `y` to confirm.

Once successfully activated, you'll receive the following confirmation message:

```
Firewall is active and enabled on system startup
```

Now, the port forwarding configuration is successfully implemented.

## Author

* [Peter Opoku-Mensah](https://github.com/deezyfg)