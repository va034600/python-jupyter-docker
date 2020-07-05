FROM python:3.6.8

WORKDIR /usr/src/app

# main_project
RUN pip install --upgrade pip && pip install pipenv
COPY ./Pipfile /usr/src/app/Pipfile
RUN pipenv install --system --skip-lock

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

# pd.read_html
RUN pip install pandas lxml html5lib beautifulsoup4

CMD python main_project/manage.py runserver 0.0.0.0:8000 & jupyter lab --allow-root

EXPOSE 8888
EXPOSE 8000
