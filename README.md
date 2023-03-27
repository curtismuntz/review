# Review

An opencv post process to run against Amcrest NFS outputs.

I have amcrest cameras that produce motion events on my NFS in very unreasonable formats. This application is meant to be run against a NFS directory that takes all motion events across all cameras and creates a full video of the events in a linear time format. The post process runs an object detection YOLO v5 algorithm and will create bounding boxes around motion events. In the event that an entire sequence does not have a detection, it is flagged as a false positive and will not be included in the summary output.

## setup

### install nix

If you're on nixos, skip this step. Otherwise, install nix via https://nixos.org/download.html

### install direnv

Install direnv via https://direnv.net/docs/installation.html

Don't forget to hook it into your shell!

### clone this repo

```
git clone git@github.com:curtismuntz/review
```

### allow direnv

```
cd review && direnv allow .
```

## building / running

```
bazel run //review
```
