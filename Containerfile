# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx

COPY system_files /system_files
COPY build_files /build_files

# Base Image
FROM quay.io/almalinuxorg/almalinux-bootc:10-kitten@sha256:b0da9297b685395863b8026df457444fea0d91386bdbdfc0fd3559f647f97b70

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN --mount=type=tmpfs,dst=/opt \
    --mount=type=tmpfs,dst=/tmp \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build_files/build.sh && \
    ostree container commit

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
