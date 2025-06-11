FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache python3 py3-pip && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip

# Set the working directory
WORKDIR /opt/venv

# Copy requirements.txt into the container
COPY requirements.txt /opt/venv/requirements.txt

# Install dependencies using the correct flag
RUN /opt/venv/bin/pip install -r /opt/venv/requirements.txt

USER node

ENV PATH="/opt/venv/bin:$PATH"
