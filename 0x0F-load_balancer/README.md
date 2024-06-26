# 0x0F. Load balancer

<p align="center">
  <img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/275/qfdked8.png"/>
  </p>

## Background Context

You have been given 2 additional servers:

* gc-[STUDENT_ID]-web-02-XXXXXXXXXX
* gc-[STUDENT_ID]-lb-01-XXXXXXXXXX

Let’s improve our web stack so that there is [redundancy](https://en.wikipedia.org/wiki/Redundancy_%28engineering%29) for our web servers. This will allow us to be able to accept more traffic by doubling the number of web servers, and to make our infrastructure more reliable. If one web server fails, we will still have a second one to handle requests.

For this project, you will need to write Bash scripts to automate your work. All scripts must be designed to configure a brand new Ubuntu server to match the task requirements.

## Resource

<details>
<summary>Load balancer</summary><br>
<ul>
  <li>Ever wonder how Facebook, Linkedin, Twitter and other web giants are handling such huge amounts of traffic? They don’t have just one server, but tens of thousands of them. In order to achieve this, web traffic needs to be distributed to these servers, and that is the role of a load-balancer.

  <p align="center">
     <img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/6cefdd14b2f8c36789cba132bd5a10d42d88a177.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20220111%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220111T181845Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=792a403303cb0d1faf98b4886f11e22013fa58b709f00d84029ac5877beb6aab" />
       </p>
         <ul>
	       <li><a href="https://www.thegeekstuff.com/2016/01/load-balancer-intro/">Load-balancing</a></li>
	             <li><a href="https://devcentral.f5.com/s/articles/intro-to-load-balancing-for-developers-ndash-the-algorithms">Load-balancing algorithms</a></li>
		       </ul>
		         </li>
			 </ul>
			 </details>

<details>
<summary>Web stack debugging</summary><br>
<ul>
  <li>Intro
    <ul>Debugging usually takes a big chunk of a software engineer’s time. The art of debugging is tough and it takes years, even decades to master, and that is why seasoned software engineers are the best at it… experience. They have seen lots of broken code, buggy systems, weird edge cases and race conditions.</ul>

  <p align="center">
     <img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/45dffb0b1da8dc2ce47e340d7f88b05652c0f486.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20220105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220105T050302Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=d499fde872931932fc76dedd39b4298797482fd9b7ca1fc09f0a885ea8aa1cae" />
       </p>
         </li>
	 </ul>

<details>
<summary>Test and verify your assumptions</summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/rFMtkCt8/image.png' border='0' alt='image'/></a>
</details>

<ul>
  <li>Debugging is fun
    <ul>Debugging can be frustrating, but it will definitely be part of your job, it requires experience and methodology to become good at it. The good news is that bugs are never going away, and the more experienced you become, trickier bugs will be assigned to you! Good luck 😃</ul>

  <p align="center">
     <img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/bae58c9f066a9668001ef4b4c39778407439d2f9.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20220105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220105T050302Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=67d4c1d736b92bef534ab94427ff3bef2c8ad4b498cafb512fbe6f6ddefec9ba" />
       </p>
         </li>
	 </ul>

</details>

- [Introduction to load-balancing and HAproxy](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
- [HAProxy Configuration Basics: Load Balance Your Servers](https://www.haproxy.com/blog/haproxy-configuration-basics-load-balance-your-servers/)
- [The Four Essential Sections of an HAProxy Configuration](https://www.haproxy.com/blog/the-four-essential-sections-of-an-haproxy-configuration/)
- [HTTP Header](https://www.techopedia.com/definition/27178/http-header)
- [Debian/Ubuntu HAProxy packages](https://haproxy.debian.net/)

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


## Tasks

<details>
<summary><a href="./0-custom_http_response_header">0. Double the number of webservers</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/prMGd5GF/image.png' border='0' alt='image'/></a>
<br>
<b>Link From Screenshot:</b>
<a href="../0x0C-web_server">web server project</a>
<a href="https://github.com/koalaman/shellcheck/wiki/SC2154">Ignore SC2154</a>
<br>
<strong>File:</strong> <a href="0-custom_http_response_header">0-custom_http_response_header</a>
</details>

<details>
<summary><a href="./1-install_load_balancer">1. Install your load balancer</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/4dBWZ476/image.png' border='0' alt='image'/></a>
<strong>File:</strong> [1-install_load_balancer](1-install_load_balancer)
</details>

<details>
<summary><a href="./2-puppet_custom_http_response_header.pp">2. Add a custom HTTP header with Puppet</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/sD2G5kZY/image.png' border='0' alt='image'/></a>
<strong>File:</strong> [2-puppet_custom_http_response_header.pp](2-puppet_custom_http_response_header.pp)
</details>

---

## Additional Information

To automate your server logins for `web02` and `lb01` similar to what you have done for `web01`, follow the same steps provided in the **`Additional Information`** section of [0x0B-ssh](./0x0B-ssh) in the README.

### Setting Up Load Balancing For Web01 Server

1. Log in to the `web01` server via SSH using `ssh username@<IP address>` or through the automated login process. Replace username with your actual `username` on the server and `<IP address>` with the server's IP address.
2. Create a new file with a filename of your choice, such as `load-balance`, using any text editor like `Emacs`, `Vi`, `Nano`, or any other editor you prefer.
3. Copy and paste the contents of [0-custom_http_response_header][0-custom_http_response_header] into the `load-balance` file.
4. Make the `load-balance` script executable.

```
chmod u+x load-balance
```

5. Execute the script on `web01` to set up the server.
```
./load-balance
```

6. Check the HTTP header to confirm the setup.
```
curl -sI  localhost
```

You should receive output similar to this:
```
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
Date: Mon, 29 Apr 2024 08:36:40 GMT
Content-Type: text/html
Content-Length: 13
Last-Modified: Mon, 29 Apr 2024 08:34:43 GMT
Connection: keep-alive
ETag: "662f5ba3-d"
X-Served-By: 530428-web-01
Accept-Ranges: bytes
```

Now, you can observe the custom header `X-Served-By: 530428-web-01` indicating the web server as `web01`

### Setting up Web02 Server

1. Log in to the `web02` server via SSH using `ssh username@<IP address>` or through the automated login process. Replace username with your actual `username` on the server and `<IP address>` with the server's IP address.
2. Create a new file with a filename of your choice, such as `load-balance`, using any text editor like `Emacs`, `Vi`, `Nano`, or any other editor you prefer.
3. Copy and paste the contents of [0-custom_http_response_header][0-custom_http_response_header] into the `load-balance` file.
4. Make the `load-balance` script executable.

```
chmod u+x load-balance
```

5. Execute the script on `web01` to set up the server.
```
./load-balance
```

6. Check the HTTP header to confirm the setup.
```
curl -sI  localhost
```

You should receive output similar to this:
```
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
Date: Mon, 29 Apr 2024 09:03:53 GMT
Content-Type: text/html
Content-Length: 13
Last-Modified: Mon, 29 Apr 2024 09:03:42 GMT
Connection: keep-alive
ETag: "662f626e-d"
X-Served-By: 530428-web-02
Accept-Ranges: bytes
```

Now, you can observe the custom header `X-Served-By: 530428-web-02` indicating the web server as `web01`

### Setting up Load Balancer (lb01)

1. Log in to the `lb01` server via SSH using `ssh username@<IP address>` or through the automated login process. Replace username with your actual `username` on the server and `<IP address>` with the server's IP address.
2. Create a new file with a filename of your choice, such as `setup-load-balancer`, using any text editor like `Emacs`, `Vi`, `Nano`, or any other editor you prefer.
3. Copy and paste the contents of [1-install_load_balancer][1-install_load_balancer] into the `setup-load-balancer` file.
4. Make the `setup-load-balancer` script executable.

```
chmod u+x setup-load-balancer
```

5. Execute the script on `web01` to set up the server.
```
./setup-load-balancer
```

6. Check the HTTP header to confirm the setup.
```
curl -sI  localhost
```

You should receive a response similar to the following:
```
HTTP/1.1 200 OK
server: nginx/1.18.0 (Ubuntu)
date: Mon, 29 Apr 2024 09:22:36 GMT
content-type: text/html
content-length: 13
last-modified: Mon, 29 Apr 2024 08:34:43 GMT
etag: "662f5ba3-d"
x-served-by: 530428-web-01
accept-ranges: bytes
```

This indicates a response from the `web01` server.

* Run the command again:
```
curl -sI  localhost
```

You will receive another response similar to:
```
HTTP/1.1 200 OK
server: nginx/1.18.0 (Ubuntu)
date: Mon, 29 Apr 2024 09:22:50 GMT
content-type: text/html
content-length: 13
last-modified: Mon, 29 Apr 2024 09:03:42 GMT
etag: "662f626e-d"
x-served-by: 530428-web-02
accept-ranges: bytes
```

This indicates a response from the `web02` server.

By repeating this process, requests will be evenly distributed across the servers, ensuring balanced load distribution. Imagine a scenario with a thousand users accessing the servers simultaneously; they would be evenly divided among the servers, preventing any single server from being overwhelmed.