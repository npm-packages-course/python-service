FROM python:3.9.0
ENV PYTHONUNBUFFERED 1
RUN pip install pipenv
WORKDIR /app
COPY Pipfile* ./
RUN pipenv lock --requirements > requirements.txt
RUN pip install -r requirements.txt
COPY ./src ./
CMD python manage.py runserver 0.0.0.0:8000