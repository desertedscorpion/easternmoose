FROM fedora:23
MAINTAINER “Emory Merryman” emory.merryman+ANtQCiXa78l0mBVl@gmail.com>
RUN dnf update --assumeyes && dnf clean all
ONBUILD run dnf update --assumeyes && dnf clean all
LABEL base="easternmoose" fedora="23"
