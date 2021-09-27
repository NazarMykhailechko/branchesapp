<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>

    <title>Опитування!!!</title>

    <meta charset="utf-8" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/css/select2.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/js/select2.min.js"></script>

    <style>
        .blue-button{
            background: #25A6E1;
            padding:3px 5px;
            color:#fff;
            font-family:'Helvetica Neue',sans-serif;
            font-size:12px;
            border-radius:2px;
            -moz-border-radius:2px;
            -webkit-border-radius:4px;
            border:1px solid #1A87B9
        }
        table {
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            width: 50%;
        }
        th {
            background: SteelBlue;
            color: white;
        }
        td,th{
            border: 1px solid gray;
            width: 25%;
            text-align: left;
            padding: 5px 10px;
        }
        .text {
            text-align:  center;
        }
        h1 {
            color: red;
        }




        body {
            /* 	font-family: 'Ubuntu', sans-serif; */
            /*font-weight: bold;*/
        }
        .select2-container {
            min-width: 800px;
        }

        .select2-results__option {
            padding-right: 20px;
            vertical-align: middle;
        }
        .select2-results__option:before {
            content: "";
            display: inline-block;
            position: relative;
            height: 20px;
            width: 20px;
            border: 2px solid #e9e9e9;
            border-radius: 4px;
            background-color: #fff;
            margin-right: 20px;
            vertical-align: middle;
        }
        .select2-results__option[aria-selected=true]:before {
            font-family:fontAwesome;
            content: "\f00c";
            color: #fff;
            background-color: red;
            border: 0;
            display: inline-block;
            padding-left: 3px;
        }


        .select2-container--default .select2-results__option[aria-selected=true] {
            background-color: #fff;
        }
        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #eaeaeb;
            color: #272727;
        }
        .select2-container--default .select2-selection--multiple {
            margin-bottom: 10px;
        }
        .select2-container--default.select2-container--open.select2-container--below .select2-selection--multiple {
            border-radius: 4px;
        }

        .select2-container--default.select2-container--focus .select2-selection--multiple {
            border-color: red;
            border-width: 2px;
        }

        .select2-container--open .select2-dropdown--below {

            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);

        }
        .select2-selection .select2-selection--multiple:after {
            content: 'hhghgh';
        }

        /* select with icons badges single*/
        .select-icon .select2-selection__placeholder .badge {
            display: none;
        }

        .select-icon .placeholder {
            /* 	display: none; */
        }
        .select-icon .select2-results__option:before,
        .select-icon .select2-results__option[aria-selected=true]:before {
            display: none !important;
            /* content: "" !important; */
        }
        .select-icon  .select2-search--dropdown {
            display: none;
        }

    </style>
</head>
<body>

