FROM ubuntu:16.04
USER root

LABEL maintainer="AirtonLira"


RUN apt-get update && \
    apt-get install -y curl wget sudo software-properties-common apt-transport-https


RUN curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - && \
    add-apt-repository "$(curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)"

RUN apt-get update && \
    apt-get -y install mssql-server-is

EXPOSE 1433

RUN mkdir packagessis
RUN mkdir packagessis/processed
RUN mkdir packagessis/data
RUN mkdir packagessis/data/accurate



COPY ./data/time_series_19-covid-Confirmed.csv /packagessis/data/time_series_19-covid-Confirmed.csv
COPY ./data/time_series_19-covid-Deaths.csv /packagessis/data/time_series_19-covid-Confirmed.csv
COPY ./data/time_series_19-covid-Recovered.csv /packagessis/data/time_series_19-covid-Recovered.csv


COPY ./desafio-radix-dw/Package.dtsx /packagessis/Package.dtsx

ENV PATH=/opt/ssis/bin:$PATH


RUN SSIS_PID=Express ACCEPT_EULA=Y /opt/ssis/bin/ssis-conf -n setup

WORKDIR /packagessis

#dtexec /F \Package.dtsx
