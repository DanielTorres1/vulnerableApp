# Dockerfile

FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y samba smbclient python3 && \
    rm -rf /var/lib/apt/lists/*

# Configure Samba
RUN mkdir -p /smbshare 
RUN echo "[smbshare]" >> /etc/samba/smb.conf
RUN echo "   path = /smbshare" >> /etc/samba/smb.conf
RUN echo "   read only = no" >> /etc/samba/smb.conf
RUN echo "   browsable = yes" >> /etc/samba/smb.conf
RUN echo "   valid users = henry" >> /etc/samba/smb.conf

# Create a user
RUN useradd -m henry

# Set the password for the user "henry"
RUN (echo "password"; echo "password") | smbpasswd -a -s henry

# Copy the Sniff.txt file
COPY Sniff.txt /smbshare/Sniff.txt

# Set the correct permissions
RUN chown -R henry:henry /smbshare

# Start the SMB service
CMD ["smbd", "--foreground", "--no-process-group"]
