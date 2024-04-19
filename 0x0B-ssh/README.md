# 0x0B. SSH

This project is centered on mastering Secure Shell (SSH) protocols and practices, particularly within the domains of DevOps, Network Administration, System Administration, and Security to establish secure and efficient communication between systems by exploring key aspects of SSH, such as key pair management, client configuration, and authentication mechanisms.  Through hands-on learning experiences, the project aims to equip participants with essential skills for securely managing remote servers and network infrastructure, ensuring strong security and smooth operation across various IT environments.

---

## Table Of Contents

1. [Background Context](#background-context)
2. [Resources](#resources)
3. [Learning Objectives](#learning-objectives)
4. [Requirements](#requirements)
5. [Tasks](#tasks)
6. [Author](#author)

## Background Context

![SSH Background](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/244/zPVRKhPsUP5lK.gif)

Along with this project, you have been attributed an Ubuntu server, living in a datacenter far far away. Like level 2 of the application process, you will connect using `ssh`. But contrary to level 2, you will not connect using a password but an RSA key. We’ve configured your server with the public key you created in the first task of a [previous project](../0x04-loops_conditions_and_parsing/) shared in your **intranet profile.**

You can access your server information in the **my servers** section of the intranet, each line with contains the IP and username you should use to connect via `ssh`.

**Note:** Your server is configured with an Ubuntu 20.04 LTS environment.

## Resource

**Read or watch:**

- [What is a (physical) server - text](https://en.wikipedia.org/wiki/Server_%28computing%29#Hardware_requirement)
- [What is a (physical) server - video](https://www.youtube.com/watch?v=B1ANfsDyjeA)
- [SSH essentials](https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys)
- [SSH Config File](https://www.ssh.com/academy/ssh/config)
- [Public Key Authentication for SSH](https://www.ssh.com/academy/ssh/public-key-authentication)
- [How Secure Shell Works](https://www.youtube.com/watch?v=ORcvSkgdA58)
- [SSH Crash Course](https://www.youtube.com/watch?v=hQWRp-FdTpc) (*(Long, but highly informative. Watch this if configuring SSH is still confusing. It may be helpful to watch at x1.25 speed or above.*)

### For reference:

- [Understanding the SSH Encryption and Connection Process](https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process)
- [Secure Shell Wiki](https://en.wikipedia.org/wiki/Secure_Shell)
- [IETF RFC 4251 (Description of the SSH Protocol)](https://www.ietf.org/rfc/rfc4251.txt)
- [Internet Engineering Task Force](https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force)
- [Request for Comments (RFCs)](https://en.wikipedia.org/wiki/Request_for_Comments)

**man or help:**

* `ssh`
* `ssh-keygen`
* `env`

## Learning Objectives

At the end of this project, you are expected to be able to [explain to anyone](https://fs.blog/feynman-learning-technique/), **without the help of Google:**

## Requirements

### General

* Allowed editors: `vi`, `vim`, `emacs`
* All your files will be interpreted on Ubuntu 20.04 LTS
* All your files should end with a new line
* A `README.md` file, at the root of the folder of the project, is mandatory
* All your Bash script files must be executable
* The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
* The second line of all your Bash scripts should be a comment explaining what is the script doing

## Your Servers

| Name           | Username | IP            | State    | Actions                      |
|----------------|----------|---------------|----------|------------------------------|
| 530428-web-01  |          |               | pending  | Soft boot \| Hard boot \| Ask a new server |

### How To Get Your Server:

To obtain your server, navigate to the section labeled 'Your Servers' on the project page. Click on 'Actions' and select 'Ask a new server'. This action will initiate the provisioning of your server. Please note that it may take some time for the server setup to complete. Once the setup is finished, your server information will be displayed on the page. While the server is being provisioned, its state will be shown as 'pending'. Once the setup is complete, the state will change to 'running'.

### Adding SSH Public Key to Server (On Local Machine)

To add an SSH public key to your server, follow these steps:

1. Navigate to your SSH directory using the cd command. Typically, the SSH directory is located within your home directory. You can navigate to it by typing:
```
cd ~/.ssh
```

2. Connect to your server by running the following command, replacing `<your_server_ip>` with the actual IP address of your server:
```
ssh ubuntu@<your_server_ip>
```

3. List the contents of the SSH directory to confirm you're in the right location:
```
ls -la
```

Alternatively, you can specifically list the `.ssh` directory:
```
ls .ssh
```

3. View the contents of the `authorized_keys` file to check if any public keys are already added:
```
cat .ssh/authorized_keys
```

4. To add your SSH public key to the `authorized_keys` file, use the following command, replacing `<ssh_public_key>` with your actual public key:
```
echo "<ssh_public_key>" >> .ssh/authorized_keys
```

or

```
echo "<ssh_public_key>" >> .ssh/auth*
```

This command appends your public key to the `authorized_keys` file, allowing you to connect to the server using the `ubuntu` user.

Replace `<ssh_public_key>` with the actual SSH public key you want to add to the server.


### Automating Server Login

To save time logging into your server, you can automate the process using a script. Follow these steps:

1. Open a text editor like Emacs and create a new file named web01.

2. Paste the following command into the file:
```
ssh ubuntu@<your_server_ip>
```
Replace <your_server_ip> with the actual IP address of your server. This command will connect you to your server.

3. Save the file and exit the text editor.

4. Make the script executable by running the following command:
```
chmod u+x web01
```

5. Now, whenever you want to connect to your server, simply run the script:
```
./web01
```

This will log you into your server automatically, saving you the hassle of manually entering the SSH command and server IP address each time.

To ensure you can use this script from anywhere on your device, follow these additional steps:

1. Move the script to the /bin directory by running the following command:
```
sudo mv web01 /bin
```
You will be prompted to enter your password after running this command.

2. After entering your password, you can use the script from anywhere on your device. Simply type:
```
web01
```
This will connect you to your server without needing to specify the directory or use the ./ prefix.


## Tasks

<details>
<summary><a href="./0-use_a_private_key">0. Use a private key</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/yW4gBSpM/image.png' border='0' alt='image'/></a><br>
<strong>File:</strong> <a href="./0-use_a_private_key">0-use_a_private_key</a>
</details>


<details>
<summary><a href="./1-create_ssh_key_pair">1. Create an SSH key pair</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/pXPbpdbx/image.png' border='0' alt='image'/></a><br>
<strong>File:</strong> <a href="./1-create_ssh_key_pair">1-create_ssh_key_pair</a>
</details>


<details>
<summary><a href="./2-ssh_config">2. Client configuration file</a></summary><br>
<a href='https://postimg.cc/Hjb2CMHK' target='_blank'><img src='https://i.postimg.cc/y6brchGV/image.png' border='0' alt='image'/></a><br>
<strong>File:</strong> <a href="./2-ssh_config">2-ssh_config</a>
</details>


<details>
<summary>3. Let me in!</summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/3N2k9F3k/image.png' border='0' alt='image'/></a>
</details>


<details>
<summary><a href="./100-puppet_ssh_config.pp">4. Client configuration file (with Puppet)</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/ryBvRXzV/image.png' border='0' alt='image'/></a><br>
<ul><li>Install the puppet stdlib module:</li></ul>
<pre>sudo puppet module install puppetlabs-stdlib</pre>
<strong>File:</strong> <a href="./100-puppet_ssh_config.pp">100-puppet_ssh_config.pp</a>
</details>

---

## Author

- [Peter Opoku-Mensah](https://github.com/deezyfg)