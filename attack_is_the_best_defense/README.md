# Attack is the best defense

This project focuses on integrating **`DevOps`** principles, **`scripting automation`**, and **`ethical hacking`** techniques. By combining these elements, the goal is to create a robust security infrastructure where proactive measures are taken to identify vulnerabilities and weaknesses before they can be exploited. This approach aligns with the notion that being proactive in detecting and addressing security threats is often the most effective form of defense.

---

## Background Context

**This project is NOT mandatory** at all. It is 100% optional. Doing any part of this project will add a project grade of over 100% to your average. Your score won’t get hurt if you don’t do it, but if your current average is greater than your score on this project, your average might go down. Have fun!

## Resources

**Read or watch:**

* [Network sniffing](https://www.lifewire.com/definition-of-sniffer-817996)
* [ARP spoofing](https://www.veracode.com/security/arp-spoofing)
* [Connect to SendGrid’s SMTP relay using telnet](https://docs.sendgrid.com/ui/account-and-settings/troubleshooting-delays-and-latency)
* [What is Docker and why is it popular?](https://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/)
* [Dictionary attack](https://en.wikipedia.org/wiki/Dictionary_attack)

**man or help:**

* `tcpdump`
* `hydra`
* `telnet`
* `docker`

## Advanced Tasks

### 0. ARP spoofing and sniffing unencrypted traffic

[![ARP-spoofing-and-sniffing-unencrypted-traffic.png](https://i.postimg.cc/nL3ZHsfk/ARP-spoofing-and-sniffing-unencrypted-traffic.png)](https://postimg.cc/bGS4gwJD)

Security is a vast topic, and network security is an important part of it. A lot of very sensitive information goes over networks that are used by many people, and some people might have bad intentions. Traffic going through a network can be intercepted by a malicious machine pretending to be another network device. Once the traffic is redirected to the malicious machine, the hacker can keep a copy of it and analyze it for potential interesting information. It is important to note that the traffic must then be forwarded to the actual device it was supposed to go (so that users and the system keep going as if nothing happened).

Any information that is not encrypted and sniffed by an attacker can be seen by the attacker - that could be your email password or credit card information. While today’s network security is much stronger than it used to be, there are still some legacy systems that are using unencrypted communication means. A popular one is `telnet`.

In this project, we will not go over ARP spoofing, but we’ll start by sniffing unencrypted traffic and getting information out of it.

[Sendgrid offers](https://sendgrid.com/en-us) is an emailing service that provides state of the art secure system to send emails, but also supports a legacy unsecured way: `telnet`. You can create an account for free, which is what I did, and send an email using `telnet`:

```
sylvain@ubuntu$ telnet smtp.sendgrid.net 587
Trying 167.89.121.145...
Connected to smtp.sendgrid.net.
Escape character is '^]'.
220 SG ESMTP service ready at ismtpd0013p1las1.sendgrid.net
EHLO ismtpd0013p1las1.sendgrid.net
250-smtp.sendgrid.net
250-8BITMIME
250-PIPELINING
250-SIZE 31457280`
250-STARTTLS
250-AUTH PLAIN LOGIN
250 AUTH=PLAIN LOGIN
auth login           
334 VXNlcm5hbWU6
VGhpcyBpcyBteSBsb2dpbg==
334 UGFzc3dvcmQ6
WW91IHJlYWxseSB0aG91Z2h0IEkgd291bGQgbGV0IG15IHBhc3N3b3JkIGhlcmU/ISA6RA==
235 Authentication successful
mail from: sylvain@kalache.fr
250 Sender address accepted
rcpt to: julien@google.com
250 Recipient address accepted
data
354 Continue
To: Julien
From: Sylvain
Subject: Hello from the insecure world

I am sending you this email from a Terminal.
.
250 Ok: queued as Aq1zhMM3QYeEprixUiFYNg
quit
221 See you later
Connection closed by foreign host.
sylvain@ubuntu$ 
```

I wrote the script `user_authenticating_into_server` that performs the authentication steps that I just showed above. Your mission is to execute `user_authenticating_into_server` locally on your machine and, using `tcpdump`, sniff the network to find my password. Once you find it, paste the password in your answer file. **This script will not work on a Docker container or Mac OS, use your Ubuntu vagrant machine or any other Linux machine.**

You can download the script [user\_authenticating\_into\_server](./user_authenticating_into_server)

**DISCLAIMER**: you will probably see `Authentication failed: Bad username / password` in the `tcpdump` trace. It’s normal, we deleted the user to our Sendgrid account. You can’t verify the password found via Sendgrid, only the correction system can!

#### Enhanced Network Traffic Capture

For best performance, execute the following command when no other processes are running. Although attempts were made to isolate a specific process, the most effective approach is to run it within a virtual environment. Additionally, employing base64 encoding can enhance functionality.

```
sudo tcpdump -A -l
```

This command, `sudo tcpdump -A -l` is used to capture network traffic in real-time. 

##### Command Explanation:

* `sudo`: Executes the command with superuser privileges.
* `tcpdump`: A command-line network packet analyzer.
* `-A`: Prints each packet in ASCII.
* `-l`: Flushes the output buffer after printing each line.

- [user\_authenticating\_into\_server](./user_authenticating_into_server) - Binary script file.

**File:** [0-sniffing](0-sniffing)


### 1. Dictionary attack

Password-based authentication systems can be easily broken by using a dictionary attack (you’ll have to find your own password dictionary). Let’s try it on an SSH account.

* Install Docker on your machine Ubuntu
* Pull and run the Docker image `sylvainkalache/264-1` with the command `docker run -p 2222:22 -d -ti sylvainkalache/264-1`
* Find a password dictionary (you might need multiple of them)
* Install and use `hydra` to try to brute force the account `sylvain` via SSH on the Docker container
* Because the Docker container is running locally, `hydra` should access the SSH account via IP `127.0.0.1` and port `2222`
* Hint: the password is 11 characters long

Once you have successfully found the password, ensure to share it in your answer file.

- For your convenience, you can utilize the [Rockyou.txt wordlist](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt).

#### Command for Dictionary Attack:

```
hydra -V -s 2222 -l sylvain -P rockyou.txt 127.0.0.1 ssh -t 64
```

This command uses Hydra to perform a brute-force attack on the SSH service running on the local machine (`127.0.0.1`) with the specified username (`sylvain)` and a password dictionary (`rockyou.txt`). The attack is executed with verbose output (-V) and 64 concurrent tasks (`-t 64`).

##### Command Explanation:

* `hydra`: This command-line tool is used for performing brute-force attacks on various types of network services.
* `-V`: Enables verbose mode, providing detailed output during the attack.
* `-s 2222`: Specifies the port number (`2222`) on which the SSH service is running.
* `-l sylvain`: Specifies the username (`sylvain`) to be targeted for the brute-force attack.
* `-P rockyou.txt`: Specifies the password dictionary (`rockyou.txt`) to be used for attempting login combinations.
* `127.0.0.1`: Specifies the IP address (`127.0.0.1`) of the target machine, in this case, the local machine where the Docker container is running.
* `ssh`: Indicates the service (SSH) on which the brute-force attack will be performed.
* `-t 64`: Sets the number of parallel tasks to be executed during the attack, in this case, `64` concurrent tasks.

**File:** [1-dictionary_attack](1-dictionary_attack)

## Author

- [Peter Opoku-Mensah](https://github.com/deezyfg)