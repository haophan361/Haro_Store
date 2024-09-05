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
        let city=document.getElementById("cityName").value;
        let district=document.getElementById("districtName").value;
        let ward=document.getElementById("wardName").value;
        for (const c of data)
        {
            cities.options[cities.options.length] = new Option(c.Name, c.Id);
        }
        if(city!=="")
        {
            cities.value=data.find(city=>city.Name===city).Id;
            cities.dispatchEvent(new Event("change"));
        }
        cities.onchange = function ()
        {
            districts.length = 1;
            wards.length = 1;
            document.getElementById("cityName").value = cities.options[cities.selectedIndex].text;
            if (this.value !== "")
            {
                const result = data.filter(n => n.Id === this.value);

                for (const d of result[0].Districts)
                {
                    districts.options[districts.options.length] = new Option(d.Name, d.Id);
                }
                if(district!=="")
                {
                    districts.value=result.filter(district=>district.Name===district).Id;
                    districts.dispatchEvent(new Event("change"))
                }
            }
        };

        districts.onchange = function ()
        {
            wards.length = 1;
            document.getElementById("districtName").value = districts.options[districts.selectedIndex].text;
            const dataCity = data.filter((n) => n.Id === cities.value);
            if (this.value !=="")
            {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards)
                {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }
                if(ward!=="")
                {
                    wards.value=dataWards.find(w=>w.Name===ward).Id;
                    wards.dispatchEvent(new Event("change"));
                }
            }
        };
        wards.onchange=function()
        {
            document.getElementById("wardName").value = wards.options[wards.selectedIndex].text;
        };
    }
});
