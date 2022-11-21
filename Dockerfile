FROM ubuntu:14.04 

# Update packages
RUN apt-get update -y

# Install Python Setuptools
RUN apt-get install -y python-setuptools git telnet curl

# Install pip
RUN curl -LO  https://bootstrap.pypa.io/pip/3.4/get-pip.py
RUN python3 get-pip.py

# Bundle app source
ADD . /src
WORKDIR /src

# Add and install Python modules
RUN pip install Flask

# Expose
EXPOSE 5000

# Run
CMD ["python", "entry.py"]
