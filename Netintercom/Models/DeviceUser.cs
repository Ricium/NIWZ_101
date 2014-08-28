using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Netintercom.Models
{
    public class DeviceUser
    {
      public int DeviceUserId { get; set; }
      public int ClientId { get; set; }
      public string DeviceId { get; set; }
      public string Name { get; set; }
      public string Surname { get; set; }
      public string Phone { get; set; }
      public string Email { get; set; }
      public string Password { get; set; }
      public bool Approved { get; set; }

      public DeviceUser()
      {
      }

      public DeviceUser(int ClientId, string DeviceId, string NameSurname, string Phone, string Email, string Password)
      {
          this.ClientId = ClientId;
          this.DeviceId = DeviceId;
          //...Split Name and Surname
          this.Name = NameSurname.Substring(0, NameSurname.IndexOf(' '));
          this.Surname = NameSurname.Substring(NameSurname.IndexOf(' ') + 1, NameSurname.Length - NameSurname.IndexOf(' '));

          this.Phone = Phone;
          this.Email = Email;
          this.Password = Password;

          this.DeviceUserId = 0;
          this.Approved = false;
      }
    }
}