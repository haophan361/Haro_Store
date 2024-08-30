document.addEventListener("DOMContentLoaded", function() 
{
    var cities = document.getElementById("cities");
    var districts = document.getElementById("districts");
    var wards = document.getElementById("wards");

    var Parameter = 
    {
      url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json", 
      method: "GET", 
      responseType: "application/json", 
    };

    var promise = axios(Parameter);
    promise.then(function (result) 
    {
      renderCity(result.data);
    });

    function renderCity(data) 
    {
      for (const x of data) 
      {
        cities.options[cities.options.length] = new Option(x.Name, x.Id);
      }

      cities.onchange = function () 
      {
        districts.length = 1;
        wards.length = 1;

        if (this.value != "")
        {
          const result = data.filter(n => n.Id === this.value);

          for (const k of result[0].Districts) 
          {
            districts.options[districts.options.length] = new Option(k.Name, k.Id);
          }
        }
      };

      districts.onchange = function () 
      {
        wards.length = 1;
        const dataCity = data.filter((n) => n.Id === cities.value);

        if (this.value != "") 
        {
          const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;
          
          for (const w of dataWards) 
          {
            wards.options[wards.options.length] = new Option(w.Name, w.Id);
          }
        }
      };
    }
});
