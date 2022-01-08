# LocalSetup Restore Scripts

---

## Creating Backup From Sql Dump from different Environments:

- [Process to generate Backup from Sql Dumps](./dump/readme.md)

---

## Install restore utility

- Install [Maven](https://maven.apache.org/) if it is still not installed.
- Clone Repository at `C:\opt` with below command:
  ```
  mkdir C:\opt
  cd C:\opt
  git clone https://github.com/amitkshirsagar13/restore-utility.git
  ```
- Run `install.restore.utility.bat` with Admin permissions
- Set `C:\opt\restore-utility` in Environment `PATH`
- Verify if Docker is running
- **Stop Any Existing LocalStack Container running in Docker**

## Update restore utility updates:

- Run `refresh.backup` to get latest updates for the repository and backups

### Test Docker Share working

Verify, if Windows share is working as expected

- Execute `test.backup`
- Output expected as below

```

-rwxrwxrwx    1 root     root             2 Mar  7 16:55 /data/test.me

```

### Check if MySQL Setup working

- Check if `C:\Program Files\MySQL\MySQL Server 5.7` exists or similar path exists
- If `C:\Program Files\MySQL\MySQL Server 5.7` exists, no change needed in `C:\opt\restore-utility\env.bat`
- If `C:\Program Files\MySQL\MySQL Server XXX` exists, then setup proper path in `env.bat` at `C:\opt\restore-utility` location for `MySQL Server xxx`

---

## Backup and Restore:

- Open cmd and follow below instructions

### List Backup/Restore Point

- If existing Restore/Backup exists, can be listed using `list.backup` or `list.backup <version>`

```
# List all Restore Points
list.backup

# Check if Restore/Backup exists with name <version>
list.backup <version>
```

> When creating Restore/Backup with `<version>` name, few suggested names, depending on what Data conditions you had set before creating backup.
>
> - clean
> - dev
> - test
> - 10xx

**(e.g. Sample `10xx` backup provided in this repository, can be imported using instructions from Export/Import Backup sections)**

### Create Backup/Restore Point

Use below instructions to Setup Database and LocalStack

- Before you take backup make sure localstack is started with below command only.

  ```
  localstack.start
  ```

  Note: 0.12.15 is latest test localstack version at the day this readme was updated, but it

- Create Restore Point by `create.backup` or `create.backup <version>` restore point with name `<version>` will be created
- Before Running `create.backup` or `create.backup <version>`, command first time, make sure you have clean and recreated database once manually with all RFQ/Proposal/PO statuses as per your need.
- After your data is in mysql, and localstack, once you run this command, the snapshot of the data will be created.
  > - Create any additional Users
  > - Set Any Preconditions like Feature Enabled/Disabled status
  > - Pricing Material and Technology preferences
- All Above settings will be backed up and available when restored

```
# Default
create.backup <version>

# Create Restore Point with version name
create.backup <version>

```

---

### Restoring the MySQL and LocalStack Backup

- **_No Need to Stop `MicroServices`_**
- Restore to Original Point by `restore.backup` or or `restore.backup <version>`
- This will restore localstack and MySQL database both in the point/time when backup was created.
- You can run below restore.backup with any available label, and it will be replaced and should reflect in `Angular UI` without restarting any `Backend Services`

```
# Default last restore Point to be used
restore.backup

# Use <version> named restore point
restore.backup <version>
```

**_Note: If Application has new sql migration scripts added, we will need to run corresponding `mvn flyway:migrate` in corresponding project module folder to allow Database to be updated with latest changes. Once this is done, you can replace the backup by using `create.backup version`, this will ensure that the backup is updated till latest changes_**

---

## Export/Import Backup for sharing with Users

### Export Backup version to share with user (someone)

- Get the id (e.g. `you`) for the user with whome you want to share backup
- Export the version with `someone` and share the folder location with that user as mentioned in the log.

```
# For specific user share, in Folder location <you>
export.backup version <someone>

# For generic share, in Folder location xxxxxxxxx

export.backup version
```

### Import Backup version

- If Backup was exported with `someone`, then it can be directly copied to `C:\opt\restore-utility\` location and use `restore.backup version` to restore imported backup
- If Backup was exported without `someone` from `xxxxxxxxx` folder then paste the backup folder to `import` folder and run below command.

```
import.backup version
restore.backup version
```

---

## Useful commands list:

```
# Default Last Restore Point to create, list or restore
list.backup
create.backup
restore.backup

# For specific version/name restore point to create, list or restore
list.backup version
create.backup version
restore.backup version


# Export Backup for generic share with everyone
export.backup version

# Export Backup to share with specific user with someone
export.backup version someone


# Import generic backup from xxxxxxxxx folder with label `version`
import.backup version

```

---

## Import Sample Backup and Restore

We have included one backup as `10xx`, to give head start.

- Run Below commands in sequence.

  ```
  list.backup

  import.backup 10xx
  restore.backup 10xx
  ```

- Start all MicroServices
- Start Angular Server and see if the 10 xx are displayed correctly.

## Configure Postman for Import Order and ClientId and ClientSecret

You can import the collections from postman folder in postman application and will be working with existing dev database backup
