# 0x10. HTTPS SSL

This project focuses on implementing HTTPS SSL security measures in a DevOps and SysAdmin environment, ensuring strong encryption protocols are in place to safeguard data transmission. It encompasses configuring SSL certificates, managing certificate authorities, and optimizing server configurations for enhanced security posture. Additionally, the project addresses best practices for SSL implementation, threat mitigation strategies, and continuous monitoring to maintain a resilient security infrastructure.

---

<p align="center">
  <img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/276/FlhGPEK.png"/>
  </p>

## Table Of Contents

1. [Concepts](#concepts)
    - [DNS](#dns)
        - [Web stack debugging](#web-stack-debugging)
	2. [Background Context](#background-context)
	2. [Resources](#resources)
	3. [Learning Objectives](#learning-objectives)
	4. [Requirements](#requirements)
	5. [Tasks](#tasks)
	6. [Author](#author)

---

## Concepts

For this project, we expect you to look at these concepts:

<details id="dns">
  <summary><a href="#dns"><strong>DNS</strong></a></summary><br>

  <!-- Image -->
    <div align="center">
        <a href='https://postimages.org/' target='_blank'>
	      <img src='https://i.postimg.cc/KvyYPJ8z/DNS.png' border='0' alt='image' style="max-width: 100%;">
	          </a>
		    </div>

  <!-- Links for Screenshot -->
    <ul>
        <li><strong>Links from screenshot</strong>
	      <ul>
	              <li><a href="https://howdns.works/" title="Learn everything about DNS in cartoon">Learn everything about DNS in cartoon</a></li>
		              <li><a href="https://support.dnsimple.com/articles/a-record/" title="A Record">A Record</a></li>
			              <li><a href="https://en.wikipedia.org/wiki/CNAME_record" title="CNAME Record">CNAME Record</a></li>
				              <li><a href="https://en.wikipedia.org/wiki/MX_record" title="MX Record">MX Record</a></li>
					              <li><a href="https://en.wikipedia.org/wiki/TXT_record" title="TXT Record">TXT Record</a></li>
						              <li><a href="https://www.dnsknowledge.com/whatis/round-robin-dns/" title="Use DNS to scale with round-robin DNS">Use DNS to scale with round-robin DNS</a></li>
							              <li><a href="https://support.dnsimple.com/articles/ns-record/" title="What’s an NS Record?">What’s an NS Record?</a></li>
								              <li><a href="https://support.dnsimple.com/articles/soa-record/" title="What’s an SOA Record?">What’s an SOA Record?</a></li>
									              <li><a href="https://serverfault.com/questions/145777/what-s-the-point-in-having-www-in-a-url" title=" What’s the point in having www in a url?"> What’s the point in having www in a url?</a></li>
										            </ul>
											        </li>
												  </ul>
												  </details>


<details id="web-stack-debugging">
  <summary><a href="#web-stack-debugging"><strong>Web stack debugging</strong></a></summary>

  <!-- Image -->
    <div align="center">
        <a href='https://postimages.org/' target='_blank'>
	    <img src="https://i.postimg.cc/g23x3RSw/image1.png" alt="Image 1">
	        <img src="https://i.postimg.cc/CLBBL9bs/image2.png" alt="Image 2">
		    <img src="https://i.postimg.cc/xdYc5Ch6/image3.png" alt="Image 3">
		        <img src="https://i.postimg.cc/VLxSS4RQ/image4.png" alt="Image 4">
			    <img src="https://i.postimg.cc/05HKv9KN/image5.png" alt="Image 5">
			        <img src="https://i.postimg.cc/xdRq4QSn/image6.png" alt="Image 6">
				    <img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/bae58c9f066a9668001ef4b4c39778407439d2f9.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20240502%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240502T101056Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=4a1327e00fa1d92b4887999407248d9bc1238c8c3c175c8398f79835dd32c2c5" alt="Debugging is fun">
				        </a>
					  </div>

<!-- Links for Screenshot -->
<ul>
  <li><strong>Links from screenshot</strong>
      <ul>
            <li><a href="https://www.youtube.com/watch?v=1_gqlbADaAw&feature=youtu.be" title="Youtube video First 5 Commands When I Connect on a Linux Server">Youtube video First 5 Commands When I Connect on a Linux Server</a></li>
	          <li><a href="https://www.linux.com/training-tutorials/first-5-commands-when-i-connect-linux-server/" title="5 commands">5 commands</a></li>
		        <li><a href="https://www.techtarget.com/whatis/definition/uptime-and-downtime" title="uptime">uptime</a></li>
			      <li><a href="https://scoutapm.com/blog/understanding-load-averages" title="Understanding Linux CPU Load - when should you be worried?">Understanding Linux CPU Load - when should you be worried?</a></li>
			            <li><a href="https://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html" title="Linux Load Averages: Solving the Mystery">Linux Load Averages: Solving the Mystery</a></li>
				        </ul>
					  </li>
					  </ul>
					  </details>


## Background Context

## What happens when you don’t secure your website traffic?

![GIF](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/276/xCmOCgw.gif)

## Resource

- [What is HTTPS?](https://www.instantssl.com/http-vs-https)
- [What are the 2 main elements that SSL is providing](https://www.sslshopper.com/why-ssl-the-purpose-of-using-ssl-certificates.html)
- [HAProxy SSL termination on Ubuntu16.04](https://devops.ionos.com/tutorials/install-and-configure-haproxy-load-balancer-on-ubuntu-1604/)
- [SSL termination](https://en.wikipedia.org/wiki/TLS_termination_proxy)
- [Bash function](https://tldp.org/LDP/abs/html/complexfunct.html)
- [How to Secure HAProxy with Let's Encrypt on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-secure-haproxy-with-let-s-encrypt-on-ubuntu-14-04)
- [HAProxy SSL Termination](https://www.haproxy.com/blog/haproxy-ssl-termination/)
- [HTTP 301](https://en.wikipedia.org/wiki/HTTP_301)

**man or help:**

* `awk`
* `dig`

## Learning Objectives

At the end of this project, you are expected to be able to [explain to anyone](https://fs.blog/feynman-learning-technique/), **without the help of Google:**

General
* What is HTTPS SSL 2 main roles
* What is the purpose encrypting traffic
* What SSL termination means

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
<summary><a href="./0-world_wide_web">0. World wide web</a></summary><br>
<a href='https://postimg.cc/w3QxtHzN' target='_blank'><img src='https://i.postimg.cc/Y2Jvsqyd/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary><a href="./1-haproxy_ssl_termination">1. HAproxy SSL termination</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/jSy72SG2/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary><a href="./100-redirect_http_to_https">2. No loophole in your website traffic</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/Njtg78N1/image.png' border='0' alt='image'/></a>
</details>

## Author

- [Peter Opoku-Mensah](https://github.com/deezyfg)