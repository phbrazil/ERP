function TamanhoData(elemento) {
    
    if (document.getElementById(elemento).value.length > 10) {
        alert("<br><strong>Invalid date format</strong>");
        document.getElementById(elemento).focus();
    }
    
    validaDatasProjeto();

}