<div class="text">
    <img src="data:image/svg+xml;base64,PHN2ZyBpZD0ibC11LWciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMTg3LjdweCIgaGVpZ2h0PSI0NC44cHgiIHZpZXdCb3g9IjAgMCAxODcuNyA0NC44IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxODcuNyA0NC44OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPg0KCS5zdDB7ZmlsbC1ydWxlOmV2ZW5vZGQ7Y2xpcC1ydWxlOmV2ZW5vZGQ7ZmlsbDojQ0MwMDAwO30NCgkuc3Qxe2ZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO2ZpbGw6Izk5OTk5OTt9DQo8L3N0eWxlPg0KPHBhdGggY2xhc3M9InN0MCIgZD0iTTQzLjYsMjcuNUwyMi4xLDlMMC42LDI3LjVDMC4yLDI1LjgsMCwyNC4yLDAsMjIuNEMwLDEwLDkuOSwwLDIyLjEsMGMxMi4yLDAsMjIuMSwxMCwyMi4xLDIyLjQgQzQ0LjIsMjQuMiw0NCwyNS44LDQzLjYsMjcuNSBNMTAxLDM1LjFjMy41LDAsNS4yLTAuMiw2LjQtMC41YzIuNC0wLjcsNC0yLjMsNC44LTQuOGMwLjMtMC44LDAuNC0xLjUsMC40LTIuMiBjMC0yLjMtMC45LTQuNC0yLjYtNS45Yy0xLjYtMS40LTMuNi0yLTYtMmgtNC4xYy0wLjUsMC4xLTEsMC4zLTEuMiwwLjdjLTAuMiwwLjQtMC40LDAuOC0wLjUsMS4zdjE5LjZoMi44VjM1LjEgTTEwOC4yLDIyLjggYzAuOCwxLjMsMS4zLDMuMSwxLjMsNC45YzAsMS43LTAuNCwzLjEtMS4zLDQuNGMtMSwxLjQtMi4zLDIuMS0zLjksMi4xbC0zLjMsMFYyMS4xYzAtMC4zLDAuMi0wLjUsMC41LTAuNWwyLjcsMCBDMTA1LjksMjAuNSwxMDcuMywyMS4zLDEwOC4yLDIyLjh6IE04OC4yLDM1LjVjMi4zLDAsNC4yLTAuNyw1LjctMi4yYzEuNS0xLjUsMi4zLTMuNCwyLjMtNS44YzAtMi4zLTAuOC00LjItMi4zLTUuNiBjLTEuNS0xLjUtMy40LTIuMi01LjYtMi4yYy0yLjMsMC00LjIsMC43LTUuNiwyLjJjLTEuNSwxLjUtMi4yLDMuNC0yLjIsNS43YzAsMi4zLDAuNyw0LjIsMi4zLDUuN0M4NC4xLDM0LjgsODYsMzUuNSw4OC4yLDM1LjUgTTkyLjMsMzIuMWMtMSwxLjctMi4zLDIuNi00LDIuNmMtMS43LDAtMy0wLjgtNC0yLjNDODMuNSwzMSw4MywyOS40LDgzLDI3LjZjMC0xLjksMC40LTMuNSwxLjItNC45YzEtMS42LDIuMy0yLjQsNC0yLjQgYzEuNiwwLDIuOSwwLjcsMy45LDIuMmMwLjksMS4zLDEuMywyLjksMS4zLDQuNkM5My41LDI5LjEsOTMuMSwzMC43LDkyLjMsMzIuMXogTTcyLjgsMjQuNmw1LjUtNWgtMS4ybC02LjcsNi4xdi02LjFoLTIuOHYxNS41IGwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUw3Mi44LDI0LjZ6IE01Ni4yLDEzbC05LjgsMjIuMWgxbDIuOC02LjNoMTBsMi44LDYuM2gzTDU2LjIsMTN6IE01MC43LDI3LjlsNC42LTEwLjNsNC41LDEwLjMgSDUwLjd6IE0xMTQuNSwzNC4ybDUtMTIuM2MwLjEtMC4yLDAuMy0wLjQsMC41LDBjMS42LDQsMy4zLDguMyw0LjksMTIuM0gxMTQuNXogTTExMi4xLDMzLjljMCwwLjUsMC4xLDAuOCwwLjEsMWMwLDAuNiwwLDEtMC4xLDEuMiBoMC4yYzAuMy0wLjMsMC42LTAuNSwxLjEtMC43YzAuNC0wLjEsMC45LTAuMiwxLjUtMC4zYzAuNiwwLDEuNCwwLDIuNSwwaDUuOGMxLjEsMCwyLjYsMCwzLjIsMGMwLjUsMCwxLDAuMSwxLjQsMC4zIGMwLjQsMC4xLDAuNywwLjQsMC45LDAuN2gwLjJjMC0wLjMtMC4xLTAuNy0wLjEtMS4yYzAtMC40LDAtMC43LDAuMS0xaC0xbC01LjUtMTMuMWMtMC4xLTAuMy0wLjMtMC42LTAuNS0wLjggCWMtMC4yLTAuMi0wLjQtMC40LTAuNi0wLjVjLTAuNS0wLjItMC45LTAuMi0xLjQsMGMtMC4yLDAuMS0wLjMsMC4yLTAuNSwwLjRjLTAuMiwwLjItMC4zLDAuNC0wLjUsMC42bC01LjgsMTMuM0gxMTIuMXoiLz4NCjxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik01LjQsMzcuMWwxNi43LTIzbDE2LjcsMjNjLTQuMSw0LjctMTAsNy43LTE2LjcsNy43QzE1LjQsNDQuOCw5LjQsNDEuOCw1LjQsMzcuMSBNMTcyLDE5LjZoLTIuOHY2LjRoLTguMXYtNi40IGgtMi44djE1LjVoMi44di04LjJoOC4xdjguMmgyLjhWMTkuNnogTTE1Mi4xLDIxTDE1Mi4xLDIxYy0wLjItMC40LTAuNC0wLjctMC42LTAuOWMtMC4yLTAuMi0wLjUtMC40LTAuNy0wLjVjLTAuNC0wLjEtMC43LTAuMS0xLjEsMGMtMC4yLDAuMS0wLjQsMC4yLTAuNiwwLjRjLTAuNCwwLjQtMC42LDAuOS0wLjgsMS41bC00LjUsMTMuNmgxLjFsMS4yLTMuN2g2LjhsMS4yLDMuN2gyLjdMMTUyLjEsMjF6ICBNMTQ2LjQsMzAuNGMxLTMsMi02LDMtOWMwLTAuMSwwLjItMC4zLDAuMywwbDIuOCw5SDE0Ni40eiBNMTMxLDIxLjdjMC4xLTAuNSwwLjItMC45LDAuNS0xLjNjMC4zLTAuNSwwLjgtMC43LDEuNC0wLjhsNy44LDB2MC45IGMtMi4yLDAtNC40LDAtNi42LDBjLTAuMiwwLTAuMywwLjEtMC4zLDAuNGwwLDUuNmMwLjIsMCwwLjYsMCwxLjIsMGMwLjUsMCwwLjksMCwxLjIsMGMyLDAsMy41LDAuMiw0LjUsMC43IGMxLjUsMC43LDIuMiwxLjksMi4yLDMuN2MwLDEuMy0wLjUsMi40LTEuNiwzLjJjLTEsMC43LTIuMSwxLjEtMy41LDEuMUgxMzFWMjEuOEMxMzEsMjEuOCwxMzEsMjEuNywxMzEsMjEuN0wxMzEsMjEuNyBNMTM2LjksMjcuNSBjMSwwLDEuOSwwLjMsMi42LDAuOWMwLjcsMC42LDEuMSwxLjQsMS4xLDIuNGMwLDEtMC40LDEuOC0xLjEsMi40Yy0wLjcsMC42LTEuNiwwLjktMi42LDAuOWgtM3YtNi42SDEzNi45eiBNMTc5LjcsMjQuNmw1LjUtNSBsLTEuMiwwbC02LjcsNnYtNi4xaC0yLjh2MTUuNWwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUwxNzkuNywyNC42eiIvPg0KPC9zdmc+">
