runuser - rep --command="jupyter notebook --ip='*' --NotebookApp.port=8889 --no-browser --NotebookApp.token='' --NotebookApp.base_url='/notebook' &> /dev/null &"
runuser - rep --command="jupyter lab --ip='*' --NotebookApp.port=8890 --no-browser --NotebookApp.token='' --NotebookApp.base_url='/jupyterlab' &> /dev/null &"
