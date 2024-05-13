# 0x12. Web stack debugging #2 

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

<img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/bae58c9f066a9668001ef4b4c39778407439d2f9.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20240513%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240513T085722Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=6bcafa53b6ddc122890f91e949dcbeb33b676be3ca05094194c30fe9a661779b">
</details>

</details>

<p align="center">
  <img src="https://i.postimg.cc/dVXBzkzc/99littlebugsinthecode.jpg"/>
</p>

## Tasks

<details>
<summary><a href="./0-iamsomeoneelse">0. Run software as another user</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/3JjzLYwh/power.png' border='0' alt='power'/></a>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/cHZT1qTs/image.png' border='0' alt='image'/></a>
<strong>File:</strong> <a href="./0-iamsomeoneelse">0-iamsomeoneelse</a>
</details>

<details>
<summary><a href="./1-run_nginx_as_nginx">1. Run Nginx as Nginx</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/HnNDJ0Ss/image.png' border='0' alt='image'/></a>
<strong>File:</strong> <a href="./1-run_nginx_as_nginx">1-run_nginx_as_nginx</a>
</details>

<details>
<summary><a href="./100-fix_in_7_lines_or_less">2. 7 lines or less</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/pd9mQ0Jw/image.png' border='0' alt='image'/></a>
<strong>File:</strong> <a href="./100-fix_in_7_lines_or_less">100-fix_in_7_lines_or_less</a>
</details>

## Author

* [Peter Opoku-Mensah](https://github.com/deezyfg)