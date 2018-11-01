FROM ibmcom/db2express-c:latest

ENV REFRESHED_AT=2018-10-31

# Copy the repository's app directory.

COPY ./app /app

# Run-time command

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/bin/bash"]
