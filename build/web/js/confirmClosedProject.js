
function confirmClosedProject() {

    var gmclosed = document.getElementById('gmclosed').value;

    var projectstatus = document.getElementById('projectstatus').value;

    if (projectstatus === "Closed" && gmclosed == "0,00") {
        alert("<br><strong>Favor informar o GM Closed\n antes de alterar o status para Closed</strong>");
    }
}
