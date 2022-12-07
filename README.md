# Zero Trust Proof of Concept

UC Berkeley MICS Network Security | Fall 2022

In Zero Trust Architecture (ZTA), the user and device are considered in conjunction when calculating Trust Scores.

This is a proof of concept (POC) using the `device_detector` gem to use both user and device data to make authorization
decisions on a per-request basis.

In real ZTA, you would separate the Enforcer, Policy Engine, and Trust Engine. This app is meant to be a POC only, so
the Policy and Trust components are embedded within the same app.

## Models

### User

Most of the fields are standard fields you would see in a User model. `Location` here could be used for filtering if the
User is logging in from an unusual location.

- First Name
- Last Name
- Location
- Email
- Password hash

### Device

Rudimentary model for a Device registry. The idea is that we would compare the data from the user agent making the
request against the registered devices for the User, and ensure the User is logging in from an approved device. In real
ZTA, you would not just look at the user agent to make this determiniation, but for the purposes of this demo, we are
keeping things simple.

- Name
- Kind
- Preferred Browser
- OS Name

### Relationships

- Device belongs to a User
- User can have many devices
