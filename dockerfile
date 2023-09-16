# Use the instrumentisto/flutter base image
FROM instrumentisto/flutter

# Set environment variables for Firebase login
ENV FIREBASE_EMAIL=otmanmalki57@gmail.com
ENV FIREBASE_PASSWORD=R@ze1432

# Install necessary tools (e.g., curl, jq) and Firebase Tools
RUN apt-get update && apt-get install -y curl jq && \
    curl -sL https://firebase.tools | upgrade=true bash

# Create a directory for the Firebase login token
RUN mkdir -p /firebase-login-token

# Run a script to log in to Firebase
COPY login-to-firebase.sh /firebase-login-token/
RUN chmod +x /firebase-login-token/login-to-firebase.sh
RUN /firebase-login-token/login-to-firebase.sh
