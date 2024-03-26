using Newtonsoft.Json;
using System.Collections.Generic;


namespace CertifID.Models
{
    public class Location
    {
        [JsonProperty("id")]
        public int Id { get; set; }

        [JsonProperty("city")] 
        public string City { get; set; }

        [JsonProperty("state")] 
        public string State { get; set; }

        [JsonProperty("address")]
        public string Address { get; set; }

        [JsonProperty("zip")]
        public string Zip { get; set; }

        [JsonProperty("accessPoints")]
        public List<Accesspoint> AccessPoints { get; set; }
    }
}