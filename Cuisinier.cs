﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PlatLegeretSain
{
    public class Cuisinier : Employe
    {
        public List<Repas> repas
        {
            get => default(int);
            set
            {
            }
        }

        public void cuisiner()
        {
            throw new System.NotImplementedException();
        }
    }
}