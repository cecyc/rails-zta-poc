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

## Demo / How it works

This is a simple "employee" dashboard with a homepage, a profile page, and a "super secret" restricted page.

Login screen:

![Screen Shot 2022-12-06 at 10 07 24 PM](https://user-images.githubusercontent.com/989784/206085896-20a1ed60-2a2d-4114-ba72-76c454cfd370.png)

Upon successful login, users are redirected to the dashboard index:

<img width="1552" alt="Screen Shot 2022-12-06 at 2 45 59 PM" src="https://user-images.githubusercontent.com/989784/206085817-7207970d-6e07-4a52-941f-ed8f816430fb.png">

Users can see their profile and registered devices:

<img width="1552" alt="Screen Shot 2022-12-06 at 2 46 07 PM" src="https://user-images.githubusercontent.com/989784/206085830-097af397-9b9e-4b01-a824-81e2045d7846.png">

The "super secret" page is only accessible to registered devices for the User:

Regitered device:
<img width="1552" alt="Screen Shot 2022-12-06 at 2 46 20 PM" src="https://user-images.githubusercontent.com/989784/206086053-0cea070d-77b7-40ef-97a9-cbc7cd515aeb.png">

Unregistered device (mobile):

![Screenshot_20221206-215609](https://user-images.githubusercontent.com/989784/206086247-b3e3a73c-fccd-4815-8cbc-68c118d5ffd9.png)

Relevant code:

```ruby
# user.rb

def check_device_policy(client)
  devices.any? { |device| device.approved?(client) }
end

# device.rb

def approved?(client)
  return true if os_name.include?(client.os_name) && kind == client.device_type
  return false
end
```





