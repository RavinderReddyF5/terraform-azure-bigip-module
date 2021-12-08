/*
Copyright 2019 F5 Networks Inc.
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
    }
  }
}

provider "bigip" {
  address  = module.bigip.*.mgmtPublicIP[0]
  username = module.bigip.*.f5_username[0]
  password = module.bigip.*.bigip_password[0]
  port     = module.bigip.*.mgmtPort[0]
}

// resource "bigip_do" "do-example1" {
//   do_json = file("/Users/chinthalapalli/devsettings/Terraform/basic_do.json")
//   // ignore_changes = true
// }

resource "bigip_do" "do-example1" {
  do_json        = file("/Users/xxxxx/devsettings/Terraform/basic_do.json")
  bigip_address  = module.bigip.*.mgmtPublicIP[0]
  bigip_user     = module.bigip.*.f5_username[0]
  bigip_password = module.bigip.*.bigip_password[0]
  bigip_port     = module.bigip.*.mgmtPort[0]
}
