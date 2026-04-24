# Kubernetes Admission Controller with Python

A simple Kubernetes **Validating Admission Webhook** written in Python.

This project blocks the creation of Pods that use container images other than `nginx`.

---

## Overview

This project demonstrates how to build and deploy a custom Admission Controller inside a Kubernetes cluster.

The webhook receives admission requests from the Kubernetes API Server and validates Pod container images before the Pod is created or updated.

---

## Policy

Only `nginx` images are allowed.

| Image | Result |
|---|---|
| `nginx` | Allowed |
| `nginx:latest` | Allowed |
| `nginx:1.25` | Allowed |
| `busybox` | Denied |
| `httpd` | Denied |
| `redis` | Denied |

---

## Architecture

```text
kubectl apply / kubectl run
        |
        v
Kubernetes API Server
        |
        v
Validating Admission Webhook
        |
        v
Allow or Deny
        |
        v
etcd
