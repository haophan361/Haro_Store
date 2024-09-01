document.addEventListener("DOMContentLoaded", function() 
{
    var keywordInput = document.getElementById("keyword");
	var debounceTimeout;
    if (keywordInput) 
    {
        keywordInput.addEventListener("input", function() 
        {
            var keyword = this.value;
            clearTimeout(debounceTimeout);
            debounceTimeout = setTimeout(function()
            {
				if (keyword !== "") 
	            {
	                var searchUrl = "trang-chu?action=searchPro&keyword=" + encodeURIComponent(keyword);
	                window.location.href = searchUrl;
	            }
			},500)
        });
    }
});