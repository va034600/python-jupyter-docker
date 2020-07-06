FROM python:3.6.8

WORKDIR /usr/src/app

RUN pip install --upgrade pip && pip install pipenv
COPY ./Pipfile /usr/src/app/Pipfile
RUN pipenv install --system --skip-lock

CMD python main_project/manage.py runserver 0.0.0.0:8000

EXPOSE 8000
