function addRow(tableID) {

    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    var element1 = document.createElement("input");
    element1.type = "checkbox";
    cell1.appendChild(element1);

    var cell2 = row.insertCell(1);
    cell2.innerHTML = rowCount + 1;

    var cell3 = row.insertCell(2);
    var element2 = document.createElement("input");
    element2.type = "text";
    element2.name = "nomeitem" + rowCount;
    element2.placeholder = "Nome item"
    element2.required = true;
    cell3.appendChild(element2);

    var cell4 = row.insertCell(3);
    var element3 = document.createElement("input");
    element3.type = "text";
    element3.name = "nomecontatoitem" + rowCount;
    element3.placeholder = "Nome Contato"
    element3.required = true;
    cell4.appendChild(element3);

    var cell5 = row.insertCell(4);
    var element4 = document.createElement("input");
    element4.type = "text";
    element4.name = "briefing" + rowCount;
    element4.placeholder = "Briefing"
    element4.required = true;
    cell5.appendChild(element4);


    var cell6 = row.insertCell(5);
    var array = ["Sim", "Não"];
    var element6 = document.createElement("select");
    element6.setAttribute("id", "mySelect");
    cell6.appendChild(element6);
    element6.type = "text";
    element6.required = true;
    for (var i = 0; i < array.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", array[i]);
        option.text = array[i];
        element6.name = "followup" + rowCount;
        element6.appendChild(option);
    }

}

function deleteRow(tableID) {
    try {
        var table = document.getElementById(tableID);
        var rowCount = table.rows.length;

        for (var i = 0; i < rowCount; i++) {
            var row = table.rows[i];
            var chkbox = row.cells[0].childNodes[0];
            if (null != chkbox && true == chkbox.checked) {
                table.deleteRow(i);
                rowCount--;
                i--;
            }

        }
    } catch (e) {
        alert(e);
    }
}

