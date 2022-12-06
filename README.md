# Zero Trust Proof of Concept

UC Berkeley MICS Network Security | Fall 2022

In Zero Trust Architecture (ZTA), the user and device are considered in conjunction when calculating Trust Scores.

This is a proof of concept (POC) using the `device_detector` gem to use both user and device data to make authorization
decisions on a per-request basis.

In real ZTA, you would separate the Enforcer, Policy Engine, and Trust Engine. This app is meant to be a POC only, so
the Policy and Trust components are embedded within the same app.

## Models

### User

- First Name
- Last Name
- Location
- Email
- Password hash

### Device

- Name
- Type

### Relationships

- Device belongs to a User
- User can have many devices
