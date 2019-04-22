---
title: "Pod Security Policy"
date: 2019-04-22T11:31:07+02:00
draft: true
---

In this article we will step through the configuration and use of Pod Security Policy controls in a Kubernetes cluster, with examples based on a simple cluster created used `minikube`. In a follow-up article I will detail how [Rancher](https://rancher.com/docs/rancher/v2.x/en/) can help simplify the creation and management of PodSecurityPolicies.

In addition to this article, a step through tutorial following this article can found in Katacoda at <>. This Katacoda tutorial uses a pre-configured single-node Kubernetes cluster, created with `kubeadm`, and avoids the need to create a test cluster yourself.

## A very brief introduction

Per the [Kubernetes Documentation](https://kubernetes.io/docs/concepts/policy/pod-security-policy/) `a Pod Security Policy is a cluster-level resource that controls security sensitive aspects of the pod specification`. These controls enable you to define, for example, whether pods can run containers in privileged mode, the types of volumes pods can use and whether containers can run as root. A full list of the available controls you can define in a policy can be found [here](https://kubernetes.io/docs/concepts/policy/pod-security-policy/#what-is-a-pod-security-policy).

Pod Security Policy enforcement is switched on in a Kubernetes cluster by [enabling the PodSecurityPolicy admission controller on the Kubernetes API Server](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#how-do-i-turn-on-an-admission-controller).

** N.B. Kubernetes does not populate any PodSecurityPolicy by default. As a result if you enable the PodSecurityPolicy admission without creating any PodSecurityPolicies in advance, no Pods creation will be permitted until policies are defined. **

## Step 1.

As noted above, you can follow the steps in this article in the linked Katacoda tutorial, without needing to create a Kubernetes cluster yourself. If you prefer to create a cluster yourself, you can provision a local single-node cluster, with the PodSecurityPolicy admission controller enabled, using [`minikube` (v1.1.0)](https://github.com/kubernetes/minikube/releases/tag/v1.0.0) as follows:

`minikube start --extra-config=apiserver.enable-admission-plugins=NamespaceLifecycle,LimitRanger,ServiceAccount,TaintNodesByCondition,Priority,DefaultTolerationSeconds,DefaultStorageClass,PersistentVolumeClaimResize,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,ResourceQuota,PodSecurityPolicy`

** N.B. As we are creating the cluster here with the PodSecurityPolicy admission controller enabled, but no policies yet defined, it is expected that you will see `is forbidden: no providers available to validate pod request` errors when starting the cluster via `minikube`. **

## Step 2.

Create Kubernetes restricted-psp and grant to service accounts and authorized users

## Step 3.

Attempt to display privileged and unprivileged pods, show failing privileged pod

## Step 4.

Create Kubernetes unrestricted-psp and deploy privileged pod

## Step 5.

Attempt to create a privileged deployment and show pod failing

## Step 6.

Create a namespace, grant unrestricted-psp to default service account and create a privileged deployment

## Step 7.

Create a namespace, grant unrestricted-psp to a service account and create a privileged deployment with that service account

## Step 8.

Demonstrate granting unrestricted-psp to controller service accounts
