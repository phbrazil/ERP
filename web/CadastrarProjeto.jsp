<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    HttpSession sessao = request.getSession();

    String subarea = (String) sessao.getAttribute("subarea");
    Integer idgrupo = (Integer) sessao.getAttribute("idgrupo");
    boolean mobile = (Boolean) session.getAttribute("mobile");
    String roles = (String) sessao.getAttribute("roles");

%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- Bootstrap core CSS -->
        <!--link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <meta name="google" content="notranslate">
        <link rel="stylesheet" type="text/css" href="css/button.css">
        <link rel="stylesheet" type="text/css" href="css/buttondelete.css">
        <link rel="stylesheet" type="text/css" href="css/gravar.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
        <link rel="stylesheet" type="text/css" href="css/tooltip.css" />
        <link rel="stylesheet" type="text/css" href="css/collapse_button.css" />
        <link rel="stylesheet" type="text/css" href="css/customAlert.css" />

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">

        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <title>Create new Project (BL)</title>

    </head>
    <body id="page-top">

        <style>

            span{
                position:relative;
                margin-right:-20px
            }
            input[type='number']{
                padding-left:20px;
                text-align:left;
            }


        </style>
        <%if (roles.contains("Create Project")) {%>

        <form name = "Projetos"  id = "criarprojeto" action="${pageContext.request.contextPath}/CadastrarProjeto" method="POST">

            <%@include  file="navbar.jsp" %>
            <br>
            <div align ="center">
                <div align = "center" >
                    <h3>
                        <span class="text-muted">Create new Opportunity/Project (BL)</span>
                    </h3>
                </div>
                <br>
                <button data-toggle="tooltip" title='Campos pouco alterados na BL' data-placement="left" style = "width: 65%; background-color: white;" type ="button" class="collapsible text-primary">General Information (click to expand)</button>
                <div class="content" style = "background-color: white; display: block">
                    <div class="row" style="width: 75%;">
                        <div class="col-md-4 mb-3">
                            <label>Product Practice</label>
                            <select autofocus name = "prodpractice" class="custom-select d-block w-100" id="prodpractice"  required>
                                <%if (subarea.equals("PCO") || subarea.equals("Housing")) {%>
                                <option selected>PCO</option>
                                <option>M&E</option>
                                <option>AMC</option>
                                <option>DMC</option>
                                <option>ASSET</option>
                                <option>Dorier</option>
                                <%} else if (subarea.equals("Dorier")) {%>
                                <option>PCO</option>
                                <option>M&E</option>
                                <option>AMC</option>
                                <option>DMC</option>
                                <option>ASSET</option>
                                <option selected>Dorier</option>
                                <%} else {%>
                                <option>PCO</option>
                                <option selected>M&E</option>
                                <option>AMC</option>
                                <option>DMC</option>
                                <option>ASSET</option>
                                <option>Dorier</option>
                                <%}%>
                            </select>
                        </div>  
                        <div class="col-md-4 mb-3">
                            <label>Type of Service</label>
                            <select name = "typeservice" class="custom-select d-block w-100" id="typeservice"  required>
                                <option>Event Management / PCO</option>
                                <option>Housing</option>
                                <option>SponEx Sales </option>
                                <option selected>Meeting / Conference Management services</option>
                                <option>Owner projects </option>
                                <option>Event Production (technical & creative) </option>
                                <option>Event Strategy</option>
                                <option>Digital Community Management </option>
                                <option>Trade Show Management </option>
                                <option>Full Registration </option>
                                <option>Partial Registration</option>
                                <option>Technology / IT services </option>
                                <option>Abstracts handling </option>
                                <option>Consulting</option>
                                <option>Grow globally consulting</option>
                                <option>Strategic Consulting </option>
                                <option>Integrated Marketing</option>
                                <option>Full Service Association HQ </option>
                                <option>Association HQ Lite / Administrative Services</option>
                                <option>Full Service Regional/National market development</option>
                                <option>Interim CEO</option>
                                <option>Training / Certification </option>
                                <option>(On-line) Learning </option>
                                <option>Public Affairs</option>
                                <option>Communication / Marketing & Digital Solutions </option>
                                <option>Fundraising</option>
                                <option>Product development </option>
                                <option>Strategic Services </option>
                                <option>Event Management services </option>
                                <option>Incentive management services </option>
                                <option>Destination Services - Full services </option>
                                <option>Destination Services – Partial </option>
                                <option>Technical Production </option>
                            </select>
                        </div>  
                        <div class="col-md-4 mb-3">
                            <label>Project Financial Status</label>
                            <select name = "finanstatus" class="custom-select d-block w-100" id="finanstatus"  required>
                                <option>Service provider - Fixed Flat Fees</option>
                                <option>Service provider - Time based</option>
                                <option>Service provider - Variable fees</option>
                                <option>Partner - Variable fee - Stop Loss (No Loss Guarantee)</option>
                                <option>Licensee - Guaranteed Final Profit (Annual Fixed Fee)</option>
                                <option>Asset development - Full Joint Venture (Risk Sharing)</option>
                                <option>Asset ownership – MCI owned and operated events</option>
                                <option>Asset Globalization – Licensee for Global Expansion</option>
                                <option>Partner revenue sharing</option>
                            </select>
                        </div>  
                        <div class="col-md-4 mb-3">
                            <label>Contract Qualification</label>
                            <select name = "ctqualification" class="custom-select d-block w-100" id="ctqualification"  required>
                                <option>Principal in Local gaap AND IFRS</option>
                                <option>Agent in Local gaap AND IFRS</option>
                                <option>Principal  in Local gaap BUT Agent in IFRS</option>
                                <option>Agent in Local gaap BUT Principal in IFRS</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Account Manager</label>
                            <div class="input-group">
                                <input onchange="naBaseContatoAccountManager(this.value)" data-toggle="tooltip" title="Account Manager do projeto" data-placement="left" type="text" autocomplete="off" class="form-control" value=''  id="accountmanager" name="accountmanager" maxlength="70" placeholder="" required >
                                <div class="invalid-feedback" style="width: 100%;">
                                    Nome obrigatório.
                                </div>
                            </div>
                            <!--label id ='clientenovo' style='color: red; background-color: transparent; outline: none; border-color: inherit; box-shadow: none;'/-->
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Project Manager</label>
                            <div class="input-group">
                                <input onchange="naBaseContatoProjectManager(this.value)" data-toggle="tooltip" title="Project Manager do projeto" data-placement="left" type="text" autocomplete="off" class="form-control" value=''  id="projectmanager" name="projectmanager" maxlength="70" placeholder="" required >
                                <div class="invalid-feedback" style="width: 100%;">
                                    Nome obrigatório.
                                </div>
                            </div>
                            <!--label id ='clientenovo' style='color: red; background-color: transparent; outline: none; border-color: inherit; box-shadow: none;'/-->
                        </div>
                    </div>
                </div>
                <p></p>
                <h5 class="mb-0">
                    <span class="text-primary">Client Information</span>
                </h5>
                <br>

                <div class="col-md-9 order-md-1">
                    <div class="row">
                        <div class="col-md-7 mb-3">
                            <label>MCI Standard Client Name <strong style="color: red;">***</strong></label>
                            <div class="input-group" title="Nome do Cliente">
                                <input data-toggle="tooltip" title="Nome do Cliente" data-placement="left" type="text" autocomplete="off" class="form-control" onchange="naBaseClientes(this.value)"  id="mcistdcliname" name="mcistdcliname" maxlength="70" placeholder="" required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    Nome obrigatório.
                                </div>
                            </div>
                            <!--label id ='clientenovo' style='color: red; background-color: transparent; outline: none; border-color: inherit; box-shadow: none;'/-->
                        </div>
                        <div id="buDemais" class="col-md-5 mb-3">
                            <label>Additional / Final Client Name</label>
                            <div class="input-group" title="Nome adicional">
                                <input data-toggle="tooltip" title="Nome adicional do Cliente" data-placement="right" autocomplete="off" type="text" class="form-control" id="others" placeholder="Optional" value="" maxlength ="70">
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>
                        <div id="buDorier" class="col-md-5 mb-3">
                            <label>Additional / Final Client Name</label>
                            <select data-toggle="tooltip" title="Nome adicional do Cliente" data-placement="right" class="custom-select d-block w-100" id="dorierBu" >
                                <option>Dorier</option>
                                <option>HUB</option>
                                <option>ICT</option>
                                <option>Campus Party</option>
                                <option>Incentive/Ovation</option>
                                <option>PCO</option>
                                <option>Housing</option>
                                <option>Services</option>
                            </select>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label >Proposal Request Date <strong style="color: red;">***</strong></label>
                            <input name = "propreqdate" data-toggle="tooltip" title="Data da Proposta" data-placement="left" type="date" onblur="TamanhoData('propreqdate')" class="form-control" id="propreqdate" placeholder="dd/mm/aaaa" maxlength="10" value = "" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-5 mb-3">
                            <label>Industry Sector</label>
                            <select onchange="therapyCluster(this.value)" name = "industrysector" data-toggle="tooltip" title="Indústria do cliente" data-placement="bottom" class="custom-select d-block w-100" id="industrysector"  required>
                                <option>Agriculture & Chemical</option>
                                <option>Apparel, Fashion & Textiles </option>
                                <option>Art & Design</option>
                                <option>Automotive and Auto Parts</option>
                                <option>Aviation, Defence & Space </option>
                                <option>Banking, Finance and Investment Services </option>
                                <option>Consumer & Household Products (FMCG)</option>
                                <option>Education & Social Services</option>
                                <option>Energy, Environmental, Oil and Gas</option>
                                <option>Food, Beverages, Food Retailing</option>
                                <option>Gambling & Casinos </option>
                                <option>Gaming </option>
                                <option>Government </option>
                                <option>Healthcare, Pharmaceuticals, Biotechnology, Life Science, Medical Devices</option>
                                <option>Hotels & Hospitality & Travel </option>
                                <option>Industrial Goods and Services</option>
                                <option>Information Technology, Hardware & Software</option>
                                <option>Insurance </option>
                                <option>Legal </option>
                                <option>Luxury Goods & Jewellery</option>
                                <option>Media & Publishing </option>
                                <option>Mineral Resources, Materials and Mining</option>
                                <option>Multi-level Marketing</option>
                                <option>Professional Services & Business Services </option>
                                <option>Real Estate, Architecture, Construction & Building</option>
                                <option>Recreation, Entertainment, Film & Music</option>
                                <option>Retailing, Department Stores</option>
                                <option>Science, Engineering & Mathematics </option>
                                <option>Sports & Athletics </option>
                                <option>Telecommunications</option>
                                <option>Tobacco</option>
                                <option>Transport and Logistics</option>
                                <option>Utilities, Water and Electric</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar uma categoria..
                            </div>
                        </div>
                        <div id="trpCluster" class="col-md-4 mb-3">
                            <label>Therapy Cluster</label>
                            <select data-toggle="tooltip" title="Área de terapia se for evento de medicina" data-placement="bottom" class="custom-select d-block w-100" id="trpcluster" name='trpcluster' >
                                <option>01 - Cardiology / Angiology / Vascular diseases</option>
                                <option>02- Endocrinology / Nutrition / Metabolism</option>
                                <option>03- Gastroenterology / Hepatology</option>
                                <option>04- Oncology / Hematology</option>
                                <option>05- Nephrology / Urology</option>
                                <option>06- Pulmonary / Respiratory diseases</option>
                                <option>07- Rheumatology</option>
                                <option>08- Dermatology</option>
                                <option>09- Neurology / Psychiatry / Psychology</option>
                                <option>10- Obstretrics / Gynecology / Reproduction</option>
                                <option>11- Otolaryngology (E.N.T)</option>
                                <option>12- Ophthalmology</option>
                                <option>13- Preventive medicine (Public Health / Epidemiology)</option>
                                <option>14- Infectious Diseases / Immunology</option>
                                <option>15- Anesthesiology / Pain / Sleep Medicine</option>
                                <option>16- Emergency / Critical-Care Medicine</option>
                                <option>17- Physical Medicine and Rehabilitation / Sport Medicine</option>
                                <option>18- Pharmacology / Toxicology / Genetics / Biochemistry / Anatomy / Red Biotechnology</option>
                                <option>19- Clinical Laboratory Sciences / Pathology / Cytology / Test Kits</option>
                                <option>20- Health Admin. / Medical Technology / Imaging (Radiology / Nuclear / CT / Endoscopy)</option>
                                <option>21- Surgery (Therapy based / Plastic / Transplant / Implant / Orthopedy / Podiatry)</option>
                                <option>22- Family / Gender / Age (Neonatology / Pediatry / Women / Men / Geriatry)</option>
                                <option>23- Alternative Medicine (Complimentary / Osteopathy)</option>
                                <option>24- Nursing / Pharmacy / Other Health Workers</option>
                                <option>25- Dentistry</option>
                                <option>26- Veterinary Medicine</option>
                                <option>27- Multiple therapies</option>
                                <option>No TC</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Customer Type</label>
                            <select name = "customertype" data-toggle="tooltip" title="Tipo de cliente" data-placement="right" class="custom-select d-block w-100" id="customertype"  required>
                                <option>Corporation</option>
                                <option>Association</option>
                                <option>Government / other</option>
                                <option>Intermediary</option>
                                <option>Inter-Office</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar uma categoria..
                            </div>
                        </div>
                        <div class="container">
                            <div align = "center" >
                                <h5 class="mb-0">
                                    <span class="text-primary">Project Information</span>
                                </h5>
                            </div>
                            <br>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Project name <strong style="color: red;">***</strong></label>
                            <!--onkeydown="searchSuggestProjectname(this.value);"-->
                            <div class="input-group">
                                <input name="projectname" autocomplete="off" data-toggle="tooltip" title="Nome do projeto" data-placement="left" type="text" class="form-control" id="projectname" placeholder="" value="" maxlength ="70" required>
                                <div class="invalid-feedback">
                                    Nome necessário
                                </div>
                            </div>
                            <div id ="hint" style="color: red"></div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Project Analytical code</label>
                            <div class="input-group" data-toggle="tooltip" title="Código do Projeto criado no SAP. Manter 0 caso número não exista" data-placement="top">
                                <input name="projectcode" min ="0" value="0" type="number" onblur="searchSuggestProjectCode(this.value);" class="form-control" id="projectcode" placeholder="" value="" maxlength ="50" required>
                                <input type='hidden' name='codeUnique' id='codeUnique'>
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                            <div id ="hintcode" style="color: red"></div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Event Starting date <strong style="color: red;">***</strong></label>
                            <input name = "eventstartdate"  data-toggle="tooltip" title="O projeto entrará no ano fiscal que inicia o evento" data-placement="bottom" type="date" onblur="TamanhoData('eventstartdate')" class="form-control"  id="eventstartdate" placeholder="dd/mm/aaaa" maxlength="10" value = "" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Event Status</label>
                            <select name = "eventstatus" data-toggle="tooltip" title="Quando ocorrerá" class="custom-select d-block w-100" id="eventstatus"  required>
                                <option>Past</option>
                                <option>Future</option>
                                <!--option>Present</option-->
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar o Status..
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Event Closing date <strong style="color: red;">***</strong></label>
                            <input name = "eventclosingdate" data-toggle="tooltip" title="Fim do Evento" data-placement="bottom" type="date" class="form-control" onblur="TamanhoData('eventclosingdate')" id="eventclosingdate" placeholder="dd/mm/aaaa" maxlength="10" value = "" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>N° of pax</label>
                            <div class="input-group">
                                <input name="paxnumber" data-toggle="tooltip" title="Participantes" data-placement="bottom" type= "number" class="form-control" min = "0" value ="0" id="paxnumber" placeholder="" value="" maxlength ="50" required>
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Cancellation Insurance</label>
                            <select name = "cancelinsurance" data-toggle="tooltip" title="Seguro de Cancelamento"  data-placement="bottom" class="custom-select d-block w-100" id="cancelinsurance"  required>
                                <option>No</option>
                                <option>Yes</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar...
                            </div>
                        </div>



                        <%if (subarea.equals("HUB") || subarea.equals("Key Accounts")
                                    || subarea.equals("Incentive/Ovation")
                                    || subarea.equals("Services") || subarea.equals("Dorier")
                                    || subarea.equals("PCO") || subarea.equals("Housing")
                                    || subarea.equals("AM&C") || subarea.equals("Campus Party")) {
                        %>
                        <div class="col-md-2 mb-3">
                            <label>Area</label>
                            <select onchange="show(this.value)" name = "subarea" data-toggle="tooltip" title='Área do evento' data-placement="bottom" class="custom-select d-block w-100" id="subarea"  required>
                                <option><%=subarea%></option>
                                <option>HUB</option>
                                <option>Key Accounts</option>
                                <option>Services</option>
                                <option>Incentive/Ovation</option>
                                <option>Dorier</option>
                                <option>PCO</option>
                                <option>Housing</option>
                                <!--option>Projetos Proprietários</option-->
                                <option>Campus Party</option>
                                <option>AM&C</option>
                                <option>One MCI</option>
                                <option>Test Area</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar a Area...
                            </div>
                        </div>
                        <%} else {%>
                        <div class="col-md-2 mb-3">
                            <label>Area</label>
                            <select onchange="show(this.value)" name = "subarea" data-toggle="tooltip" title='Área do evento' data-placement="bottom" class="custom-select d-block w-100" id="subarea"  required>
                                <option>HUB</option>
                                <option>Key Accounts</option>
                                <option>Services</option>
                                <option>Incentive/Ovation</option>
                                <option>Dorier</option>
                                <option>PCO</option>
                                <option>Housing</option>
                                <!--option>Projetos Proprietários</option-->
                                <option>Campus Party</option>
                                <option>AM&C</option>
                                <option>One MCI</option>
                                <option>Test Area</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar a Area...
                            </div>
                        </div>                     
                        <%}%>
                        <div class="col-md-3 mb-3">
                            <label>Country</label>
                            <select name = "pais" data-toggle="tooltip" title='País que ocorrerá' data-placement="left" class="custom-select d-block w-100" id="pais" onchange="Localidade()" required>
                                <option>Diversos</option>
                                <option>TBC</option>
                                <option>Afeganistão</option>
                                <option>África do Sul</option>
                                <option>Albânia</option>
                                <option>Alemanha</option>
                                <option>Andorra</option>
                                <option>Angola</option>
                                <option>Antiga e Barbuda</option>
                                <option>Arábia Saudita</option>
                                <option>Argélia</option>
                                <option>Argentina</option>
                                <option>Arménia</option>
                                <option>Austrália</option>
                                <option>Áustria</option>
                                <option>Azerbaijão</option>
                                <option>Bahamas</option>
                                <option>Bangladexe</option>
                                <option>Barbados</option>
                                <option>Barém</option>
                                <option>Bélgica</option>
                                <option>Belize</option>
                                <option>Benim</option>
                                <option>Bielorrússia</option>
                                <option>Bolívia</option>
                                <option>Bósnia e Herzegovina</option>
                                <option>Botsuana</option>
                                <option selected>Brazil</option>
                                <option>Brunei</option>
                                <option>Bulgária</option>
                                <option>Burquina Faso</option>
                                <option>Burúndi</option>
                                <option>Butão</option>
                                <option>Cabo Verde</option>
                                <option>Camarões</option>
                                <option>Camboja</option>
                                <option>Canadá</option>
                                <option>Catar</option>
                                <option>Cazaquistão</option>
                                <option>Chade</option>
                                <option>Chile</option>
                                <option>China</option>
                                <option>Chipre</option>
                                <option>Colômbia</option>
                                <option>Comores</option>
                                <option>Congo-Brazzaville</option>
                                <option>Coreia do Norte</option>
                                <option>Coreia do Sul</option>
                                <option>Cosovo</option>
                                <option>Costa do Marfim</option>
                                <option>Costa Rica</option>
                                <option>Croácia</option>
                                <option>Cuaite</option>
                                <option>Cuba</option>
                                <option>Dinamarca</option>
                                <option>Dominica</option>
                                <option>Egito</option>
                                <option>El Salvador</option>
                                <option>Emirados Árabes Unidos</option>
                                <option>Equador</option>
                                <option>Eritreia</option>
                                <option>Eslováquia</option>
                                <option>Eslovénia</option>
                                <option>Espanha</option>
                                <option>Estado da Palestina</option>
                                <option>Estados Unidos</option>
                                <option>Estónia</option>
                                <option>Etiópia</option>
                                <option>Fiji</option>
                                <option>Filipinas</option>
                                <option>Finlândia</option>
                                <option>França</option>
                                <option>Gabão</option>
                                <option>Gâmbia</option>
                                <option>Gana</option>
                                <option>Geórgia</option>
                                <option>Granada</option>
                                <option>Grécia</option>
                                <option>Guatemala</option>
                                <option>Guiana</option>
                                <option>Guiné</option>
                                <option>Guiné Equatorial</option>
                                <option>Guiné-Bissau</option>
                                <option>Haiti</option>
                                <option>Holanda</option>
                                <option>Honduras</option>
                                <option>Hungria</option>
                                <option>Iémen</option>
                                <option>Ilhas Marechal</option>
                                <option>Índia</option>
                                <option>Indonésia</option>
                                <option>Irã</option>
                                <option>Iraque</option>
                                <option>Irlanda</option>
                                <option>Islândia</option>
                                <option>Israel</option>
                                <option>Itália</option>
                                <option>Jamaica</option>
                                <option>Japão</option>
                                <option>Jibuti</option>
                                <option>Jordânia</option>
                                <option>Laus</option>
                                <option>Lesoto</option>
                                <option>Letónia</option>
                                <option>Líbano</option>
                                <option>Libéria</option>
                                <option>Líbia</option>
                                <option>Listenstaine</option>
                                <option>Lituânia</option>
                                <option>Luxemburgo</option>
                                <option>Macedónia</option>
                                <option>Madagáscar</option>
                                <option>Malásia</option>
                                <option>Maláui</option>
                                <option>Maldivas</option>
                                <option>Mali</option>
                                <option>Malta</option>
                                <option>Marrocos</option>
                                <option>Maurícia</option>
                                <option>Mauritânia</option>
                                <option>México</option>
                                <option>Mianmar</option>
                                <option>Micronésia</option>
                                <option>Moçambique</option>
                                <option>Moldávia</option>
                                <option>Mónaco</option>
                                <option>Mongólia</option>
                                <option>Montenegro</option>
                                <option>Namíbia</option>
                                <option>Nauru</option>
                                <option>Nepal</option>
                                <option>Nicarágua</option>
                                <option>Níger</option>
                                <option>Nigéria</option>
                                <option>Noruega</option>
                                <option>Nova Zelândia</option>
                                <option>Omã</option>
                                <option>Países Baixos</option>
                                <option>Palau</option>
                                <option>Panamá</option>
                                <option>Papua Nova Guiné</option>
                                <option>Paquistão</option>
                                <option>Paraguai</option>
                                <option>Peru</option>
                                <option>Polónia</option>
                                <option>Portugal</option>
                                <option>Quénia</option>
                                <option>Quirguistão</option>
                                <option>Quiribáti</option>
                                <option>Reino Unido</option>
                                <option>República Centro-Africana</option>
                                <option>República Checa</option>
                                <option>República Democrática do Congo</option>
                                <option>República Dominicana</option>
                                <option>Roménia</option>
                                <option>Ruanda</option>
                                <option>Rússia</option>
                                <option>Salomão</option>
                                <option>Samoa</option>
                                <option>Santa Lúcia</option>
                                <option>São Cristóvão e Neves</option>
                                <option>São Marinho</option>
                                <option>São Tomé e Príncipe</option>
                                <option>São Vicente e Granadinas</option>
                                <option>Seicheles</option>
                                <option>Senegal</option>
                                <option>Serra Leoa</option>
                                <option>Sérvia</option>
                                <option>Singapura</option>
                                <option>Síria</option>
                                <option>Somália</option>
                                <option>Sri Lanca</option>
                                <option>Suazilândia</option>
                                <option>Sudão</option>
                                <option>Sudão do Sul</option>
                                <option>Suécia</option>
                                <option>Suíça</option>
                                <option>Suriname</option>
                                <option>Tailândia</option>
                                <option>Taiuã</option>
                                <option>Tajiquistão</option>
                                <option>Tanzânia</option>
                                <option>Timor-Leste</option>
                                <option>Togo</option>
                                <option>Tonga</option>
                                <option>Trindade e Tobago</option>
                                <option>Tunísia</option>
                                <option>Turcomenistão</option>
                                <option>Turquia</option>
                                <option>Tuvalu</option>
                                <option>Ucrânia</option>
                                <option>Uganda</option>
                                <option>Uruguai</option>
                                <option>Usbequistão</option>
                                <option>Vanuatu</option>
                                <option>Vaticano</option>
                                <option>Venezuela</option>
                                <option>Vietname</option>
                                <option>Zâmbia</option>
                                <option>Zimbábue</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar...
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>State</label>
                            <select name = "estado" data-toggle="tooltip" title='Estado que ocorrerá' data-placement="bottom" class="custom-select d-block w-100" id="estado"  required >
                                <option>São Paulo</option>
                                <option>Rio de Janeiro</option>
                                <option>Acre</option>
                                <option>Alagoas</option>
                                <option>Amapá</option>
                                <option>Amazonas</option>
                                <option>Bahia</option>
                                <option>Ceará</option>
                                <option>Distrito Federal</option>
                                <option>Espírito Santo</option>
                                <option>Goiás</option>
                                <option>Maranhão</option>
                                <option>Mato Grosso</option>
                                <option>Mato Grosso do Sul</option>
                                <option>Minas Gerais</option>
                                <option>Pará</option>
                                <option>Paraíba</option>
                                <option>Paraná</option>
                                <option>Pernambuco</option>
                                <option>Piauí</option>
                                <option>Rio Grande do Norte</option>
                                <option>Rio Grande do Sul</option>
                                <option>Rondônia</option>
                                <option>Roraima</option>
                                <option>Santa Catarina</option>
                                <option>Sergipe</option>
                                <option>Tocantins</option>
                                <option>International</option>
                            </select>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label>City</label>
                            <div class="input-group">
                                <input name="cidade" data-toggle="tooltip" title='Cidade que ocorrerá' data-placement="bottom" type="text" maxlength="60"  class="form-control" id="cidade" required>
                            </div>
                        </div>

                        <div class="col-md-2 mb-3">
                            <label>Probability (%)</label>
                            <select name = "probability" data-toggle="tooltip" title='Probabilidade de ganhar o projeto'  data-placement="right" onchange="Probability()" class="custom-select d-block w-100" id="probability"  required>
                                <option>0</option>
                                <option>20</option>
                                <option>30</option>
                                <option selected>50</option>
                                <option>60</option>
                                <option>70</option>
                                <option>95</option>
                                <option>100</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Project Status</strong></label>
                            <select name = "projectstatus" data-toggle="tooltip" title='Status do Projeto'  data-placement="left" onchange="StatusVSProbability()" class="custom-select d-block w-100" id="projectstatus"  required>
                                <option>Open</option>
                                <option>Lost</option>
                                <option>Won</option>
                                <option>Canceled</option>
                                <option>Declined</option>
                                <option>Pending</option>

                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar o status...
                            </div>
                        </div>

                        <div id='lostReason' class="col-md-2 mb-3">
                            <label>Lost Reason</label>
                            <select style="background-color: lightcoral; color: white" name = "lostreason"  class="custom-select d-block w-100" id="lostreason">
                                <option selected>Price</option>
                                <option>Creativity</option>
                                <option>Planning</option>
                                <option>Scenography</option>
                                <option>Unknown</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar o status...
                            </div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label>Audit Status</label>
                            <select name = "projectaudit" data-toggle="tooltip" title='Status de auditoria' data-placement="bottom" class="custom-select d-block w-100" id="projectaudit"  required>
                                <option selected>Em produção</option>
                                <option>Realizado</option>
                                <option>Auditado</option>
                                <option>Lost</option>
                                <option>Canceled</option>
                                <option>Pending</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar o status...
                            </div>
                        </div>

                        <div id = 'demais' class ="col-md-2 mb-3" data-toggle="tooltip" title='Projeto envolve'  data-placement="right">
                            <input type="checkbox" name="option1" value = "Criação" > Creation<br>
                            <input type="checkbox" name="option2" value = "Planejamento"> Plan.<br>
                            <input type="checkbox" name="option3" value = "Produção"> Production<br>
                            <input type="checkbox" name="option4" value = "Produção"> Logistic<br>
                        </div>
                        <div id = 'dorier' class ="col-md-2 mb-3" data-toggle="tooltip" title='Projeto Dorier envolve'  data-placement="right">
                            <input type="checkbox" name="option1" value = "Stand" > Stand<br>
                            <input type="checkbox" name="option2" value = "Scenography">Scenography<br>
                            <input type="checkbox" name="option3" value = "Audio and Visual"> Audio and Visual<br>
                            <input type="checkbox" name="option4" value = "Services" data-toggle="tooltip" title="Serviços: Mascote, tradutor, segurança, DJ..." data-placement="bottom"> Services<br>
                        </div>

                        <div class="col-md-5 mb-3">
                            <label>MCI Contact <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input name="contatomci" data-toggle="tooltip" title='Liderança do setor'  data-placement="right" autocomplete = "off" type="text" onchange="naBaseContato(this.value)" class="form-control" id="contatomci" placeholder="" value="" maxlength ="40" required>
                                <div class="invalid-feedback">
                                    Nome necessário
                                </div>
                            </div>
                        </div>

                    </div>

                    <h5 class="mb-0">
                        <span class="text-primary">Gross Margin Information</span>
                    </h5>
                    <br>
                    <div class="row">

                        <br>
                        <div class="col-md-3 mb-3">
                            <label>Turnover Forecasted by Project Owner <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input onchange="Calcular()" name="turnoverforowner" data-toggle="tooltip"  data-placement="left" title="Budget do cliente" type="text" min="0" step="0,01" class="form-control"  id="turnoverforowner" placeholder="" required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label>GM forecasted <br>by project owner <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input name="gmforowner" data-toggle="tooltip" title="Valor esperado de lucro"  data-placement="bottom" type="text" min = "0"  step="0,01" class="form-control" onchange="Calcular()" id="gmforowner" placeholder="" required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>GM /Turnover <br>Percentage (%)</label>
                            <div class="input-group">
                                <input name="gmturnoverperc" data-toggle="tooltip" title="Porcentagem de lucro" data-placement="bottom" readonly type="number"  class="form-control" id="gmturnoverperc" placeholder="" required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Weighted<br> 
                                prospect</label>
                            <div class="input-group">
                                <input readonly name="weightedprospec" data-toggle="tooltip"  title="Valor calculado de Lucro" data-placement="bottom" type="text" class="form-control" id="weightedprospec" placeholder=""  required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label>GM Splited/BV?</label>
                            <select onchange="gmSplited()" name = "splitConfirm" id ='splitConfirm' data-toggle="tooltip" title='GM Dividida com as áreas...' data-placement="bottom" class="custom-select d-block w-100"  required>
                                <option selected>No</option>
                                <option>Yes</option>
                            </select>
                        </div>

                        <div style='font-size: small' id = 'splited' class ="col-md-2 mb-3" data-toggle="tooltip" title='GM Dividida com as áreas...'  data-placement="right">
                            <input type="checkbox" name="split1" id="split1" value = "HUB" >HUB<br>
                            <input type="checkbox" name="split2" id="split2" value = "Services">Services<br>
                            <input type="checkbox" name="split3" id="split3" value = "PCO"> PCO<br>
                            <input type="checkbox" name="split4" id="split4" value = "Housing"> Housing<br>
                            <input type="checkbox" name="split5" id="split5" value = "Key Accounts"> Key Accounts<br>
                            <input type="checkbox" name="split6" id="split6" value = "Incentive/Ovation"> Incentive/Ovation<br>
                            <input type="checkbox" name="split7" id="split7" value = "Dorier"> Dorier<br>
                        </div>
                        <div id="splitedbv" class="col-md-2 mb-3">
                            <label>Percentage %</label>
                            <div class="input-group">
                                <input name="bvpercentage" data-toggle="tooltip" title="Porcentagem de BV (se aplicável)" data-placement="bottom" type= "number" class="form-control" min = "0" value ="0" id="bvpercentage" placeholder="" value="" maxlength ="50">
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>


                    </div>
                    <h5 class="mb-0">
                        <span class="text-primary">History</span>
                    </h5>                    
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label>Yuzu Path</label>
                            <div class="input-group">
                                <input name="folderpath" data-toggle="tooltip" title='Caminho na rede para documentos' data-placement="bottom" autocomplete="off" type="text" class="form-control" maxlength="200" id="folderpath" placeholder="Example https://mci.sharepoint.com/sites/yuzu/Pages/Projects.aspx">
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>

                    </div>

                    <br>
                    <button class="btn btn-lg btn-outline-success" type="submit" onclick="{
                                return confirmCompleteProjeto();
                            }" name = "gravarprojeto"><span data-feather="save"></span> Save Project</button>


                </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-0">&copy; MCI Brasil</p>
            </footer>

        </form>

        <%} else {

                String path = "Home.jsp";
                String mensagem = "You cannot create a Project";
                request.setAttribute("path", path);
                out.println("<script type='text/javascript'>");
                out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
                out.println("</script>");

            }%>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script src="js/calcularProjeto.js"></script>
        <script src="js/tamanhodata.js"></script>
        <script src="js/searchSuggestProjectname.js"></script>
        <script src="js/searchSuggestProjectCode.js"></script>
        <script src="js/confirmCompleteProjeto.js"></script>
        <script src="js/Probability.js"></script>
        <script src="js/Localidade.js"></script>
        <script src="js/formatarMoeda.js"></script>
        <script src="js/collapse_button.js"></script>
        <script src="js/StatusVSProbability.js"></script>

        <script>
                        // Example starter JavaScript for disabling form submissions if there are invalid fields
                        (function () {
                            'use strict';
                            window.addEventListener('load', function () {
                                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                var forms = document.getElementsByClassName('needs-validation');
                                // Loop over them and prevent submission
                                var validation = Array.prototype.filter.call(forms, function (form) {
                                    form.addEventListener('submit', function (event) {
                                        if (form.checkValidity() === false) {
                                            event.preventDefault();
                                            event.stopPropagation();
                                        }
                                        form.classList.add('was-validated');
                                    }, false);
                                });
                            }, false);
                        }
                        )();
        </script>


        <script>
            webshims.setOptions('forms-ext', {
                replaceUI: 'auto',
                types: 'number'
            });
            webshims.polyfill('forms forms-ext');
        </script>


        <script src="js/jquery.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script src="js/jquery.maskMoney.js"></script>
        <script src="js/AnoFiscal.js"></script>
        <script src="js/customAlert.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/DorierValida.js"></script>
        <script src="js/lostReason.js"></script>
        <script src="js/codeUnique.js"></script>
        <script src="js/datasProjetoValida.js"></script>
        <script src="js/projects/ContatoMCI.js"></script>
        <script src="js/projects/therapyCluster.js"></script>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

        <script>
            $("#projectname").autocomplete("getdataProjetos.jsp");
        </script>

        <script>

            window.onload = function () {

                lostReason();

                therapyCluster(document.getElementById('industrysector').value);

                ContatoMCI(document.getElementById('subarea').value);

                var subarea = document.getElementById('subarea').value;
                document.getElementById('splited').style.display = 'none';
                document.getElementById('splitedbv').style.display = 'none';

                if (subarea == 'Dorier') {
                    document.getElementById('dorier').style.display = 'block';
                    document.getElementById('demais').style.display = 'none';
                    document.getElementById('buDorier').style.display = 'block';
                    document.getElementById('buDemais').style.display = 'none';
                    document.getElementById('others').name = "disabled";
                    document.getElementById('dorierBu').name = "additionalclientname";
                } else {
                    document.getElementById('dorier').style.display = 'none';
                    document.getElementById('demais').style.display = 'block';
                    document.getElementById('buDorier').style.display = 'none';
                    document.getElementById('buDemais').style.display = 'block';
                    document.getElementById('dorierBu').name = "disabled";
                    document.getElementById('others').name = "additionalclientname";

                }
            };

        </script>

        <script>

            function gmSplited() {

                var confirm = document.getElementById('splitConfirm').value;


                if (confirm === 'Yes') {
                    document.getElementById('splited').style.display = 'block';
                    document.getElementById('splitedbv').style.display = 'block';

                } else {
                    document.getElementById('splited').style.display = 'none';
                    document.getElementById('splitedbv').style.display = 'none';

                }



            }

        </script>

        <script>

            $("#contatomci").autocomplete({
                source: $("#contatomci").autocomplete("getdataContatoMCI.jsp")});

            $("#accountmanager").autocomplete({
                source: $("#accountmanager").autocomplete("getdataContatoMCI.jsp")});

            $("#projectmanager").autocomplete({
                source: $("#projectmanager").autocomplete("getdataContatoMCI.jsp")});

            function naBaseContato(val) {
                var source = $("#contatomci").autocomplete("getdataContatoMCI.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('contatomci').value = "";
                        document.getElementById('contatomci').placeholder = "Contact is not in the database, please include";

                    }
                }
            }
        </script>
        <script>

            $("#mcistdcliname").autocomplete({
                source: $("#mcistdcliname").autocomplete("getdataClientes.jsp")});

            function naBaseClientes(val) {
                var source = $("#mcistdcliname").autocomplete("getdataClientes.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('mcistdcliname').value = "";
                        document.getElementById('mcistdcliname').placeholder = "Client is not in the database, please include";
                    }
                }
            }


        </script>

        <script>

            $("#cidade").autocomplete({
                source: $("#cidade").autocomplete("getdataCidades.jsp")});

            function naBase(val) {
                var source = $("#cidade").autocomplete("getdataCidades.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        //document.getElementById('mcistdcliname').value = "";
                        //document.getElementById('mcistdcliname').placeholder = "Client is not in the database, please include";
                    }
                }
            }


        </script>

        <script>

            //$("#projectcode").autocomplete({
            //  source: $("#projectcode").autocomplete("getProjectCode.jsp")});

            function naBaseProjectCode(val) {
                var source = $("#projectcode").autocomplete("getProjectCode.jsp");

                console.log(val);

                console.log(source.value);

                var length = source.length;

                // document.getElementById('projectcode').value = 0;
                //document.getElementById('hintcode').value = "Código já em uso";
                // document.getElementById("hintcode").innerHTML = "Código já em uso";


            }


        </script>


        <script>

            // if (window.confirm('Lembre-se de criar o projeto também no Sharepoint \n e atualize o campo "Caminho na rede".\n Cancele caso já tenha criado')) {
            //    window.open('https://mci.sharepoint.com/sites/yuzu/Pages/Projects.aspx');
            // }
            // ;
        </script>

        <script src="js/feather.min.js"></script>
        <script>
            feather.replace()
        </script>

        <script>
            $(function () {
                $('#turnoverforowner').maskMoney();
                $('#gmforowner').maskMoney();
            });
        </script>
        <script>
            $('.panel-collapse').collapse({
                toggle: true
            });
        </script>
        <script>
            $('#element').tooltip('show');
        </script>

    </body>
</html>
