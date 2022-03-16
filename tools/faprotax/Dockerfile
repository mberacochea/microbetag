FROM python:3.9.10-slim-buster

RUN apt-get update && apt-get install build-essential -y

# Install Python dependencies for FAPROTAX script
RUN pip install numpy==1.22.3 biom-format==2.1.10

WORKDIR /home

COPY collapse_table.py collapse_table.py
COPY FAPROTAX.txt FAPROTAX.txt

ENV PATH="/home:${PATH}"