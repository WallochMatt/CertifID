using Newtonsoft.Json;
using System.Collections.Generic;


namespace CertifID.Models
{

    public class Group
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("department")] 
        public string Department { get; set; }

        [JsonProperty("status")]
        public string Status { get; set; }

        [JsonProperty("obj")]
        public string Obj {  get; set; }
    }

    //public class GroupList
    //{
    //    [JsonProperty("groups")]
    //    public List<Group> Groups { get; set;}
    //}
}
