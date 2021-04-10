# hkp_client

Dart/Flutter HKP Keyserver client.
Implements the HKP basics for flutter to get and upload keys. 


## Getting Started

Install the package by adding it into your pubspec.
```
hkp_client: "^0.0.1"
```

## Usage

```
import 'package:hkp_client/hkp_client.dart';

//Upload Pubkey to Server
//needs ASCIIArmor format
openpgp.addKey(pubkey);

//Get Keys from server bei Email, Fingerprint or KeyID
//Returns the Keys as ASCIIArmour format
openpgp.getKey(email);
openpgp.getKey(fingerprint);
```