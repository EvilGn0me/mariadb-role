MariaDB Role
=========

This role installs mariadb.
This role written using [Ansible Codestyle](https://faunusaff.atlassian.net/wiki/spaces/DEVOPS/pages/634683425/Ansible+Codestyle)

How to use
======
First you need to setup mariadb_conf.root_password variable.
All other variables could be used as is. Default configuration uses 4 gb of memory.

~~~
mariadb_conf:
  root_password: 'change_me'
  networking: False
  zabbix_password: 'JQsDNy6Xx6g3eyx4'
  backup: True
  backup_dir: /srv/mariadb_backup
  server_config:
    - query_cache_size = 0
    - query_cache_type = 0
    - thread_cache_size = 4
    - innodb_file_per_table = ON
    - innodb_buffer_pool_size = 200M
    - innodb_lock_wait_timeout = 50
    - innodb_log_file_size = 16M
    - innodb_log_buffer_size = 32M
    - innodb_flush_log_at_trx_commit = 0
    - innodb_buffer_pool_instances = 4
    - innodb_flush_method = O_DIRECT
    - join_buffer_size = 2M
    - key_buffer_size = 1M
    - sort_buffer = 1M
    - read_buffer_size = 1M
    - tmp_table_size = 128M
    - max_heap_table_size = 128M
    - table_cache = 4096
    - max_allowed_packet = 128M
    - init_connect='SET collation_connection = utf8_general_ci'
    - init_connect='SET NAMES utf8'
    - transaction-isolation = READ-COMMITTED
    - character-set-server = utf8
    - collation-server = utf8_general_ci
    - skip-character-set-client-handshake
    - log-error=/var/log/mysqld.log
    - skip-name-resolve
~~~

Zabbix support
======
To enable zabbix support you should setup zabbix_url variable

Also your inventory should contain zabbix variables for host.
Example:
~~~
zabbix_url: 'http://zabbix.example.com'   # host url for zabbix server
zabbix_user: 'Admin'                      # username
zabbix_pass: 'change_me'                  # password
zabbix_dir: '/etc/zabbix/zabbix_agentd.d' # directory that contains userparameters
~~~
