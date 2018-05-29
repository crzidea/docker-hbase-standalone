#!/usr/bin/env sh
/hbase/bin/start-hbase.sh >/dev/null
tail -f $HBASE_LOG_DIR/*.log
