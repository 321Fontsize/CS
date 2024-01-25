# Class 4

- ```
    $ ssh myserver 'journalctl | grep sshd | grep "Disconnected from"' > ssh.log
    $ less ssh.log
  ```

- ```
ssh myserver journalctl
 | grep sshd
 | grep "Disconnected from"
 | sed 's/.*Disconnected from //'
  ```

- ```
ssh myserver journalctl
 | grep sshd
 | grep "Disconnected from"
 | sed  -E 's/.*Disconnected from (invalid |authenticating )?user (.*) [^ ]+ port [0-9]+( \[preauth\])?$/\2/'
  ```
 Based upon above, we can add 
 ```
 | sort | uniq -c
 | sort -nk1,1 | tail -n10
 | awk '{print $2}' | paste -sd,
 ```