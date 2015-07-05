var array = new Array(20);
var num = 0;

function buy() {
	if (num == 0) {
		alert("请先选择座位");
		return;
	}
	// send request
}

function chooseseat(seat) {
	var ele = document.getElementById("seats");
	if (num == 0) {
		ele.removeChild(ele.firstChild);
	}
	var haschoose = -1;
	for (var i = 0; i < num + 1; i++) {
		if (array[i] == seat) {
			haschoose = i;
		}
	}
	if (haschoose == -1) {
		num++;
		array[num] = seat;
	} else {
		array[haschoose] = array[num];
		num--;
	}
	if (num == 0) {
		var node = document.createElement("p");
		var hint = document.createTextNode("请选择座位");
		node.appendChild(hint);
		ele.appendChild(node);
	} else {
		for (var i = 0; i < num + 1; i++) {
			var node = document.createElement("em");
			var seat = document.createTextNode(array[i]);
			node.appendChild(seat);
			ele.appendChild(node);
		}
	}
}