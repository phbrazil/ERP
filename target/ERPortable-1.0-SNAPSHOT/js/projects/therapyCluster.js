function therapyCluster(industrysector) {


    if (industrysector !== 'Healthcare, Pharmaceuticals, Biotechnology, Life Science, Medical Devices') {

        document.getElementById('trpcluster').value = "No TC";
        document.getElementById('trpcluster').readonly = "true";

    } else {
        document.getElementById('trpcluster').readonly = "false";
        document.getElementById('trpcluster').value = "01 - Cardiology / Angiology / Vascular diseases";

    }



}