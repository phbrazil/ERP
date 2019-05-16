function addRow(tableID) {

    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    var element1 = document.createElement("input");
    element1.type = "checkbox";
    cell1.appendChild(element1);

    var cell2 = row.insertCell(1);
    cell2.innerHTML = rowCount;

    var cell3 = row.insertCell(2);
    var array = ["Information", "Input", "Output"];
    var element3 = document.createElement("select");
    element3.setAttribute("id", "mySelect");
    cell3.appendChild(element3);
    element3.type = "text";
    //element3.setAttribute("data-toggle","tooltip");
    //element3.setAttribute("title","input = somar, output = subtrair e information =  informação");
    element3.required = true;

    for (var i = 0; i < array.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", array[i]);
        option.text = array[i];
        element3.name = "tipo" + rowCount;
        element3.id = "tipo" + rowCount;
        element3.appendChild(option);
    }

    var cell4 = row.insertCell(3);
    var element4 = document.createElement("input");
    element4.type = "text";
    element4.name = "nomeitem" + rowCount;
    element4.id = "nomeitem" + rowCount;
    element4.placeholder = "Item Name/Client Name";
    element4.required = true;
    element4.setAttribute('maxlength', 50);
    element4.autocomplete = 'off';
    cell4.appendChild(element4);

    $("#nomeitem" + rowCount).autocomplete({
        source: $("#nomeitem" + rowCount).autocomplete("getdataClientes.jsp")});



    var cell5 = row.insertCell(4);
    var element5 = document.createElement("input");
    element5.type = "text";
    element5.name = "valoritem" + rowCount;
    element5.setAttribute('id', 'currency');
    element5.id = 'currency' + rowCount;
    element5.placeholder = "Item Value";
    element5.required = true;
    cell5.appendChild(element5);

    // gm over item value
    var cell6 = row.insertCell(5);
    var element6 = document.createElement("input");
    element6.type = "text";
    element6.name = "gmitem" + rowCount;
    element6.setAttribute('id', 'currencyGM');
    element6.id = 'currencyGM' + rowCount;
    element6.placeholder = "GM Value";
    element6.required = true;
    cell6.appendChild(element6);


    $(function () {
        $('#currency' + rowCount).maskMoney();
        $('#currencyGM' + rowCount).maskMoney();
    });

    var cell7 = row.insertCell(6);
    var element7 = document.createElement("input");
    element7.type = "date";
    element7.name = "date" + rowCount;
    element7.id = "date" + rowCount;
    element7.valueAsDate = new Date();
    element7.required = true;
    cell7.appendChild(element7);


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

