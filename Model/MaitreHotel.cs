﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PlatLegeretSain.Model
{
    public class MaitreHotel : Employe
    {

        public MaitreHotel()
        {
            this.X = 20;
            this.Y = 20;
            this.img = "Mh";
        }

        public ITableLibre ITableDisponible
        {
            get => default(ITableLibre);
            set
            {
            }
        }

        public int table
        {
            get => default(int);
            set
            {
            }
        }

        public MaitreHotel MaitreHotel1
        {
            get => default(MaitreHotel);
            set
            {
            }
        }

        public Table attribuerTable()
        {
            throw new System.NotImplementedException();
        }

        public void appelerChefRang()
        {
            throw new System.NotImplementedException();
        }

        public void setState(ITableLibre iTableDisponible)
        {
            throw new System.NotImplementedException();
        }

        /// <summary>
        /// Change le State en TableDisponible
        /// </summary>
        public void PlaceLibere()
        {
            throw new System.NotImplementedException();
        }

        public void PasPlace()
        {
            throw new System.NotImplementedException();
        }
    }
}