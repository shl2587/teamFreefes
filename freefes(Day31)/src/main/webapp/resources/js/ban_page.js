'use strict'

window.onload = function() {
	  var modal = document.getElementById("myModal");
	  var span = document.getElementsByClassName("close")[0];
	  var home_btn = document.getElementById("home_btn");

	  modal.style.display = "block";

	  function backHome() {
	    window.location.href = "/freefes";
	  }

	  span.onclick = function() {
	    modal.style.display = "none";
	    backHome();
	  }

	  home_btn.onclick = function() {
	    backHome();
	  }

	  window.onclick = function(event) {
	    if (event.target == modal) {
	      modal.style.display = "none";
	      backHome();
	    }
	  }

	  document.addEventListener("keydown", function(event) {
	    if (event.key === "Escape") {
	      modal.style.display = "none";
	      backHome();
	    }
	  });
	}