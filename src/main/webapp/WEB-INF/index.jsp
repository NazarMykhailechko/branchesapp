<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>

    <title>Структурні підрозділи</title>

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
            font-size: x-small;

        }
        th {
            background:  crimson;
            color: white;
        }
        td,th{
            border: 1px solid gray;
            text-align: left;
            padding: 5px 10px;
        }
        .text {
            text-align: center;
        }
        h1,h2,h3{
            color: red;
        }

        .center-justified {
            text-align: justify;
            margin: 0 auto;
            width: 60em;
            font-size: small;
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

        .ok{
            background:  green;
        }

        .right{
            background:  black;
        }

        .minus{
            background:  red;
        }

        .plus{
            background:  green;
        }


    </style>
</head>
<body>

<div class="text">
    <img class="text" src="data:image/svg+xml;base64,PHN2ZyBpZD0ibC11LWciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMTg3LjdweCIgaGVpZ2h0PSI0NC44cHgiIHZpZXdCb3g9IjAgMCAxODcuNyA0NC44IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxODcuNyA0NC44OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPg0KCS5zdDB7ZmlsbC1ydWxlOmV2ZW5vZGQ7Y2xpcC1ydWxlOmV2ZW5vZGQ7ZmlsbDojQ0MwMDAwO30NCgkuc3Qxe2ZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO2ZpbGw6Izk5OTk5OTt9DQo8L3N0eWxlPg0KPHBhdGggY2xhc3M9InN0MCIgZD0iTTQzLjYsMjcuNUwyMi4xLDlMMC42LDI3LjVDMC4yLDI1LjgsMCwyNC4yLDAsMjIuNEMwLDEwLDkuOSwwLDIyLjEsMGMxMi4yLDAsMjIuMSwxMCwyMi4xLDIyLjQgQzQ0LjIsMjQuMiw0NCwyNS44LDQzLjYsMjcuNSBNMTAxLDM1LjFjMy41LDAsNS4yLTAuMiw2LjQtMC41YzIuNC0wLjcsNC0yLjMsNC44LTQuOGMwLjMtMC44LDAuNC0xLjUsMC40LTIuMiBjMC0yLjMtMC45LTQuNC0yLjYtNS45Yy0xLjYtMS40LTMuNi0yLTYtMmgtNC4xYy0wLjUsMC4xLTEsMC4zLTEuMiwwLjdjLTAuMiwwLjQtMC40LDAuOC0wLjUsMS4zdjE5LjZoMi44VjM1LjEgTTEwOC4yLDIyLjggYzAuOCwxLjMsMS4zLDMuMSwxLjMsNC45YzAsMS43LTAuNCwzLjEtMS4zLDQuNGMtMSwxLjQtMi4zLDIuMS0zLjksMi4xbC0zLjMsMFYyMS4xYzAtMC4zLDAuMi0wLjUsMC41LTAuNWwyLjcsMCBDMTA1LjksMjAuNSwxMDcuMywyMS4zLDEwOC4yLDIyLjh6IE04OC4yLDM1LjVjMi4zLDAsNC4yLTAuNyw1LjctMi4yYzEuNS0xLjUsMi4zLTMuNCwyLjMtNS44YzAtMi4zLTAuOC00LjItMi4zLTUuNiBjLTEuNS0xLjUtMy40LTIuMi01LjYtMi4yYy0yLjMsMC00LjIsMC43LTUuNiwyLjJjLTEuNSwxLjUtMi4yLDMuNC0yLjIsNS43YzAsMi4zLDAuNyw0LjIsMi4zLDUuN0M4NC4xLDM0LjgsODYsMzUuNSw4OC4yLDM1LjUgTTkyLjMsMzIuMWMtMSwxLjctMi4zLDIuNi00LDIuNmMtMS43LDAtMy0wLjgtNC0yLjNDODMuNSwzMSw4MywyOS40LDgzLDI3LjZjMC0xLjksMC40LTMuNSwxLjItNC45YzEtMS42LDIuMy0yLjQsNC0yLjQgYzEuNiwwLDIuOSwwLjcsMy45LDIuMmMwLjksMS4zLDEuMywyLjksMS4zLDQuNkM5My41LDI5LjEsOTMuMSwzMC43LDkyLjMsMzIuMXogTTcyLjgsMjQuNmw1LjUtNWgtMS4ybC02LjcsNi4xdi02LjFoLTIuOHYxNS41IGwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUw3Mi44LDI0LjZ6IE01Ni4yLDEzbC05LjgsMjIuMWgxbDIuOC02LjNoMTBsMi44LDYuM2gzTDU2LjIsMTN6IE01MC43LDI3LjlsNC42LTEwLjNsNC41LDEwLjMgSDUwLjd6IE0xMTQuNSwzNC4ybDUtMTIuM2MwLjEtMC4yLDAuMy0wLjQsMC41LDBjMS42LDQsMy4zLDguMyw0LjksMTIuM0gxMTQuNXogTTExMi4xLDMzLjljMCwwLjUsMC4xLDAuOCwwLjEsMWMwLDAuNiwwLDEtMC4xLDEuMiBoMC4yYzAuMy0wLjMsMC42LTAuNSwxLjEtMC43YzAuNC0wLjEsMC45LTAuMiwxLjUtMC4zYzAuNiwwLDEuNCwwLDIuNSwwaDUuOGMxLjEsMCwyLjYsMCwzLjIsMGMwLjUsMCwxLDAuMSwxLjQsMC4zIGMwLjQsMC4xLDAuNywwLjQsMC45LDAuN2gwLjJjMC0wLjMtMC4xLTAuNy0wLjEtMS4yYzAtMC40LDAtMC43LDAuMS0xaC0xbC01LjUtMTMuMWMtMC4xLTAuMy0wLjMtMC42LTAuNS0wLjggCWMtMC4yLTAuMi0wLjQtMC40LTAuNi0wLjVjLTAuNS0wLjItMC45LTAuMi0xLjQsMGMtMC4yLDAuMS0wLjMsMC4yLTAuNSwwLjRjLTAuMiwwLjItMC4zLDAuNC0wLjUsMC42bC01LjgsMTMuM0gxMTIuMXoiLz4NCjxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik01LjQsMzcuMWwxNi43LTIzbDE2LjcsMjNjLTQuMSw0LjctMTAsNy43LTE2LjcsNy43QzE1LjQsNDQuOCw5LjQsNDEuOCw1LjQsMzcuMSBNMTcyLDE5LjZoLTIuOHY2LjRoLTguMXYtNi40IGgtMi44djE1LjVoMi44di04LjJoOC4xdjguMmgyLjhWMTkuNnogTTE1Mi4xLDIxTDE1Mi4xLDIxYy0wLjItMC40LTAuNC0wLjctMC42LTAuOWMtMC4yLTAuMi0wLjUtMC40LTAuNy0wLjVjLTAuNC0wLjEtMC43LTAuMS0xLjEsMGMtMC4yLDAuMS0wLjQsMC4yLTAuNiwwLjRjLTAuNCwwLjQtMC42LDAuOS0wLjgsMS41bC00LjUsMTMuNmgxLjFsMS4yLTMuN2g2LjhsMS4yLDMuN2gyLjdMMTUyLjEsMjF6ICBNMTQ2LjQsMzAuNGMxLTMsMi02LDMtOWMwLTAuMSwwLjItMC4zLDAuMywwbDIuOCw5SDE0Ni40eiBNMTMxLDIxLjdjMC4xLTAuNSwwLjItMC45LDAuNS0xLjNjMC4zLTAuNSwwLjgtMC43LDEuNC0wLjhsNy44LDB2MC45IGMtMi4yLDAtNC40LDAtNi42LDBjLTAuMiwwLTAuMywwLjEtMC4zLDAuNGwwLDUuNmMwLjIsMCwwLjYsMCwxLjIsMGMwLjUsMCwwLjksMCwxLjIsMGMyLDAsMy41LDAuMiw0LjUsMC43IGMxLjUsMC43LDIuMiwxLjksMi4yLDMuN2MwLDEuMy0wLjUsMi40LTEuNiwzLjJjLTEsMC43LTIuMSwxLjEtMy41LDEuMUgxMzFWMjEuOEMxMzEsMjEuOCwxMzEsMjEuNywxMzEsMjEuN0wxMzEsMjEuNyBNMTM2LjksMjcuNSBjMSwwLDEuOSwwLjMsMi42LDAuOWMwLjcsMC42LDEuMSwxLjQsMS4xLDIuNGMwLDEtMC40LDEuOC0xLjEsMi40Yy0wLjcsMC42LTEuNiwwLjktMi42LDAuOWgtM3YtNi42SDEzNi45eiBNMTc5LjcsMjQuNmw1LjUtNSBsLTEuMiwwbC02LjcsNnYtNi4xaC0yLjh2MTUuNWwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUwxNzkuNywyNC42eiIvPg0KPC9zdmc+">
</div>
<%--<h5 class="text">Created by Nazar Mykhailechko</h5>
<br>--%>
<h3 class="text">Динаміка структурних підрозділів банків України</h3>

<button onclick="incr()">green>></button>
<button  onclick="decr()">black>></button>
<c:if test="${!empty listOfVotes}">
    <table id="branches" class="tg">
        <tr>
            <th width="20">GLB</th>
            <th width="200">Назва банку</th>
            <th width="50">Приріст</th>
            <c:forEach items="${listOfFields}" var="fieldsList">
                <th width="60">${fieldsList}</th>
            </c:forEach>
        </tr>
        <c:forEach items="${listOfVotes}" var="objectList">
            <tr>
            <c:forEach items="${objectList}" var="object">
                    <td>${object}</td>
            </c:forEach>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>

<script language="javascript">

            let incr = (function () {
                let i = 3;

                return function () {

                    if(i < document.getElementById('branches').rows[0].cells.length){
                        //console.log(document.getElementById('branches').rows[0].cells[i].innerHTML)

                        document.getElementById('branches').rows[0].cells[i].classList.add("ok");
                        document.getElementById('branches').rows[0].cells[i-1].classList.remove("ok");

                        for (let z = 1; z < document.getElementById("branches").rows.length; z++) {
                            document.getElementById('branches').rows[z].cells[2].classList.remove("minus");
                            document.getElementById('branches').rows[z].cells[2].classList.remove("plus");

                            document.getElementById('branches').rows[z].cells[2].innerHTML =
                                document.getElementById('branches').rows[z].cells[document.getElementsByClassName("ok")[0].cellIndex].innerHTML - document.getElementById('branches').rows[z].cells[document.getElementsByClassName("right")[0].cellIndex].innerHTML;

                            if(document.getElementById('branches').rows[z].cells[2].innerHTML < 0){
                                document.getElementById('branches').rows[z].cells[2].classList.add("minus");
                            }
                            if(document.getElementById('branches').rows[z].cells[2].innerHTML > 0){
                                document.getElementById('branches').rows[z].cells[2].classList.add("plus");
                            }
                        }

                        i++;
                        return i;
                    }else{
                        document.getElementById('branches').rows[0].cells[i-1].classList.remove("ok");
                            i = 3;
                        }
               }
            })();

            let decr = (function () {
                let i = 3;

                return function () {

                    if(i < document.getElementById('branches').rows[0].cells.length){
                        //console.log(document.getElementById('branches').rows[0].cells[i].innerHTML)
                        //console.log(i)
                        document.getElementById('branches').rows[0].cells[i].classList.add("right");
                        document.getElementById('branches').rows[0].cells[i-1].classList.remove("right");

                        for (let z = 1; z < document.getElementById("branches").rows.length; z++) {
                            document.getElementById('branches').rows[z].cells[2].classList.remove("minus");
                            document.getElementById('branches').rows[z].cells[2].classList.remove("plus");

                            document.getElementById('branches').rows[z].cells[2].innerHTML =
                                document.getElementById('branches').rows[z].cells[document.getElementsByClassName("ok")[0].cellIndex].innerHTML - document.getElementById('branches').rows[z].cells[document.getElementsByClassName("right")[0].cellIndex].innerHTML;

                            if(document.getElementById('branches').rows[z].cells[2].innerHTML < 0){
                                document.getElementById('branches').rows[z].cells[2].classList.add("minus");
                            }
                            if(document.getElementById('branches').rows[z].cells[2].innerHTML > 0){
                                document.getElementById('branches').rows[z].cells[2].classList.add("plus");
                            }

                        }

                        i++;
                        return i;
                    }else{
                        document.getElementById('branches').rows[0].cells[i-1].classList.remove("right");
                        i = 3;
                    }
                }
            })();

    function tabledata() {
        console.log(document.getElementById('branches').rows[0].cells.length)
        let table = document.getElementById("branches");
        let totalRowCount = table.rows.length; // 5
        let tbodyRowCount = table.tBodies[0].rows.length; // 3
        console.log(totalRowCount)
        console.log(tbodyRowCount)
        console.log(document.getElementById('branches').rows[4].cells[0].innerHTML)
        console.log(document.getElementById('branches').rows[4].cells[1].innerHTML)
        console.log(document.getElementById('branches').rows[4].cells[2].innerHTML)
        console.log(document.getElementById('branches').rows[4].cells[3].innerHTML)
        console.log(document.getElementById('branches').rows[4].cells[4].innerHTML)
        console.log(document.getElementById('branches').rows[4].cells[2].innerHTML - document.getElementById('branches').rows[4].cells[3].innerHTML)
    }

    //tabledata()

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
        alert("Ви не заповнили всі поля!");
        return false
    }
        alert("Дякуємо! Вашу пропозицію прийнято і буде обов'язково розглянуто!");
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