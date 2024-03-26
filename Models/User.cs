using Newtonsoft.Json;
using System.Collections.Generic;

namespace CertifID.Models
{

    public class User
    {
        [JsonProperty("firstName")]
        public string FirstName { get; set; }

        [JsonProperty("lastName")]
        public string LastName { get; set; }

        [JsonProperty("location")]
        public string Location { get; set; }

        [JsonProperty("group")]
        public int Group { get; set; }
        
        [JsonProperty("title")]
        public string Title { get; set; }
    }

    //public class UserList
    //{
    //    [JsonProperty("users")]
    //    public List<User> Users { get; set;}
    //}

}
