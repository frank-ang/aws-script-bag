# install Oracle SQLPlus client and connect to Oracle

## Install client

Reference from:
https://oracle-base.com/articles/misc/oracle-instant-client-installation#yum

```
# (Optional) Get the latest repository info.
cd /etc/yum.repos.d
rm -f public-yum-ol7.repo
wget https://yum.oracle.com/public-yum-ol7.repo

# Enable the instant client repository.
yum install -y yum-utils
yum-config-manager --enable ol7_oracle_instantclient

# (Optional) Check what packages are available.
yum list oracle-instantclient*

# Install basic and sqlplus.
yum install -y oracle-instantclient18.3-basic oracle-instantclient18.3-sqlplus
```

Update *~/.bash_profile*

```
export CLIENT_HOME=/usr/lib/oracle/18.3/client64
export LD_LIBRARY_PATH=$CLIENT_HOME/lib
export PATH=$PATH:$CLIENT_HOME/bin
```

## Connect

```
export DB_HOST=REPLACEME

sqlplus "admin@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=$DB_HOST)(Port=1521))(CONNECT_DATA=(SID=ORCL)))"
```

