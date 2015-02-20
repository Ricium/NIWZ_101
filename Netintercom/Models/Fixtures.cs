﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Fixtures
    {
        public int FixturesId { get; set; }
        [DisplayName("Home Team")]
        public int TeamIdA { get; set; }
        [DisplayName("Away Team")]
        public int TeamIdB { get; set; }
        [DisplayName("Match Date and StartTime")]
        public DateTime StartTime { get; set; }
        [DisplayName("Play Field")]
        public string field { get; set; }
        public int FieldId { get; set; }
        public int ClientId { get; set; }
    }
}