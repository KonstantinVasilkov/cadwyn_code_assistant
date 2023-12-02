FROM python:3.11

RUN apt-get update && apt-get install -y git tree

WORKDIR /app

RUN mkdir -p /app/cadwyn

RUN git clone https://github.com/zmievsa/cadwyn.git
RUN pip install poetry
COPY pyproject.toml poetry.lock* /app/
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-dev

COPY . /app

WORKDIR /app

RUN tree -o ../cadwyn/cadwyn_project_tree.txt
