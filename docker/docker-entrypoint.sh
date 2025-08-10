#! /bin/bash
cd /scripts
uvicorn server:app --reload --host 127.0.0.1 --port 8123 --log-level info --access-log --use-colors &

sleep 1s

cd /
echo "[bento_entrypoint] /bento $@"
exec /bento $@
