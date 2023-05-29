# Docker based environment that supports EC2 metadata

This environment simulates applications and a fake EC2 metadata server and applications can access the fake server using the same address that is used inside the AWS network `169.254.169.254`, making applications that use the metadata endpoints to work locally.

## How to run
```
$ docker-compose up --build
```

## How to test
```
$ docker exec -it local-ec2-metadata_debug_1 curl http://169.254.169.254/latest/meta-data/instance-id
```
