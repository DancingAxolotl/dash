#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.dashcore/mbmd.pid file instead
dash_pid=$(<~/.dashcore/testnet3/mbmd.pid)
sudo gdb -batch -ex "source debug.gdb" mbmd ${dash_pid}
