# Command line for the win

This project focuses on improving command-line skills by completing CMD CHALLENGE tasks and practicing SFTP file transfers.


# Background Context
[CMD CHALLENGE](https://cmdchallenge.com/) is a pretty cool game challenging you on Bash skills. Everything is done via the command line and the questions are becoming increasingly complicated. It’s a good training to improve your command line skills!

*This project is NOT mandatory* at all. It is 100% optional. Doing any part of this project will add a project grade of over 100% to your average. Your score won’t get hurt if you don’t do it, but if your current average is greater than your score on this project, your average might go down. Have fun!


# Requirements

## General
* A `README.md` file, at the root of the folder of the project, is mandatory
* This project will be manually reviewed.
* As each task is completed, the name of that task will turn green
* Create a screenshot, showing that you completed the required levels
* Push this screenshot with the right name to GitHub, in either the PNG or JPEG format


## Specific

In addition to completing the project tasks and submitting the required `screenshots` to `GitHub`, you are also required to demonstrate the use of the `SFTP` (Secure File Transfer Protocol) command-line tool to move your local screenshots to the sandbox environment.

**References:**

* [SFTP Guide]()
* [SFTP File Transfer Tutorial]()


## Steps to follow in using SFTP Command-Line Tool for File Transfer

To use the SFTP (Secure File Transfer Protocol) command-line tool to connect from a local machine to a remote server and upload files, follow these steps:

1. **Take Screenshots:** Take the `screenshots` of the completed levels as mentioned in the `general` requirements.

2. **Open Terminal:** Open a terminal or command prompt on your local machine.

3. **Connect to Sandbox:** Use the 'sftp' command to establish a connection to the sandbox environment by running the following command:

```
sftp username@hostname
```

Replace 'username' with your actual username and 'hostname' with the actual hostname or IP address provided for the remote server.

4. **Authenticate:** Enter your password when prompted to authenticate and establish the connection to the remote server.

5. **Navigate to Remote Directory:** Once connected, use the 'cd' command to navigate to the directory on the remote server where you want to upload files:

```
cd /path/to/remote/directory
```
Replace `'/path/to/remote/directory'` with the actual path to the directory on your local machine.

6. **Upload Files:**  To upload files from your local machine to the remote server, use the 'put' command together with the '-r' option to recursively upload directories and their contents followed by the path to the local file or directory you want to upload:

```
put -r /path/to/local/file_or_directory
```

Replace `'/path/to/local/file_or_directory'` with the actual path to the file or directory on your local machine.

7. **Confirm Upload:** After executing the 'put' command, verify that the files have been successfully uploaded by listing the contents of the remote directory:

```
ls
```

8. **Exit SFTP Session:** Once you have finished transferring files, exit the SFTP session by typing:

```
exit
```

9. **Confirmation:** Confirm that the files have been transferred to the remote server by accessing the remote directory using other methods, such as SSH or SFTP clients.

10. **Push to GitHub:** Once the screenshots are transferred, you can proceed to push the screenshots to GitHub as mentioned in the initial requirements.


## NOTE :
The screenshoots of completed level should be inside the dir `/root/alx-system_engineering-devops/command_line_for_the_win/`


# Manual QA Review
**It is your responsibility to request a review for this project from a peer. If no peers have been reviewed, you should request a review from a TA or staff member.**



***Below are the outlined tasks for the project:***

## Advanced Tasks

### 0. First 九 tasks

Complete the first 9 tasks. 

### 1. Reach חי completed tasks

Complete the 9 next tasks, getting to 18 total.
 
### 2. Reach the perfect cube, 27

Complete the 9 next tasks, getting to 27 total.