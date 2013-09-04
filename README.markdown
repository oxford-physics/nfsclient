# nfsclient #

This is the nfsclient module. It can be use to mount and unmount nfs directories.

It uses hiera hash to get all configuration data from hiera. Example of hiera data to mount two directories

```
nfsclient::params::mount_dir:
  '/local_area':
        owner: root
        group: root
        mode: 0644
  '/software_area':
        owner: root
        group: root
        mode: 0644
nfsclient::params::mount_point:
   '/software_area':
         device  : "server:/softwaresl6"
         fstype  : "nfs"
         ensure  : "absent"
         options : "nfsvers=3,tcp,noatime,hard,intr,exec,rw,bg,nosuid"
         atboot  : true

   '/local_area':
         device  : "server:/localareasl6"
         fstype  : "nfs"
         ensure  : "mounted"
         options : "nfsvers=3,tcp,noatime,hard,intr,exec,rw,bg,nosuid"
         atboot  : true
```


Directories can be unmounted by changing "mounted" to "absent"

Limitation : I could n't manage to chain two 'create_resource' statements. So sometimes if dir is not created first then mount fails but eventually in two puppet run it will be mounted 


