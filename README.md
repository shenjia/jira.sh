Jira.sh
=====================

A shell fascade for JIRA 4.4 RESTful API.

For other JIRA versions, please edit `jira-config.sh`, update `jira-api` with right uri.

Installation
--------------------------

1. Clone this repository to your computer, then edit `jira-config.sh`, update `JIRA_USER` and `JIRA_PASS`.

2. Add below line to your `~/.bashrc` file

    ```
    ". /path/jira.sh" 
    ```

3. Enjoy it!

Usage
--------------------------

    ```
    # get title of issue XX-3331
    title XX-3331

    # build svn commit command (need confirmed)
    ci XX-3331
    svn commit -m "XX-3331 xxxxx" ? (y/n)

    # multi-files supported (need confirmed)
    ci XX-3331 a.php b/c.php
    svn commit a.php b/c.php -m "XX-3331 xxxxx" ? (y/n)
    ```

