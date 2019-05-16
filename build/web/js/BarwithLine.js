
var janeiro = "${dashboard.janeiro}"
var fevereiro = "${dashboard.fevereiro}"
var marco = "${dashboard.marco}"
var abril = "${dashboard.abril}"
var maio = "${dashboard.maio}"
var junho = "${dashboard.junho}"
var julho = "${dashboard.julho}"
var agosto = "${dashboard.agosto}"
var setembro = "${dashboard.setembro}"
var outubro = "${dashboard.outubro}"
var novembro = "${dashboard.novembro}"
var dezembro = "${dashboard.dezembro}"

var type = "${type}"
var year = "${year}"

var gmpermonth = {
    labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setebro", "Outubro", "Novembro", "Dezembro"],
    datasets: [{
            label: "Meta",
            //new option, type will default to bar as that what is used to create the scale
            type: "line",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [2000000, 2000000, 2000000, 2000000, 2000000, 2000000, 2000000, 2000000, 2000000, 2000000, 2000000, 2000000]
        }, {
            label: "My First dataset",
            //new option, type will default to bar as that what is used to create the scale
            type: "bar",
            fillColor: "rgba(220,20,220,0.2)",
            strokeColor: "rgba(220,20,220,1)",
            pointColor: "rgba(220,20,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro]
        }]
};