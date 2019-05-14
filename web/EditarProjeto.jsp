<%@page import="com.mcibrasil.opportunity.model.Projetos.ProjetosModel"%>
<%@page import="com.mcibrasil.opportunity.controller.AutoComplete.Projetos"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.NumberFormat"%>
<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    HttpSession sessao = request.getSession();

    Integer idgrupo = (Integer) sessao.getAttribute("idgrupo");
    boolean mobile = (Boolean) session.getAttribute("mobile");
    String roles = (String) sessao.getAttribute("roles");

%>
<%ProjetosModel projetos = new ProjetosModel(0, null, null, null, null,
            null, null, null, null, 0,
            null, null, null, 0, null,
            0, null, null, 0,
            0, 0, 0, 0,
            null, null, null, null, null, null, null, 0, 0,
            null, null, null, null, null, null, 0, 0, null, null, null, 0, null,"");

    projetos = (ProjetosModel) request.getAttribute("projetos");

    NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
            new Locale("pt", "BR"));

    String readonly = "";

    if (idgrupo == 2) {

        readonly = "readonly";

    }

%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="google" content="notranslate">
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">


        <!-- Custom styles for this template -->
        <link rel="stylesheet" type="text/css" href="css/buttonvoltar.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
        <link rel="stylesheet" type="text/css" href="css/collapse_button.css" />
        <link rel="stylesheet" type="text/css" href="css/customAlert.css" />
        <link rel="stylesheet" type="text/css" href="css/signature.css" />
        <link href="css/tabelaTamanho.css" rel="stylesheet">



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">

        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <title>Edit Project (BL)</title>

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

        <%@include  file = "navbar.jsp"%>
        <p></p>
        <div align ="right">
            <div class="col-md-9 order-md-1">
                <div class="row">
                    <div class="col-md-5 mb-3">
                        <h4 class="text-muted">Edit Opportunity/Project</h4>
                    </div>
                    <div class="col-md-2 mb-3">
                        <form name ="home">    
                            <button  formaction="Home.jsp" class = "buttonvoltar" ><span data-feather="home"></span> Home</button>
                        </form>
                    </div>
                    <div class="col-md-2 mb-3">
                        <form name = "ListarItensProjetos" action="${pageContext.request.contextPath}/ListarItensProjetos" method="POST">
                            <div class="btn-group">
                                <button type ="submit" id = "exportar"  name = "projectid" value="${projetos.projectid}" class="btn btn-sm btn-outline-secondary">List Items</button>
                            </div>
                        </form>  
                    </div>
                    <%if (idgrupo == 1 || idgrupo == 3 || idgrupo == 4 || idgrupo == 5) {%>
                    <!--div class="col-md-2 mb-3">
                        <form name = "ArquivarProjeto" id ="arquivar" action="${pageContext.request.contextPath}/ArquivarProjeto" method="GET">
                            <button data-toggle="tooltip"  title="Só é possível arquivar projetos Lost, Canceled ou Closed" class="btn btn-sm btn-outline-danger" onclick="{
                                        return confirmCompleteArchive();
                                    }" type="submit" name = "submit"> <span data-feather="archive"></span> Archive Project</button>
                            <input type ="hidden" name ="projectid" value="${projetos.projectid}">
                            <input type ="hidden" name ="projectname" value="${projetos.projectname}">
                        </form>
                    </div-->

                    <%}%>
                </div>
            </div>
        </div>
        <div align="center">
            <form name = "Projetos" id ="Projetos" action="${pageContext.request.contextPath}/EditarProjetoGravar" method="POST">
                <button style = "width: 65%; background-color: white;" type ="button" class="collapsible text-primary">General Information (click to expand)</button>
                <div class="content" style = "background-color: white;">
                    <div class="row" style="width: 75%;">
                        <div class="col-md-4 mb-3">
                            <label>Product Practice</label>
                            <select name = "prodpractice" class="custom-select d-block w-100" id="prodpractice"  required>
                                <option>${projetos.prodpractice}</option>
                                <option>M&E</option>
                                <option>PCO</option>
                                <option>AMC</option>
                                <option>DMC</option>
                                <option>ASSET</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Type of Service</label>
                            <select name = "typeservice" class="custom-select d-block w-100" id="typeservice"  required>
                                <option>${projetos.typeservice}</option>
                                <option>Event Management / PCO</option>
                                <option>Housing</option>
                                <option>SponEx Sales </option>
                                <option>Meeting / Conference Management services </option>
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
                                <option>Meeting / Conference Management services </option>
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
                                <option>${projetos.finanstatus}</option>
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
                                <option>${projetos.ctqualification}</option>
                                <option>Principal in Local gaap AND IFRS</option>
                                <option>Agent in Local gaap AND IFRS</option>
                                <option>Principal  in Local gaap BUT Agent in IFRS</option>
                                <option>Agent in Local gaap BUT Principal in IFRS</option>
                            </select>
                        </div>  
                        <div class="col-md-4 mb-3">
                            <label>Account Manager</label>
                            <div class="input-group">
                                <input onchange="naBaseContatoAccountManager(this.value)" data-toggle="tooltip" title="Account Manager do projeto" data-placement="left" type="text" autocomplete="off" class="form-control" value='${projetos.accountmanager}'  id="accountmanager" name="accountmanager" maxlength="70" placeholder="" >
                                <div class="invalid-feedback" style="width: 100%;">
                                    Nome obrigatório.
                                </div>
                            </div>
                            <!--label id ='clientenovo' style='color: red; background-color: transparent; outline: none; border-color: inherit; box-shadow: none;'/-->
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Project Manager</label>
                            <div class="input-group">
                                <input onchange="naBaseContatoProjectManager(this.value)" data-toggle="tooltip" title="Project Manager do projeto" data-placement="left" type="text" autocomplete="off" class="form-control" value='${projetos.projectmanager}'  id="projectmanager" name="projectmanager" maxlength="70" placeholder="" >
                                <div class="invalid-feedback" style="width: 100%;">
                                    Nome obrigatório.
                                </div>
                            </div>
                            <!--label id ='clientenovo' style='color: red; background-color: transparent; outline: none; border-color: inherit; box-shadow: none;'/-->
                        </div>
                    </div>
                </div>

                <h6 class="mb-0">
                    <span class="text-primary">Project Information</span>
                </h6>
                <p></p>
                <div class="col-md-9 order-md-1">
                    <div class="row">
                        <div class="col-md-2 mb-2">
                            <label>Project ID</label>
                            <input  type="text"  readonly class="form-control" id="projectid" name="projectid" value="${projetos.projectid}" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Creation Date</label>
                            <input  type="text"  readonly class="form-control" id="projectid" name="datacadastro" value="${projetos.datacadastro}" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Created by:</label>
                            <input  type="text"  readonly class="form-control" id="createdby" name="createdby" value="${projetos.createdby}" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Modified by:</label>
                            <input  type="text"  readonly class="form-control" id="emailuser" name="emailuser" value="${projetos.emailuser}" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Hours</label>
                            <input  type="text" data-toggle="tooltip"  title="Horas trabalhadas no projeto (Harvest)" data-placement="bottom" readonly class="form-control" id="harvesthours" name="harvesthours" value="${projetos.harvesthours}" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Cost</label>
                            <input  type="text" data-toggle="tooltip"  title="Custo das horas trabalhadas no projeto (Harvest)" data-placement="bottom" readonly class="form-control" id="harvestcost" name="harvestcost" value="<%=formatoMoeda.format(projetos.getHarvestcost()).replace("R$ ", "")%>" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-7 mb-3">
                            <label>MCI Standard Client Name <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input  type="text" autocomplete="off"  class="form-control" onchange="naBaseCliente(this.value)" id="mcistdcliname" name="mcistdcliname" value="${projetos.mcistdcliname}" maxlength="70" placeholder="" required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    Nome obrigatório.
                                </div>
                            </div>
                        </div>
                        <div id="buDemais" class="col-md-5 mb-3">
                            <label>Additional / Final Client Name</label>
                            <div class="input-group">
                                <input autocomplete="off"   value ="${projetos.additionalclientname}" type="text" class="form-control" id="others" placeholder="" maxlength ="70">
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>
                        <div id="buDorier" class="col-md-5 mb-3">
                            <label>Additional / Final Client Name</label>
                            <select data-toggle="tooltip" title="Nome adicional do Cliente" data-placement="right" class="custom-select d-block w-100" id="dorierBu" >
                                <option>${projetos.additionalclientname}</option>
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
                            <input name = "propreqdate" onblur="TamanhoData('propreqdate')" type="date" class="form-control" id="propreqdate" placeholder="dd/mm/aaaa" maxlength="10" value = "${projetos.propreqdate}" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-5 mb-3">
                            <label>Industry Sector</label>
                            <select onchange="therapyCluster(this.value)" name = "industrysector" class="custom-select d-block w-100" id="industrysector"  required>
                                <option>${projetos.industrysector}</option>
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
                                <option>Information Technology, Hardware & Software </option>
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
                                <option>${projetos.trpcluster}</option>
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
                            <select name = "customertype" value ="${projetos.customertype}" class="custom-select d-block w-100" id="customertype"  required>
                                <option>${projetos.customertype}</option>
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
                        <div class="col-md-8 mb-3">
                            <label>Project name <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input name="projectname" autocomplete="off" type="text" class="form-control" id="projectname" placeholder="" value="${projetos.projectname}" required maxlength ="70">
                                <div class="invalid-feedback">
                                    Nome necessário
                                </div>
                            </div>
                            <div id ="hint" style="color: red"></div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label id = "color" >Project Analytical code</label>
                            <div class="input-group">
                                <input name="projectcode" type="number" onblur="searchSuggestProjectCode(this.value);" class="form-control" min = "0" id="projectcode" placeholder="" value="${projetos.projectcode}" maxlength ="50" required>
                                <input type='hidden' name='codeUnique' id='codeUnique'>
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                            <div id ="hintcode" style="color: red"></div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Event Starting date<strong style="color: red;">***</strong></label>
                            <input name = "eventstartdate" onblur="TamanhoData('eventstartdate')" type="date" class="form-control" id="eventstartdate" placeholder="dd/mm/aaaa" maxlength="10" value = "${projetos.eventstartdate}" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Event Status</label>
                            <select name = "eventstatus" value ="${projetos.eventstatus}" class="custom-select d-block w-100" id="eventstatus"  required>
                                <option>${projetos.eventstatus}</option>
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
                            <input name = "eventclosingdate" onblur="TamanhoData('eventclosingdate')" type="date" class="form-control" id="eventclosingdate" placeholder="dd/mm/aaaa" maxlength="10" value = "${projetos.eventclosingdate}" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>N° of pax</label>
                            <div class="input-group">
                                <input name="paxnumber" type="number" class="form-control" min = "0" id="paxnumber" placeholder="" value="${projetos.paxnumber}" maxlength ="50" required>
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Cancellation Insurance</label>
                            <select name = "cancelinsurance" value= "${projetos.cancelinsurance}" class="custom-select d-block w-100" id="cancelinsurance"  required>
                                <options>${projetos.cancelinsurance}</options>
                                <option>No</option>
                                <option>Yes</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar...
                            </div>
                        </div>



                        <%String changeSubarea = "";

                            if (idgrupo != 5 && idgrupo != 1) {

                                changeSubarea = "disabled";

                            }

                        %>

                        <div class="col-md-3 mb-3">
                            <label>Area</label>
                            <select  onchange="show(this.value)" name = "subarea" class="custom-select d-block w-100" id="subarea" value="${projetos.subarea}" required>
                                <option>${projetos.subarea}</option>
                                <option <%=changeSubarea%>>HUB</option>
                                <option <%=changeSubarea%>>Key Accounts</option>
                                <option <%=changeSubarea%>>Services</option>
                                <option <%=changeSubarea%>>Incentive/Ovation</option>
                                <option <%=changeSubarea%>>Dorier</option>
                                <option <%=changeSubarea%>>PCO</option>
                                <option <%=changeSubarea%>>Housing</option>
                                <!--option <%//=changeSubarea%>>Projetos Proprietários</option-->
                                <option <%=changeSubarea%>>Campus Party</option>
                                <option <%=changeSubarea%>>AM&C</option>
                                <option <%=changeSubarea%>>One MCI</option>
                                <option <%=changeSubarea%>>Test Area</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar a Area...
                            </div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label>Country</label>
                            <select name = "pais" onchange="Localidade()" class="custom-select d-block w-100" id="pais"  required>
                                <option>${projetos.pais}</option>
                                <option>TBC</option>
                                <option>Diversos</option>
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
                                <option>Brazil</option>
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
                            <select name = "estado" class="custom-select d-block w-100" value ="${projetos.estado}" id="estado"  required>
                                <option>${projetos.estado}</option>
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
                                <option>Rio de Janeiro</option>
                                <option>Rio Grande do Norte</option>
                                <option>Rio Grande do Sul</option>
                                <option>Rondônia</option>
                                <option>Roraima</option>
                                <option>Santa Catarina</option>
                                <option>São Paulo</option>
                                <option>Sergipe</option>
                                <option>Tocantins</option>
                                <option>International</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar um Estado..
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>City <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input name="cidade" type="text" maxlength="60" value ="${projetos.cidade}" class="form-control" id="cidade" required>
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2 mb-3">
                            <label>Probability (%)</label>
                            <select name = "probability" data-toggle="tooltip" title='Probabilidade de ganhar o projeto'  data-placement="right" onchange="Probability()" class="custom-select d-block w-100" id="probability"  required>
                                <option>${projetos.probability}</option>
                                <option>0</option>
                                <option>20</option>
                                <option>30</option>
                                <option>50</option>
                                <option>60</option>
                                <option>70</option>
                                <option>95</option>
                                <option>100</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Project Status</strong></label>
                            <select name = "projectstatus" onchange="StatusVSProbability()" value = "${projetos.projectstatus}" class="custom-select d-block w-100" id="projectstatus"  required>
                                <option>${projetos.projectstatus}</option>
                                <option>Open</option>
                                <option>Lost</option>
                                <option>Won</option>
                                <option>Closed</option>
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
                            <select style="background-color: lightcoral; color: white" name = "lostreason"  value = "${projetos.lostreason}" class="custom-select d-block w-100" id="lostreason">
                                <%if (projetos.getLostreason().equals("")) {%>
                                <option>Price</option>
                                <option>Creativity</option>
                                <option>Planning</option>
                                <option>Scenography</option>
                                <option>Relation Termination</option>
                                <option>Unknown</option>
                                <option>Other</option>
                                <%} else {%>
                                <option>${projetos.lostreason}</option>
                                <option>Price</option>
                                <option>Creativity</option>
                                <option>Planning</option>
                                <option>Scenography</option>
                                <option>Relation Termination</option>
                                <option>Unknown</option>
                                <option>Other</option>
                                <%}%>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar o status...
                            </div>
                        </div>


                        <div class="col-md-3 mb-3">
                            <label>Audit Status</label>
                            <select name = "projectaudit" ${projetos.projectaudit} class="custom-select d-block w-100" id="projectaudit"  required>
                                <option>${projetos.projectaudit}</option>
                                <option>Em produção</option>
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

                        <div id="demais" class ="col-md-2 mb-3">
                            <%if (projetos.getCriplan().contains("Criação")) {
                            %>
                            <input type="checkbox" name="option1" value = "Criação" checked > Creation<br>
                            <%} else {%>
                            <input type="checkbox" name="option1" value = "Criação" > Creation<br>
                            <%}%>
                            <%if (projetos.getCriplan().contains("Planejamento")) {
                            %>
                            <input type="checkbox" name="option2" value = "Planejamento" checked> Plan.<br>
                            <%} else {%>
                            <input type="checkbox" name="option2" value = "Planejamento"> Plan.<br>
                            <%}%>
                            <%if (projetos.getCriplan().contains("Produção")) {
                            %>
                            <input type="checkbox" name="option3" value = "Produção" checked> Production<br>
                            <%} else {%>
                            <input type="checkbox" name="option3" value = "Produção"> Production<br>
                            <%}%>
                            <%if (projetos.getCriplan().contains("Logístisca")) {
                            %>
                            <input type="checkbox" name="option4" value = "Logístisca" checked > Logistic<br>
                            <%} else {%>
                            <input type="checkbox" name="option4" value = "Logístisca" > Logistic<br>
                            <%}%>
                        </div>

                        <div id="dorier" class ="col-md-2 mb-3">
                            <%if (projetos.getCriplan().contains("Stand")) {
                            %>
                            <input type="checkbox" name="option1" value = "Stand" checked > Stand<br>
                            <%} else {%>
                            <input type="checkbox" name="option1" value = "Stand" > Stand<br>
                            <%}%>
                            <%if (projetos.getCriplan().contains("Scenography")) {
                            %>
                            <input type="checkbox" name="option2" value = "Scenography" checked> Scenography<br>
                            <%} else {%>
                            <input type="checkbox" name="option2" value = "Scenography" > Scenography<br>
                            <%}%>
                            <%if (projetos.getCriplan().contains("Audio and Visual")) {
                            %>
                            <input type="checkbox" name="option3" value = "Audio and Visual" checked> Audio and Visual<br>
                            <%} else {%>
                            <input type="checkbox" name="option3" value = "Audio and Visual"> Audio and Visual<br>
                            <%}%>
                            <%if (projetos.getCriplan().contains("Services")) {
                            %>
                            <input type="checkbox" name="option4" value = "Services" checked data-toggle="tooltip" title="Serviços: Mascote, tradutor, segurança, DJ..." data-placement="bottom"> Services<br>
                            <%} else {%>
                            <input type="checkbox" name="option4" value = "Services" data-toggle="tooltip" title="Serviços: Mascote, tradutor, segurança, DJ..." data-placement="bottom"> Services<br>
                            <%}%>

                        </div>
                        <div class="col-md-4 mb-3">
                            <label>MCI Contact <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input name="contatomci" type="text" class="form-control"  onchange="naBaseContato(this.value)" id="contatomci" placeholder="" value="${projetos.contatomci}" maxlength ="40" required>
                                <div class="invalid-feedback">
                                    Nome necessário
                                </div>
                            </div>
                        </div>
                    </div>

                    <h6 class="mb-0">
                        <span class="text-primary">Gross Margin Information</span>
                    </h6>
                    <p></p>
                    <!--VALORES HISTORY-->

                    <button type ="button" class="collapsible">Previous values (click to expand)</button>
                    <table border='1' cellpadding='5' class="content">
                        <tr data-toggle="tooltip"  title="Valor mostrado sempre será o anterior ao atual">
                            <td>Previous Turn Over</td>
                            <td>Previous GM for Owner</td>
                            <td>Previous GM Closed</td>
                            <td>Last modified by:</td>
                            <td>Last modified date:</td>
                        </tr>
                        <%
                            ResultSet valores = (ResultSet) request.getAttribute("valores");

                            if (valores.next() == false) {

                                out.println("<script type=\"text/javascript\">");
                                //out.println("alert('Nenhum Histórico encontrado');");
                                out.println("</script>");

                            } else {
                                do {%>
                        <tr data-toggle="tooltip"  title="Valor mostrado sempre será o anterior ao atual">
                            <td><%=formatoMoeda.format(valores.getDouble("pvturnoverforowner"))%></td>
                            <td><%=formatoMoeda.format(valores.getDouble("pvgmforowner"))%></td>
                            <td><%=formatoMoeda.format(valores.getDouble("pvgmclosed"))%></td>
                            <td><%=valores.getString("emailuser")%></td>
                            <td><%=valores.getString("dataupdate")%></td>

                            <%} while (valores.next());

                                }
                            %>

                    </table>
                    <p></p>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label>Turnover Forecasted by Project Owner <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input <%=readonly%> onchange="Calcular()" name="turnoverforowner" value="<%=formatoMoeda.format(projetos.getTurnoverforowner() - projetos.getSalesconfirmed()).replace("R$ ", "")%>"step="0,01" type="text"  class="form-control" id="turnoverforowner" placeholder=""  required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>GM forecasted <br>by project owner <strong style="color: red;">***</strong></label>
                            <div class="input-group">
                                <input <%=readonly%> name="gmforowner" step="0,01" type="text" value ="<%=formatoMoeda.format(projetos.getGmforowner()).replace("R$ ", "")%>" onchange="Calcular()" class="form-control" id="gmforowner" placeholder="" required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>GM /Turnover<br> Percentage(%)</label>
                            <div class="input-group">
                                <input name="gmturnoverperc" readonly value = "${projetos.gmturnoverperc}" type="number"  class="form-control" id="gmturnoverperc" placeholder="" required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Weighted<br> 
                                prospect</label>
                            <div class="input-group">
                                <input readonly name="weightedprospec" value = "<%=formatoMoeda.format(projetos.getWeightedprospec()).replace("R$ ", "")%>" type="text" class="form-control" id="weightedprospec" placeholder=""  required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>GM Splited/BV?</label>
                            <select onchange="gmSplited()" name = "splitConfirm" data-toggle="tooltip" title='GM Dividida com as áreas...' data-placement="bottom" class="custom-select d-block w-100" id="splitConfirm"  required>

                                <%if (projetos.getGmsplited().equals("")) {%>
                                <option selected>No</option>
                                <option>Yes</option>
                                <%} else {%>
                                <option>No</option>
                                <option selected>Yes</option>
                                <%}%>
                            </select>
                        </div>

                        <div data-toggle="tooltip" title='GM Dividida com as áreas...' data-placement="top" style='font-size: small' id="splited" class ="col-md-2 mb-3">
                            <%if (projetos.getGmsplited().contains("HUB")) {
                            %>
                            <input type="checkbox" name="split1" value = "HUB" checked > HUB<br>
                            <%} else {%>
                            <input type="checkbox" name="split1" value = "HUB" > HUB<br>
                            <%}%>
                            <%if (projetos.getGmsplited().contains("Services")) {
                            %>
                            <input type="checkbox" name="split2" value = "Services" checked> Services<br>
                            <%} else {%>
                            <input type="checkbox" name="split2" value = "Services"> Services<br>
                            <%}%>
                            <%if (projetos.getGmsplited().contains("PCO")) {
                            %>
                            <input type="checkbox" name="split3" value = "PCO" checked> PCO<br>
                            <%} else {%>
                            <input type="checkbox" name="split3" value = "PCO"> PCO<br>
                            <%}%>

                            <%if (projetos.getGmsplited().contains("Housing")) {
                            %>
                            <input type="checkbox" name="split4" value = "Housing" checked> Housing<br>
                            <%} else {%>
                            <input type="checkbox" name="split4" value = "Housing"> Housing<br>
                            <%}%>

                            <%if (projetos.getGmsplited().contains("Key Accounts")) {
                            %>
                            <input type="checkbox" name="split5" value = "Key Accounts" checked > Key Accounts<br>
                            <%} else {%>
                            <input type="checkbox" name="split5" value = "Key Accounts" > Key Accounts<br>
                            <%}%>
                            <%if (projetos.getGmsplited().contains("Incentive/Ovation")) {
                            %>
                            <input type="checkbox" name="split6" value = "Incentive/Ovation" checked > Incentive/Ovation<br>
                            <%} else {%>
                            <input type="checkbox" name="split6" value = "Incentive/Ovation" > Incentive/Ovation<br>
                            <%}%>
                            <%if (projetos.getGmsplited().contains("Dorier")) {
                            %>
                            <input type="checkbox" name="split7" value = "Dorier" checked > Dorier<br>
                            <%} else {%>
                            <input type="checkbox" name="split7" value = "Dorier" > Dorier<br>
                            <%}%>
                        </div>

                        <div id="splitedbv" class="col-md-2 mb-3">
                            <label>Percentage %</label>
                            <div class="input-group">
                                <input value="${projetos.bvpercentage}" name="bvpercentage" data-toggle="tooltip" title="Porcentagem de BV (se aplicável)" data-placement="bottom" type= "number" class="form-control" min = "0" value ="0" id="bvpercentage" placeholder="" value="" maxlength ="50">
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>

                        <%if (projetos.getSubarea().equals("Services") || projetos.getSubarea().equals("PCO")) {%>
                        <div class="col-md-3 mb-3">
                            <label>Turnover Confirmed</label>
                            <div class="input-group">
                                <input readonly name="salesconfirmed" value = "<%=formatoMoeda.format(projetos.getSalesconfirmed()).replace("R$ ", "")%>" type="text" class="form-control" id="salesconfirmed" placeholder=""  required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>GM Turnover Confirmed</label>
                            <div class="input-group">
                                <input readonly name="salesgm" value = "<%=formatoMoeda.format(projetos.getSalesgm()).replace("R$ ", "")%>" type="text" class="form-control" id="salesgm" placeholder=""  required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>

                        <%}%>

                        <div class="col-md-3 mb-3">
                            <label style="color: red;"><strong>GM Closed by PM</strong></label>
                            <div class="input-group">
                                <input <%=readonly%> name="gmclosed" onblur="confirmClosedProject()" data-toggle="tooltip"  title="GM final faturada (uso do financeiro)" data-placement="bottom" value="<%=formatoMoeda.format(projetos.getGmclosed()).replace("R$ ", "")%>" type="text"  class="form-control" id="gmclosed" placeholder=""  required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <span  class ="signature" data-toggle="tooltip"  title="Assinatura do PM aprovando a GM Closed" data-placement="bottom">PM</span>    
                        </div>
                        <div class="col-md-4 mb-3">
                            <span  class ="signature" data-toggle="tooltip"  title="Assinatura do Financeiro aprovando alteração da GM Closed" data-placement="bottom">Finance</span>    
                        </div>
                    </div>
                    <h6 class="mb-0">
                        <span class="text-primary">History</span>
                    </h6>                    
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label>Yuzu Path</label>
                            <input name="folderpath" autocomplete="off"  type="text" maxlength="200" value = "${projetos.folderpath}" class="form-control" id="folderpath" placeholder="Example https://mci.sharepoint.com/sites/yuzu/Pages/Projects.aspx">
                        </div>
                    </div>

                    <%if (!projetos.getProjectstatus().equals("Closed")) {

                            if (roles.contains("Edit Project")) {

                    %>

                    <button class="btn btn-lg btn-outline-success" type="submit" onclick="{
                                return confirmEditProjeto();
                            }" name = "gravarprojeto"><span data-feather="save"></span> Update Project</button> 
                    <%}
                        }%>
                    <p></p>
                    <p></p>
                    <input type="button" value="Add item" class = "btn btn-sm btn-outline-secondary" onclick="addRow('novoItem')" />  
                    <input type="button" value="Delete item" class = "btn btn-sm btn-outline-danger" onclick="deleteRow('novoItem')" />  
                    <p></p>
                    <p></p>
                    <div style="overflow-x:auto;">
                        <table class="table" id ="novoItem" border='2' cellpadding='5'>
                            <tr style="color: white;">
                                <td  bgcolor="#FF0066"></td>
                                <td  bgcolor="#FF0066">Line</td>
                                <td data-toggle="tooltip"  title="Input: Valor vendido é Subtraído da meta, Output: Valor é Somado à meta e Information: Informação" bgcolor="#FF0066" align = "center">Type</td>
                                <td  bgcolor="#FF0066" align = "center">Item name/Client Name</td>
                                <td  bgcolor="#FF0066" align = "center">Item value</td>
                                <td  bgcolor="#FF0066" align = "center">GM over item value</td>
                                <td  bgcolor="#FF0066" align = "center">Date</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>
        </div>

        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-0">&copy; MCI Brasil</p>
        </footer>
        <script>

            $(window).load(function () {
                $('#myModal').modal('show');
            });
        </script>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/vendor/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="assets/js/vendor/holder.min.js"></script>
        <script src="js/calcularProjeto.js"></script>
        <script src="js/tamanhodata.js"></script>
        <script src ="js/novoItemProjetos.js"></script>
        <script src ="js/searchSuggestProjectname.js"></script>
        <script src ="js/searchSuggestProjectCode.js"></script>
        <script src ="js/confirmEditProjeto.js"></script>
        <script src ="js/confirmCompleteProjeto.js"></script>
        <script src="js/Probability.js"></script>
        <script src="js/Localidade.js"></script>
        <script src="js/formatarMoeda.js"></script>
        <script src="js/collapse_button.js"></script>
        <script src="js/confirmClosedProject.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script src="js/jquery.maskMoney.js"></script>
        <script src="js/StatusVSProbability.js"></script>
        <script src="js/customAlert.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/valorDolar.js"></script>
        <script src="js/DorierValida.js"></script>
        <script src="js/lostReason.js"></script>
        <script src="js/codeUnique.js"></script>
        <script src="js/datasProjetoValida.js"></script>
        <script src="js/projects/ContatoMCI.js"></script>
        <script src="js/projects/therapyCluster.js"></script>

        <!-- Icons -->
        <script src="js/feather.min.js"></script>
        <script>
            feather.replace()
        </script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

        <script>
            $("#projectname").autocomplete("getdataProjetos.jsp");
        </script>

        <script>
            $(function () {

                $('#turnoverforowner').maskMoney();
                $('#gmforowner').maskMoney();
                $('#gmclosed').maskMoney();

            });
        </script>
        <script>
            $('.panel-collapse').collapse({
                toggle: false
            });
        </script>
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
                        document.getElementById('contatomci').placeholder = "Contato não cadastrado, solicitar inclusão";

                    }
                }
            }
        </script>
        <script>

            $("#mcistdcliname").autocomplete({
                source: $("#mcistdcliname").autocomplete("getdataClientes.jsp")});

            function naBaseCliente(val) {
                var source = $("#mcistdcliname").autocomplete("getdataClientes.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('mcistdcliname').value = "";
                        document.getElementById('mcistdcliname').placeholder = "Client is not in the Database, please include";

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

            $("#projectcode").autocomplete({
                source: $("#projectcode").autocomplete("getProjectCode.jsp")});

            function naBaseProjectCode(val) {
                var source = $("#projectcode").autocomplete("getProjectCode.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i].value == val) {
                        document.getElementById('projectcode').value = 0;
                        //document.getElementById('hintcode').value = "Código já em uso";
                        document.getElementById("hintcode").innerHTML = "Código já em uso";
                    }
                }
            }


        </script>

        <script>

            var projectstatus = document.getElementById('projectstatus').value;

            if (projectstatus === "Closed") {
                alert("<strong><br>This project is Closed and edit is not allowed</strong>");
            }


        </script>

        <script>


            var codigoprojeto = document.getElementById('projectcode').value;

            var projectstatus = document.getElementById('projectstatus').value;


            if (codigoprojeto == "0" && projectstatus != "Lost" || codigoprojeto == "0" && projectstatus != "Canceled") {

                document.getElementById('projectcode').style.backgroundColor = 'lightcoral';
                alert('<br><strong>Pending Project Code</strong>');

            }


        </script>

        <script>

            window.onload = function () {


                gmSplited();

                lostReason();

                var subarea = document.getElementById('subarea').value;
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
            $(function () {
                $('#currrency').maskMoney();

            });
        </script>

    </body>
</html>
