function change(day) {
	for (var i = 1; i < 7; i++) {
		var ele = document.getElementById("table" + i);
		if (day == i) {
			ele.style.display = "block";
		} else {
			ele.style.display = "none";
		}
	}
}

// function change(day) {
// var xmlhttp;
// if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
// xmlhttp = new XMLHttpRequest();
// } else {// code for IE6, IE5
// xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
// }
// xmlhttp.onreadystatechange = function() {
// if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
// var trs = eval(xmlhttp.responseText);
// clear();
// for ( var tr in trs) {
// addTr(tr);
// }
// }
// }
// xmlhttp.open("GET", "/screeninglist?movie=" + movie + "&day=" + day, true);
// xmlhttp.send();
// }
//
// function clear() {
// var tbody = document.getElementById("screen_list");
//
// while (tbody.hasChildNodes()) {
// tbody.removeChild(tbody.firstChild);
// }
// }
//
// function addTr(number, tr_data) {
// var tr, td1, td2, td3, node1, node2, node3, alink;
// tr = document.createElement("tr");
// tr.id = "screen_tr";
//
// var td, node;
// td = document.createElement("td");
// node = document.createTextNode(number);
// td.appendChild(node);
// tr.appendChild(td);
//
// td1 = document.createElement("td");
// node1 = document.createTextNode(tr_data.time);
// td1.appendChild(node1);
// tr.appendChild(td1);
//
// td2 = document.createElement("td");
// node2 = document.createTextNode(tr_data.hall);
// td2.appendChild(node2);
// tr.appendChild(td2);
//
// td3 = document.createElement("td");
// node3 = document.createTextNode(tr_data.left);
// td3.appendChild(node3);
// tr.appendChild(td3);
//
// td4 = document.createElement("td");
// alink = document.createElement("a");
// alink.href = tr_data.link;
// node4 = document.createTextNode("选座购票");
// alink.appendChild(node4);
// td4.appendChild(alink);
// tr.appendChild(td4);
//
// var tbody = document.getElementById("screen_list");
// tbody.appendChild(tr);
// }
