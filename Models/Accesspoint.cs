using Newtonsoft.Json;
using System.Collections.Generic;


namespace CertifID.Models
{
    public class Accesspoint
    {
        [JsonProperty("entrance")]
        public string Entrance { get; set; }

        [JsonProperty("group")]
        public Group associatedGroup{ get; set; }
    }
}