</div>
<%--<h5 class="text">Created by Nazar Mykhailechko</h5>
<br>--%>
<br>
<h1 class="text">Опитування!!!</h1>

<%--<% String homeDirectory = System.getProperty("user.name"); %>--%>
<%--<h3 class="text"><%=homeDirectory%></h3>--%>

<h5 class="text">Опитування відділень, щодо якості сервісу по напрямку адміністративно-господарської діяльності,</h5>
<h5 class="text">що надається регіональній мережі Головним банком:</h5>

<%--    <form:form action="save" method="POST" modelAttribute="voting" onsubmit="alert('Дякуємо! Ваш голос зараховано'); false">--%>
    <form:form action="save" method="POST" modelAttribute="voting" id="myform">
        <h4>Виберіть номер вашого відділення:</h4>

        <form:select id="sel" name="sel" path="division" class="js-select">
            <form:option value=""></form:option>
            <form:option value="базове управління продажів (311)">базове управління продажів (311)</form:option>
            <form:option value="1">1</form:option>
            <form:option value="2">2</form:option>
            <form:option value="3">3</form:option>
            <form:option value="4">4</form:option>
            <form:option value="5">5</form:option>
            <form:option value="6">6</form:option>
            <form:option value="7">7</form:option>
            <form:option value="8">8</form:option>
            <form:option value="9">9</form:option>
            <form:option value="10">10</form:option>
            <form:option value="11">11</form:option>
            <form:option value="12">12</form:option>
            <form:option value="13">13</form:option>
            <form:option value="14">14</form:option>
            <form:option value="15">15</form:option>
            <form:option value="16">16</form:option>
            <form:option value="17">17</form:option>
            <form:option value="18">18</form:option>
            <form:option value="19">19</form:option>
            <form:option value="20">20</form:option>
            <form:option value="21">21</form:option>
            <form:option value="22">22</form:option>
            <form:option value="23">23</form:option>
            <form:option value="24">24</form:option>
            <form:option value="25">25</form:option>
            <form:option value="26">26</form:option>
            <form:option value="27">27</form:option>
            <form:option value="28">28</form:option>
            <form:option value="29">29</form:option>
            <form:option value="30">30</form:option>
            <form:option value="31">31</form:option>
            <form:option value="32">32</form:option>
            <form:option value="33">33</form:option>
            <form:option value="34">34</form:option>
            <form:option value="35">35</form:option>
            <form:option value="36">36</form:option>
            <form:option value="37">37</form:option>
            <form:option value="38">38</form:option>
            <form:option value="39">39</form:option>
            <form:option value="40">40</form:option>
            <form:option value="41">41</form:option>
            <form:option value="42">42</form:option>
            <form:option value="43">43</form:option>
            <form:option value="44">44</form:option>
            <form:option value="45">45</form:option>
            <form:option value="46">46</form:option>
            <form:option value="47">47</form:option>
            <form:option value="48">48</form:option>
            <form:option value="49">49</form:option>
            <form:option value="50">50</form:option>
            <form:option value="51">51</form:option>
            <form:option value="52">52</form:option>
            <form:option value="53">53</form:option>
            <form:option value="54">54</form:option>
            <form:option value="55">55</form:option>
            <form:option value="56">56</form:option>
            <form:option value="57">57</form:option>
            <form:option value="58">58</form:option>
            <form:option value="59">59</form:option>
            <form:option value="60">60</form:option>
            <form:option value="61">61</form:option>
            <form:option value="62">62</form:option>
            <form:option value="63">63</form:option>
            <form:option value="64">64</form:option>
            <form:option value="65">65</form:option>
            <form:option value="66">66</form:option>
            <form:option value="67">67</form:option>
            <form:option value="68">68</form:option>
            <form:option value="69">69</form:option>
            <form:option value="70">70</form:option>
            <form:option value="71">71</form:option>
            <form:option value="72">72</form:option>
            <form:option value="73">73</form:option>
            <form:option value="74">74</form:option>
            <form:option value="75">75</form:option>
            <form:option value="76">76</form:option>
            <form:option value="77">77</form:option>
            <form:option value="78">78</form:option>
            <form:option value="79">79</form:option>
            <form:option value="80">80</form:option>
            <form:option value="81">81</form:option>
        </form:select>

    <h4>Питання 1: Чи задоволені Ви поточною якістю матеріально-технічного забезпечення відділення (господарські питання, техніка (крім ІТ)?</h4>

        <form:select id="sel1" name="sel" path="question1" class="js-select">
        <form:option value=""></form:option>
        <form:option value="в цілому задоволений">в цілому задоволений</form:option>
        <form:option value="потребує суттєвого покращення">потребує суттєвого покращення</form:option>
        <form:option value="дуже погано(неприйнятно)">дуже погано(неприйнятно)</form:option>
    </form:select>

        <h4>Питання 2: Які основні проблемні зони в забезпеченні? (Можна обрати більше одного варіанту)</h4>

        <form:select id="sel2" name="sel" path="question2" class="js-select2" multiple="multiple">
<%--            <form:option value="NONE">Оберіть відповідь</form:option>--%>
            <form:option value="поточні ремонти">поточні ремонти</form:option>
            <form:option value="кондиціонування/опалення">кондиціонування/опалення</form:option>
            <form:option value="побутова техніка">побутова техніка</form:option>
            <form:option value="касова техніка">касова техніка</form:option>
            <form:option value="забезпечення папером; касовими матеріалами">забезпечення папером; касовими матеріалами</form:option>
            <form:option value="клінінг(прибирання)">клінінг(прибирання)</form:option>
            <form:option value="меблі">меблі</form:option>
            <form:option value="освітлення; заміна ламп">освітлення, заміна ламп</form:option>
            <form:option value="сантехніка; вода">сантехніка; вода</form:option>
            <form:option value="перебої з електроенергією">перебої з електроенергією</form:option>
            <form:option value="обмін з документами з ГБ(Текс; Нова пошта)">обмін з документами з ГБ(Текс; Нова пошта)</form:option>
        </form:select>


        <h4>Питання 3: Яка поточна якість реакції на Ваші заявки по забезпеченню?</h4>
        <form:select id="sel3" name="sel" path="question3" class="js-select">
            <form:option value=""></form:option>
            <form:option value="реагують швидко і результат в прийнятні терміни, якісно">реагують швидко і результат в прийнятні терміни, якісно</form:option>
            <form:option value="реагують швидко, але реалізація довга або її не має">реагують швидко, але реалізація довга або її не має</form:option>
            <form:option value="реагують довго і реалізація довга або її не має">реагують довго і реалізація довга або її не має</form:option>
        </form:select>

        <h4>Питання 4: Чи задоволені ви системою заявок ServiceDesk?</h4>
        <form:select id="sel4" name="sel" path="question4" class="js-select">
<%--            <form:option value="NONE">Оберіть відповідь</form:option>--%>
            <form:option value=""></form:option>
            <form:option value="не знаю що це">не знаю що це</form:option>
            <form:option value="вирішую проблеми прямим зверненням так надійніше">вирішую проблеми прямим зверненням так надійніше</form:option>
            <form:option value="формую заявки в ServiceDesk, але потрібен додатковий дзвінок">формую заявки в ServiceDesk, але потрібен додатковий дзвінок</form:option>
            <form:option value="формую заявки в ServiceDesk і цього достатньо для результату">формую заявки в ServiceDesk і цього достатньо для результату</form:option>
        </form:select>

        <%--     <h4><div id="divId"></div></h4>--%>
        <br>
        <br>
    <input type="submit" value="Проголосувати">
    </form:form>


</body>

<script language="javascript">


    function JSGetSelectedItem() {
        let dropdownIndex = document.getElementById('sel').selectedIndex;
        let dropdownValue = document.getElementById('sel')[dropdownIndex].text;
        /*alert("Hello JSCript " + dropdownValue);*/
        if (dropdownValue === 'Так'){
            document.getElementById("divId").innerHTML= dropdownValue + "<h3>Питання 2: Якщо відповідь «Так», то надайти свої дані:</h3><p><label for='firstname'>ПІБ (повна назва): </label><input name='pib'  type='text' required/></p><p><label for='date'>Дата народження: </label><input name='birth' type='date' value='2000-01-01' required/></p>"
        }else{
            document.getElementById("divId").innerHTML=""
        }
    }


    function JSGetSelectedItem1() {

        let dropdownIndex = document.getElementById('sel1').selectedIndex;
        let dropdownValue = document.getElementById('sel1')[dropdownIndex].text;
if (dropdownValue === 'Оберіть відповідь'){

}

        alert(dropdownValue);

    }

    function validateSelects()
    {
        let m = false;

        if ( $('#sel').val() !== '' && $('#sel1').val() !== '' && $('#sel2').val().length !== 0 && $('#sel3').val() !== '' && $('#sel4').val() !== ''){  m=true; }
        else{
        alert("Ви не дали відповідь на всі запитання!");
        return false
    }
        alert("Дякуємо! Ваш голос зараховано!");
        return(m);
    }
    // For the functionality.
    $('#myform').on('submit',function()
    {
        return validateSelects();
    });


    $(".js-select2").select2({
        closeOnSelect : false,
        placeholder : "Оберіть відповідь",
        // allowHtml: true,
        allowClear: true,
        multiple: true
        // tags: true // создает новые опции на лету
    })

    $(".js-select").select2({
        placeholder: "Оберіть відповідь",
        allowClear: true
        // tags: true // создает новые опции на лету
    })
</script>

</html>