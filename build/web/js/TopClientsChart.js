            <script>

                var nomecliente1 = "${topclients.get(0).clientenome}"
                var nomecliente2 = "${topclients.get(1).clientenome}"
                var nomecliente3 = "${topclients.get(2).clientenome}"
                var nomecliente4 = "${topclients.get(3).clientenome}"
                var nomecliente5 = "${topclients.get(4).clientenome}"
                var nomecliente6 = "${topclients.get(5).clientenome}"
                var nomecliente7 = "${topclients.get(6).clientenome}"
                var nomecliente8 = "${topclients.get(7).clientenome}"
                var nomecliente9 = "${topclients.get(8).clientenome}"
                var nomecliente10 = "${topclients.get(9).clientenome}"

                var clienteqtd1 = "${topclients.get(0).clienteqtd}"
                var clienteqtd2 = "${topclients.get(1).clienteqtd}"
                var clienteqtd3 = "${topclients.get(2).clienteqtd}"
                var clienteqtd4 = "${topclients.get(3).clienteqtd}"
                var clienteqtd5 = "${topclients.get(4).clienteqtd}"
                var clienteqtd6 = "${topclients.get(5).clienteqtd}"
                var clienteqtd7 = "${topclients.get(6).clienteqtd}"
                var clienteqtd8 = "${topclients.get(7).clienteqtd}"
                var clienteqtd9 = "${topclients.get(8).clienteqtd}"
                var clienteqtd10 = "${topclients.get(9).clienteqtd}"

                var year = "${year}"

                document.Dashboard.year = year;
                var config = {
                    type: 'bar',
                    data: {

                        datasets: [{

                                data: [
                                    clienteqtd1,
                                    clienteqtd2,
                                    clienteqtd3,
                                    clienteqtd4,
                                    clienteqtd5,
                                    clienteqtd6,
                                    clienteqtd7,
                                    clienteqtd8,
                                    clienteqtd9,
                                    clienteqtd10
                                ],
                                backgroundColor: [
                                    window.chartColors.red,
                                    window.chartColors.orange,
                                    window.chartColors.yellow,
                                    window.chartColors.green,
                                    window.chartColors.blue,
                                    window.chartColors.yellowgreen,
                                    window.chartColors.darkmagenta,
                                    window.chartColors.olive,
                                    window.chartColors.darkcyan,
                                    window.chartColors.purple
                                ],
                                //label: "Top Clients " + year

                            }],
                        labels: [
                            nomecliente1,
                            nomecliente2,
                            nomecliente3,
                            nomecliente4,
                            nomecliente5,
                            nomecliente6,
                            nomecliente7,
                            nomecliente8,
                            nomecliente9,
                            nomecliente10
                        ]
                    },
                    options: {
                        title: {
                            display: true,
                            fontSize: 30,
                            text: 'Top Clients ' + year
                        },
                        legend: {
                            display: false
                        },
                        scales: {
                            yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                        },
                        tooltips: {
                            callbacks: {
                                label: function (tooltipItem) {
                                    return tooltipItem.yLabel;
                                }
                            }
                        }
                    }
                };
                window.onload = function () {
                    var ctx = document.getElementById('chart-area').getContext('2d');
                    window.myPie = new Chart(ctx, config);
                };
                var colorNames = Object.keys(window.chartColors);
                document.getElementById('addDataset').addEventListener('click', function () {
                    var newDataset = {
                        backgroundColor: [],
                        data: [],
                        label: 'New dataset ' + config.data.datasets.length,
                    };
                    config.data.datasets.push(newDataset);
                    window.myPie.update();
                });
                document.getElementById('removeDataset').addEventListener('click', function () {
                    config.data.datasets.splice(0, 1);
                    window.myPie.update();
                });
            </script>