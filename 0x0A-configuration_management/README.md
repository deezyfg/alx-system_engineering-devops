# 0x0A. Configuration management

This project revolves around implementing a strong configuration management system using Puppet to efficiently and consistently manage software and system configurations. Through the integration of DevOps practices, SysAdmin optimization, scripting automation, and the establishment of continuous integration and continuous deployment (CI/CD) pipelines, the project aims to create a seamless and agile environment for configuration management, drawing inspiration from real-world incidents such as the Skynet incident at SlideShare, highlighting the critical importance of such a system.

---

## Table Of Contents

1. [Background Context](#background-context)
2. [Resources](#resources)
3. [Learning Objectives](#learning-objectives)
4. [Requirements](#requirements)
5. [Tasks](#tasks)
6. [Author](#author)

## Background Context

When I was working for SlideShare, I worked on an auto-remediation tool called [Skynet](https://engineering.linkedin.com/slideshare/skynet-project-_-monitor-scale-and-auto-heal-system-cloud) that monitored, scaled and fixed Cloud infrastructure. I was using a parallel job-execution system called MCollective that allowed me to execute commands to one or multiple servers at the same time. I could apply an action to a selected set of servers by applying a filter such as the server’s hostname or any other metadata we had (server type, server environment…). At some point, a bug was present in my code that sent `nil` to the filter method.

There were 2 pieces of bad news:

1. When MCollective receives `nil` as an argument for its filter method, it takes this to mean ‘all servers’
2. The action I sent was to terminate the selected servers
I started the parallel job-execution and after some time, I realized that it was taking longer than expected. Looking at logs I realized that I was shutting down SlideShare’s entire document conversion environment. Actually, 75% of all our conversion infrastructure servers had been shut down, resulting in users not able to convert their PDFs, powerpoints, and videos… Pretty bad!

Thanks to Puppet, we were able to restore our infrastructure to normal operation in under 1H, pretty impressive. Imagine if we had to do everything manually: launching the servers, configuring and linking them, importing application code, starting every process, and obviously, fixing all the bugs (you should know by now that complicated infrastructure always goes sideways)…

Obviously writing Puppet code for your infrastructure requires an investment of time and energy, but in the long term, it is for sure a must-have.

## Resource

**Read or watch**

- [Intro to Configuration Management](https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management)
- [Puppet resource type: file](https://puppet.com/docs/puppet/5.5/types/file.html) (*Check "Resource types" for all manifest types in the left menu*)
- [Puppet’s Declarative Language: Modeling Instead of Scripting](https://puppet.com/blog/puppets-declarative-language-modeling-instead-of-scripting/)
- [Puppet lint](http://puppet-lint.com/)
- [Puppet emacs mode](https://github.com/voxpupuli/puppet-mode)
- [Puppet CookBook](https://www.puppetcookbook.com/)

## Learning Objectives

At the end of this project, you are expected to be able to [explain to anyone](https://fs.blog/feynman-learning-technique/), **without the help of Google:**

## Requirements

### General

* All your files will be interpreted on Ubuntu 20.04 LTS
* All your files should end with a new line
* A `README.md` file at the root of the folder of the project is mandatory
* Your Puppet manifests must pass `puppet-lint` version 2.1.1 without any errors
* Your Puppet manifests must run without error
* Your Puppet manifests first line must be a comment explaining what the Puppet manifest is about
* Your Puppet manifests files must end with the extension `.pp`

## Note on Versioning

Your Ubuntu 20.04 VM should have Puppet 5.5 preinstalled.

To check if Puppet is preinstalled on your `Ubuntu 20.04 VM`, you can use the `dpkg` command, which is the package manager for Debian-based systems like `Ubuntu`. Here's how you can do it:

```bash
dpkg -l | grep puppet

```

### **`Puppet` Installation**

#### Pre-installation Requirements

Before installing **Puppet**, ensure that the following dependencies are installed:

- **Ruby**: Required for Puppet.
- **Ruby Augeas**: A Ruby binding for the Augeas configuration library.
- **Ruby Shadow**: A Ruby interface for the system shadow password database.
- **Puppet**: The configuration management tool itself.

##### Installation

Install the dependencies and `Puppet` using the following commands:

```
$ sudo apt-get install -y ruby=1:2.7+1 --allow-downgrades
```
*This command installs Ruby version 2.7 (specifically `version 1`) which is compatible with `Puppet`.*

```
$ sudo apt-get install -y ruby-augeas
```
*This command installs the Ruby binding for Augeas, which Puppet may require for certain configurations.*

```
$ sudo apt-get install -y ruby-shadow
```
*This command installs the Ruby interface for managing system shadow passwords, which Puppet may utilize.*

```
$ sudo apt-get install -y puppet
```
This command installs Puppet, the configuration management tool itself.

You do **not** need to attempt to upgrade versions. This project is simply a set of tasks to familiarize you with the basic level syntax which is virtually identical in newer versions of Puppet.

For more information, refer to the [Puppet 5 Documentation](https://www.puppet.com/docs/puppet/5.5/puppet_index.html)

### **`Puppet-Lint` Installation**

Install **`puppet-lint`** using gem by executing the following command:

```
$ gem install puppet-lint
```

### Confirm Installations By Checking Versions:

#### **`For Puppet`:**

```
$ puppet --version
```

**Alternatively:**

```
$ puppet -V
```

#### **`For puppet-lint`:**

```
$ puppet-lint --version
```

**Alternatively:**

```
$ puppet-lint --v
```

*These commands will display the respective version numbers, confirming the successful installation of `puppet` and `puppet-lint`.*


### Additional Troubleshooting

If you encounter errors during Puppet installation or when running `Puppet` commands, try the following:

* **Updating Puppet Repository:** If `Puppet` is not preinstalled or you encounter version conflicts, update the `Puppet` repository and install `Puppet 7`:

  - Download the Puppet 7 release package for Ubuntu 20.04:
    ```bash
    wget https://apt.puppet.com/puppet7-release-focal.deb
    ```
    This command downloads the Puppet 7 release package for Ubuntu 20.04.

  - Install the downloaded Puppet 7 release package:
    ```bash
    dpkg -i puppet7-release-focal.deb
    ```
    This command installs the downloaded Puppet 7 release package.

  - Update the local package index to reflect the changes made by installing the Puppet 7 release package:
    ```bash
    apt-get update
    ```

  - Install Puppet Agent (the Puppet client) and Puppet Lint (a tool for checking Puppet code syntax) with the `-y` flag, which automatically answers "yes" to any prompts to confirm the installation:
    ```bash
    apt-get install puppet-agent puppet-lint -y
    ```
    This command installs Puppet Agent (the Puppet client) and Puppet Lint (a tool for checking Puppet code syntax) with the `-y` flag, which automatically answers "yes" to any prompts to confirm the installation.


* **Setting Environment Variables:** If the **`puppet`** command is not found even after confirming its installation with `puppet --version`, you can set the necessary environment variables by sourcing the `puppet-agent.sh` script.

```
$ source /etc/profile.d/puppet-agent.sh
```

- **Rechecking Puppet Version:** After setting the environment variables, verify the `Puppet` version:

```
$ puppet --version
```

### Resolving Flask Installation Issues

If you encounter issues with Flask installation, such as import errors, follow these steps to tackle them:

#### 1. Apply Puppet Manifest:

Apply the Puppet manifest (`1-install_a_package.pp`) to install `Flask`:

```
$ puppet apply 1-install_a_package.pp
```

#### 2. Upgrade Werkzeug:

Upgrade Werkzeug to a compatible version (e.g., 2.1.1) using `pip`:

```
$ pip install Werkzeug==2.1.1
```

#### 3. Verify Flask Installation:

Check the version of Flask installed to ensure that the installation was successful:
```
$ flask --version
```

You should see output similar to:
```
Python 3.8.10
Flask 2.1.0
Werkzeug 2.1.1
```

For more detailed information, refer to [Flask Documentation.](https://flask.palletsprojects.com/en/3.0.x/)

## Tasks

<details>
<summary><a href="./0-create_a_file.pp">0. Create a file</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/NM2k46hX/image.png' border='0' alt='image'/></a><br>
<strong>File:</strong> <a href="./0-create_a_file.pp">0-create_a_file.pp</a>
</details>


<details>
<summary><a href="./1-install_a_package.pp">1. Install a package</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/PqVvKj7c/image.png' border='0' alt='image'/></a><br>
<strong>File:</strong> <a href="./1-install_a_package.pp">1-install_a_package.pp</a>
</details>


<details>
<summary><a href="./2-execute_a_command.pp">2. Execute a command</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/CxZFC13P/image.png' border='0' alt='image'/></a><br>
<strong>File:</strong> <a href="./2-execute_a_command.pp">2-execute_a_command.pp</a>
</details>


## Author

- [Peter Opoku-Mensah](https://github.com/deezyfg)