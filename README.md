# image-almalinux-base

This repository contains the [bootc](https://github.com/containers/bootc) OCI image definition for the base/almalinux image. This image is lazily hardened against the CIS Benchmark for AlmaLinux 8 Level 2 - Server, and is intended to be used as a base image for other images.

As a bootc image, it contains everything needed to build and run the image, including the Kernel and init system. This means that the image is a complete, self-contained OCI image that can be run directly on a server or VM without needing to use a container runtime like Podman or Docker.

## Usage

To use this image, you can reference it in your Containerfile like so:

```Dockerfile
FROM ghcr.io/rsturla-cloud/base/almalinux:9
```
