mkdir -p /tmp/rep/cache /tmp/rep/jupyter /tmp/rep/local/share/jupyter 
chown -R rep:rep /tmp/rep
runuser - rep --command="export XDG_CACHE_HOME='/tmp/rep/cache' && export JUPYTER_CONFIG_DIR='/tmp/rep/jupyter' && export JUPYTER_DATA_DIR='/tmp/rep/local/share/jupyter' && jupyter lab --ip='*' --ServerApp.port=8889 --no-browser --ServerApp.token='' --ServerApp.base_url='/jupyter' &> /dev/null &"
