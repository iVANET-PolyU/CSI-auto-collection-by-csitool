# Table of contents

- [Table of contents](#table-of-contents)
- [Installation](#installation)
- [Preparation](#preparation)
    - [Folders need to create](#folders-need-to-create)
    - [collect.exp](#collect.exp)
    - [receiver.sh](#receiver.sh)
    - [trans.exp](#trans.exp)
    - [transfer.sh](#transfer.sh)
- [Collection process](#collection-process)


# Installation
[(Back to top)](#table-of-contents)

By default, the device that collects csi is running under **Linux** and has already installed **csi-tool**.

The **bash shell** required to run the scripting is installed by default on linux systems, and we also need to install **expect** for interactive communication.

For example, in debian we can install expect in terminal using the command below:

```apt-get install expect```

# Preparation
[(Back to top)](#table-of-contents)

As the codes contains configuration information for the devices, we need to modify some of the codes before running the script. We also need to create folders in the devices where we can save the csi files.

### Folders need to create
[(Back to top)](#table-of-contents)

In the hmb pro (used for collecting csi), we need to create two folders: one for saving csi files which are generated from csi-tool, the other one for saving csi files which have been transfered.

```
mkdir file_path     # folder for saving csi files, e.g. /home/debian/Desktop/data_files
sudo chmod 777 file_path
mkdir file_sent_path     # folder for saving csi files which have been transfered, e.g. /home/debian/Desktop/data_files_sent
sudo chmod 777 file_sent_path
```

For the receiver to which we want to transfer the csi files, we also need to create a folder for receiving csi files.

```
mkdir file_received_path
sudo chmod 777 file_received_path
```

### collect.exp
[(Back to top)](#table-of-contents)

Row 2: Change "/home/debian/" to be the absolute path of the folder **linux-80211n-csitool-supplementary**. The double inverted commas "" need to be retained.

Row 3: Change "password" to be the password of user. The double inverted commas "" need to be retained.

Row 5: The time after timeout is the time you want to stop the collection, you can change it to any value you want to set.

### receiver.sh
[(Back to top)](#table-of-contents)

Row 2 & 4: Change the ip address to be the ip of hmb pro

### trans.exp
[(Back to top)](#table-of-contents)

Row 3: Change "username" to be the username of the receiver to which we want to transfer the csi files. The double inverted commas "" need to be retained.

Row 5: Change "password" to be the password of user. The double inverted commas "" need to be retained.

Row 6: Change "ip addr" to be the ip of the receiver. The double inverted commas "" need to be retained.

Row 7: Change the path after "scp" to be **file_path** (create in [Folders need to create](#folders-need-to-create)); and change the path after "$user@$add:" to be **file_received_path** (create in [Folders need to create](#folders-need-to-create)).

### transfer.sh
[(Back to top)](#table-of-contents)

Row 3: data_path=**file_path**

Row 15: Change the path after {filename} to be **file_sent_path** (create in [Folders need to create](#folders-need-to-create)).

# Collection process
[(Back to top)](#table-of-contents)

Step 1: In hmb pro, run csi-tool initialization command before data collection. Then open two terminals and enter into root mode.

Step 2: In laptop, after connecting to AP and setting up the ip configration, open a terminal and enter into root mode and start running ```ping``` command to keep sending packages hmb pro (just set parameter ```-i```)

Step 3: In hmb pro, first run ```bash transfer.sh``` command in one terminal and then run ```bash receiver.sh``` command in the other terminal.

Step 4: Press Ctrl+Z to stop collectting csi or set timeout in the commands before running them. 

Note: collect.exp, receiver.sh, te.ss, trans.exp, transfer.sh should place in the same folder in hmb pro.