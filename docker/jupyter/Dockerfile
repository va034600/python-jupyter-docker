FROM main-project:1.0.0

WORKDIR /usr/src/app

COPY .jupyter /usr/src/app/.jupyter

# jupyter
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs npm
RUN pip install jupyterlab
RUN jupyter labextension install \
  @lckr/jupyterlab_variableinspector \
  @krassowski/jupyterlab-lsp \
  @axlair/jupyterlab_vim
RUN pip install jupyter-lsp python-language-server[all]
RUN jupyter lab build

# library
RUN pip install pandas lxml html5lib beautifulsoup4 matplotlib

CMD python main_project/manage.py runserver 0.0.0.0:8000 & jupyter lab --allow-root

EXPOSE 8888
EXPOSE 8000
