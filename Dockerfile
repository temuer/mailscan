FROM debian:stable-slim

# Install dependencies
RUN apt update && \
    apt upgrade -y && \
    apt install \
        clamav \
        clamav-freshclam \
        fetchmail \
        procmail \
        mpack -y

# Install antivirus database
RUN freshclam

# Prepare workspace
WORKDIR /root/
COPY .fetchmailrc .procmailrc ./
RUN chmod 600 .fetchmailrc
RUN mkdir -p attachments_mail

ENTRYPOINT ["/bin/bash"]