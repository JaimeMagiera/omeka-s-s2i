# omeka-s-rhel8
FROM ubi8/php-73 

# TODO: Put the maintainer name in the image metadata
LABEL maintainer="Jaime Magiera <jaimelm@umich.edu>"

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for building omeka-s" \
      io.k8s.display-name="builder Omeka-s 1.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,omeka, jaimelm"

# TODO: Install required packages here:
USER root
RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm
RUN yum install -y GraphicsMagick && yum clean all -y

# TODO (optional): Copy the builder files into /opt/app-root
#COPY ./test/test-app/ /opt/app-root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./s2i/bin/ /usr/libexec/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
EXPOSE 8080

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
