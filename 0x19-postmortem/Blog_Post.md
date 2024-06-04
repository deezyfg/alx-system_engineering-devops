# Postmortem: Web Stack Debugging Outage

![Flogging a dead horse](post-mortem-meetings.jpg)

## Issue Summary:

* **Duration:** 2024-06-01, 14:00 - 15:30 UTC (1 hour 30 minutes)
* **Impact:** The WordPress site running on a LAMP stack was down, returning HTTP `500` errors. Approximately **`90%`** of users experienced site inaccessibility.
* **Root Cause:** A typographical error in the WordPress configuration file (`wp-settings.php`) where `.phpp` was mistakenly used instead of `.php` caused the server to fail to load the necessary files.

## Timeline:
* **14:00 UTC:** Issue detected by an automated monitoring alert indicating HTTP `500` errors.
* **14:05 UTC:** Incident escalated to the web stack support team.
* **14:10 UTC:** Initial investigation began by checking Apache logs and error messages.
* **14:15 UTC:** Ran `strace` on the Apache process to trace system calls.
* **14:20 UTC:** Identified a **"No such file or directory"** error for a `.phpp` file.
* **14:25 UTC:** Misleading assumption that Apache configuration might be corrupt. Checked Apache configuration files.
* **14:35 UTC:** Corrected focus to the WordPress files after another `strace` run showed repeated `.phpp` errors.
* **14:45 UTC:** Located the typo in `wp-settings.php` using `grep`.
* **14:50 UTC:** Applied the fix manually by changing `.phpp` to `.php`.
* **15:00 UTC:** Automated the fix using **Puppet script** to ensure consistency.
* **15:15 UTC:** Restarted Apache server to apply changes.
* **15:30 UTC:** Verified the site was up and running, with HTTP `200` responses.

## Root Cause and Resolution:

### Root Cause:
The issue was caused by a typographical error in the `wp-settings.php` file of the WordPress installation. The file extension `.phpp` was mistakenly used instead of `.php`. This caused Apache to return HTTP `500` errors because it couldn't find the correct PHP files to execute.

### Resolution:

**1. Identified the Error with strace:** Used the `strace` tool to trace system calls and identified that Apache was trying to access a non-existent `.phpp` file, which caused the **"No such file or directory"** error.
**2. Located the Typo with `grep`:** Ran the `grep` command to search through the `wp-settings.php` file and pinpoint the incorrect `.phpp` references.
**3. Verified the Typo:** Confirmed the typo in the `wp-settings.php` file where `.phpp` was mistakenly used instead of `.php`.
**4.Automated Correction with Puppet:** Created a Puppet script to automate the correction of the typo, ensuring that `.phpp` was replaced with `.php` to prevent recurrence.
**5.Applied the Puppet Script:** Ran the Puppet script to fix the file extension in the `wp-settings.php` file.
**6.Restarted Apache:** Restarted the Apache server to apply the changes and restore normal service.

**Puppet Script:**

```
# Fixes bad "phpp" extensions to "php" in the WordPress file "wp-settings.php".

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
```

##### PARAMETERS:
* `sed`: Stream Editor, a command-line tool for text manipulation.
* `-i`: In-place editing. It tells sed to modify the file in place.
* `s/phpp/php/g`: This is a substitution expression that replaces all occurrences of `phpp` with `php`.
* `/var/www/html/wp-settings.php`: The path to the file for substitution
* `path`: The path attribute specifies the directories where the system should search for the command specified in the command attribute. In this case, `/usr/local/bin/:/bin/` are included in the search path.

By following these steps, the configuration error was corrected, and the website was brought back online.


## Corrective and Preventative Measures

### Improvements
* Implement regular code reviews to catch typographical errors in configuration files.
* Enhance monitoring to include specific checks for common configuration issues.
* Train team members on using diagnostic tools like `strace` more effectively.

### Tasks to Address the Issue:
* 🗒 Patch `wp-settings.php` file to correct `.phpp` to `.php`.
* 🗒 Add monitoring on server logs to detect specific **"No such file or directory"** errors.
* 🗒 Update Puppet scripts to include checks for common file extension errors.
* 🗒 Conduct a training session on using `strace` for debugging system calls.
* 🗒 Review and improve the deployment pipeline to include automated syntax checks for configuration files.