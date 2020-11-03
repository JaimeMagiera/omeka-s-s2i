# Pull the RHEL 8 httpd-24 base image
FROM ubi8/php-74

LABEL maintainer="Jaime Magiera <jaimelm@umich.edu>"
LABEL io.k8s.description="Platform for building Omeka-S Instances" \
      io.k8s.display-name="Builder for Omeka-S Instances" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,Omeka-S"

# Define the BUILDER_VERSION environmental variable
ENV BUILDER_VERSION 1.0

# Copy the source code
COPY ./<builder_folder>/ /opt/app-root/

# Copy the s2i scripts
COPY ./s2i/bin/ /usr/libexec/s2i

# Set the ownership of the application root
RUN chown -R 1001:1001 /opt/app-root

# Change to the 1001 (This is ignored in OpenShift)
USER 1001

# Output the usage script to finish the builder build 
CMD ["/usr/libexec/s2i/usage"]
