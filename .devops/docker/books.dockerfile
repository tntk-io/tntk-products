FROM python:3.10-slim AS build
ENV DONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /code
COPY ./books/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.10-slim 
WORKDIR /code
COPY --from=build /usr/local/ /usr/local/
COPY ./books ./books
COPY ./root ./root
COPY ./alembic ./alembic
COPY ./alembic.ini .

CMD ["python3", "-m", "uvicorn", "books.main:app", "--host=0.0.0.0", "--reload"]