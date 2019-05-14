window.onload = function () {
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

        document.Dashboard.year = year;
        var chart = new CanvasJS.Chart("chartContainer",
        {
        title: {
        text: type + " Projects per GM " + year
                    },
                    data: [
                        {
                //type: "doughnut",
                //type: "column",
                //type: "bar",
                //type: "radar",

                type: "pie",
                dataPoints: [
                {x: 10, y: janeiro, label: "Janeiro " + "${formatado.janeiro}"},
                                {x: 20, y: fevereiro, label: "Fevereiro " + "${formatado.fevereiro}"},
                                {x: 30, y: marco, label: "Março " + "${formatado.marco}"},
                                {x: 40, y: abril, label: "Abril " + "${formatado.abril}"},
                                {x: 50, y: maio, label: "Maio " + "${formatado.maio}"},
                                {x: 60, y: junho, label: "Junho " + "${formatado.junho}"},
                                {x: 70, y: julho, label: "Julho " + "${formatado.julho}"},
                                {x: 80, y: agosto, label: "Agosto " + "${formatado.agosto}"},
                                {x: 90, y: setembro, label: "Setembro " + "${formatado.setembro}"},
                                {x: 100, y: outubro, label: "Outubro " + "${formatado.outubro}"},
                                {x: 110, y: novembro, label: "Novembro " + "${formatado.novembro}"},
                                {x: 120, y: dezembro, label: "Dezembro " + "${formatado.dezembro}"}

                            ]
                        },
                    ]
                });

        chart.render();
    }
