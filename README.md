# Mail Scanner

1. Configure the mail client inside `.fetchmailrc`. For example:

    ```console
    poll xmail.mwn.de proto IMAP
        port 993
        is root here
        ssl
        keep
        mda "/usr/bin/procmail -f %F -d %T"
    ```

    You should adjust the server, the protocol, and the port. Do not change the last line.

    You also need `.procmailrc`. You should not change anything in this file.

1. Build the image.

    ```console
    > docker image build -t mailscan .
    ```

1. Run the image interactively.

    ```console
    > docker container run -it mailscan:latest
    ```

1. Once inside the container, get your mail with your username. You will be prompted for your password. Note that only **unread** mails will be downloaded and be automatically marked as read.

    ```console
    > fetchmail -u ga12abc
    ```

1. Attachments will be downloaded to `~/attachments_mail`. Scan that folder for viruses.

    ```console
    > clamscan --recursive ~/attachments_mail/
    ```
