using BlazorTemplate.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BlazorTemplate.Models;
using BlazorTemplate.DAL;

namespace BlazorTemplate.Server.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class PersonalController : ControllerBase
    {

        private EUnitOfWork unitOfWork;


        public PersonalController(EUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;

        }


        [HttpGet]
        public List<UserExtensionData> Get()
        {

            return unitOfWork.ViewUsers.GetView().ToList();
        }


        [HttpGet("{id}")]
        public string Get(int id )
        {
             return  new string("Привет API");
        }

        [HttpGet("{name}/{lastname}")]
        public string Get(string name,string lastname)
        {
            return new string(lastname);
        }
    }
}
