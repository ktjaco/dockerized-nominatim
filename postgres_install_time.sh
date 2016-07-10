#!/bin/bash

# Turn off postgresql fsync and full_page_writes, initially.
# See: http://wiki.openstreetmap.org/wiki/Nominatim/Installation#PostgreSQL_Tuning

sed -i \
    -e "s/#fsync = on/fsync = off/" \
    -e "s/#full_page_writes = on/full_page_writes = off/" \
    -e "s/shared_buffers = 128MB/shared_buffers = 4GB/g" \
    -e "s/#maintenance_work_mem = 16MB/maintenance_work_mem = 16GB/g" \
    -e "s/#work_mem = 1MB/work_mem = 50MB/g" \
    -e "s/#effective_cache_size = 128MB/effective_cache_size = 24GB/g" \
    -e "s/#synchronous_commit = on/synchronous_commit = off/g" \
    -e "s/#checkpoint_segments = 3/checkpoint_segments = 100/g" \
    -e "s/#checkpoint_timeout = 5min/checkpoint_timeout = 10min/g" \
    -e "s/#checkpoint_completion_target = 0.5/checkpoint_completion_target = 0.9/g" \
    -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" \
    /etc/postgresql/9.3/main/postgresql.conf
