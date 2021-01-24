function GetUIAccess() {
    var inputvoterid = $('#idVoterid').val();


    sessionStorage.setItem('UserIdadminpage', inputvoterid);
    $.ajax
        ({
            type: 'POST',
            url: "../handlers/LoginHandler.ashx",
            data: {
                'CallName': 'GetUIAccess',
                'voterid': inputvoterid
            },
            datatype: "json",
            success: function (response) {
                res = JSON.parse(response);
                if (res == "User") {
                    window.location.href = 'AdminPartiesInfo';
                }
                
            }


        })
}


function GetUserdetailsinAdminPanel() {
  
    $.ajax({
        type: "POST",
        url: "../handlers/UserHandler.ashx",
        data: {
            'CallName': 'GetUserVoterInfo',
            'userid': sessionStorage.getItem('UserIdadminpage')
        },
        datatype: 'json',
        success: function (response) {
            Candidatedetails = [];
            if (response != "[]") {
                var responedet = $.parseJSON(response)
                var arrdet = responedet;
                if (arrdet != null && arrdet != undefined && arrdet.length != 0) {
                    $.each(arrdet, function (i, item) {
                        var arraydetails =
                        {
                            partyname: item.strPartyName,
                            participatingcandidate: item.strPPersonName,
                            

                        }
                        Candidatedetails.push(arraydetails);

                    });

                }

            }
            $.each(Candidatedetails, function (i, item) {
                $('#carddeck').append("<div class= 'card'><div class='card-image'><img class='card-img-top' src='../images/" + item.partyname + ".jpg' ><div class='card-text'><h5 id='idpartyname" + i + "'>" + item.partyname + "</h5><p id='idpersoname" + i + "'>" + item.participatingcandidate + "</p></div><div class='card-stats'><input class='btn btn-primary'style='margin-left:71px;' type='button' id='idvote" + i + "' onclick='vote(" + i + "); return false'  Value='Vote'></div></div></div>");
                

            });
        }
    });

}

function CastuservoteInAdminScrn(id) {
    var num = id;
    var candidatename = $('#idpersoname' + num).text();
    var partyname = $('#idpartyname' + num).text();
    
    $.ajax({
        type: "POST",
        url: "../handlers/UserHandler.ashx",
        data: {
            'CallName': 'CastUserVote',
            'votersid': sessionStorage.getItem('UserIdadminpage'),
            'PPersonName': candidatename,
            'Party': partyname
        },
        datatype: 'json',
        success: function (response) {
            response = $.parseJSON(response)
            if (response == "You vote casted successfully") {
                var msg = "Your Vote  has been casted for the above party"
                // need to change the id name in aspx of admin
                $('#idsucessmodalbody').append('<div><img src="../images/' + partyname + '.jpg"><p>' + candidatename + '</p><h5>' + msg + '</h5></div>');
                $('#idSuccessmodal').modal('show');
                setTimeout(function () { $('#idSuccessmodal').modal('hide') }, 2000);
                
            }
            else {

            }

        }
    })


}

function AddParticiptingCandidates() {
    var rowcount = $('#tbladdcandidates td').closest('tr').length;
    if (rowcount == 0) {
        var colHeader = [];
        var hearder = '';
        var CandidateName = '<th width="80px" style="font-size:14px">CandidateName</th>';
        var PartyName = '<th width="80px" style="font-size:14px">PartyName</th>';
        var Participatingfrom = '<th width="80px" style="font-size:14px">Participatingfrom</th>';
        var State = '<th width="80px" style="font-size:14px">State</th>';
        var District = '<th width="80px" style="font-size:14px">District</th>';
        var City = '<th width="80px" style="font-size:14px">City</th>';
        var Country = '<th width="80px" style="font-size:14px">Country</th>';
        var Role = '<th width="80px" style="font-size:14px">Role</th>';
        var Action = '<th width="80px" style="font-size:14px">Action</th>';
        hearder = '<thead><tr>' + CandidateName + PartyName + Participatingfrom + State + District + City + Country + Role + Action + '</tr></thead>';
        var i = 0;
        var rowCandidateName = '<td><input type="text" class="roundborder"id="idcandidatename' + i + '"/></td>';
        var rowPartyName = '<td><input type="text" class="roundborder"id="idpartyname' + i + '"/></td>';
        var rowParticipatingfrom = '<td><input type="text" class="roundborder"id="idparticipatingfrom' + i + '"/></td>';
        var rowState = '<td><input type="text" class="roundborder"id="idstate' + i + '"/></td>';
        var rowDistrict = '<td><input type="text" class="roundborder"id="iddistrict' + i + '"/></td>';
        var rowCity = '<td><input type="text" class="roundborder"id="idcity' + i + '"/></td>';
        var rowCountry = '<td><input type="text" class="roundborder"id="idcountry' + i + '"/></td>';
        var rowRole = '<td><input type="text" class="roundborder"id="idRole' + i + '"/></td>';
        var rowAction = '<td><input type="Submit"  value="Submit" onclick="insertRecords(' + i + ')"class="roundborder"id="idsubmit' + i + '"/></td>';
        header += '<tr>' + rowCandidateName + rowPartyName + rowParticipatingfrom + rowState + rowDistrict + rowCity + rowCountry + rowRole + rowAction + '</tr>';
        
        header += '</tbody>';
        $('#tbladdcandidates').html("");
        $('#tbladdcandidates').append(hearder);
    }
    else {
        colHeader = $('#tbladdcandidates').find('tr')[0].cells.length;
        var rowCandidateName = '<td><input type="text" class="roundborder"id="idcandidatename' + i + '"/></td>';
        var rowPartyName = '<td><input type="text" class="roundborder"id="idpartyname' + i + '"/></td>';
        var rowParticipatingfrom = '<td><input type="text" class="roundborder"id="idparticipatingfrom' + i + '"/></td>';
        var rowState = '<td><input type="text" class="roundborder"id="idstate' + i + '"/></td>';
        var rowDistrict = '<td><input type="text" class="roundborder"id="iddistrict' + i + '"/></td>';
        var rowCity = '<td><input type="text" class="roundborder"id="idcity' + i + '"/></td>';
        var rowCountry = '<td><input type="text" class="roundborder"id="idcountry' + i + '"/></td>';
        var rowRole = '<td><input type="text" class="roundborder"id="idRole' + i + '"/></td>';
        var rowAction = '<td><input type="Submit"  value="Submit" onclick="insertRecords(' + i + ')"class="roundborder"id="idsubmit' + i + '"/></td>';
        header += '<tr>' + rowCandidateName + rowPartyName + rowParticipatingfrom + rowState + rowDistrict + rowCity + rowCountry + rowRole + rowAction + '</tr>';
        $('#tbladdcandidates >tbody>tr:first').before(hearder);


    }

}

function insertRecords(id) {
    var num = id;
    var candidatename = $('#idcandidatename' + num).val();
    var partyname = $('#idpartyname' + num).val();
    var participatingfrom = $('#idparticipatingfrom' + num).val();
    var state = $('#idstate' + num).val();
    var district = $('#iddistrict' + num).val();
    var city = $('#idcity' + num).val();

    var country = $('#idcountry' + num).val();
    var role = $('#idRole' + num).val();
    $.ajax({
        type: "POST",
        url: "../handlers/AdminHandler.ashx",
        data: {
            'CallName': 'UploadParticipantData',

            'PPersonName': candidatename,
            'Party': partyname,
            'locationfrom': participatingfrom,
            'state': state,
            'district': district,
            'city': city,
            'country': country,
            'Role': role

        },
        datatype: 'json',
        success: function (response) {
            response = $.parseJSON(response)
            if (response == "1") {
                ///write logic
            }

        }
    })

}
function Getcandidatedetails() {
    var colHeader = [];
    var header = '';
    var CandidateName = '<th width="80px" style="font-size:14px">CandidateName</th>';
    var PartyName = '<th width="80px" style="font-size:14px">PartyName</th>';
    var Participatingfrom = '<th width="80px" style="font-size:14px">Participatingfrom</th>';
    var State = '<th width="80px" style="font-size:14px">State</th>';
    var District = '<th width="80px" style="font-size:14px">District</th>';
    var City = '<th width="80px" style="font-size:14px">City</th>';
    var Country = '<th width="80px" style="font-size:14px">Country</th>';
    var Role = '<th width="80px" style="font-size:14px">Role</th>';
    var Action = '<th width="80px" style="font-size:14px">Action</th>';
    header = '<thead><tr>' + CandidateName + PartyName + Participatingfrom + State + District + City + Country + Role + Action + '</tr></thead>';

    $.ajax({
        type: "POST",
        url: "../handlers/AdminHandler.ashx",
        data: {
            'CallName': 'GetCandidatesData',


        },
        datatype: 'json',
        success: function (response) {
            candidateDetails = [];
            if (response != "[]") {
                var responsedet = $.parseJSON(response);
                if (responsedet != null && responsedet != undefined && responsedet.length != 0) {
                    $.each(responsedet, function (i, item) {
                        var arraydetails = {
                            candidatename: item.strPPersonName,
                            partname: item.strPartyName,
                            partcipatfrom: item.strParticipatingFrom,
                            state: item.strState,
                            district: item.strDistrict,
                            city: item.strCity,
                            country: item.strCountry,
                            role: item.strRole

                        };
                        candidateDetails.push(arraydetails);


                    });
                    $.each(candidateDetails, function (index, value) {




                        var row = $("<tr id='row" + index + "' ><td><span id='idcandidatename" + (index) + "'>" + value.candidatename
                            + "</span></td><td><span id='idpartyname" + (index) + "'>" +
                            value.partname
                            + "</span></td><td id='idparticipatingfrom" + (index) + "'>" + value.partcipatfrom

                            + "</td><td><input type='text' class='roundedBorder'  id='idstate" + (index) + "'value='"
                            + value.state + "'/>"

                            + "</td><td id='iddistrict" + (index) + "'>" + value.district
                            + "</td><td id='idcity" + (index) + "'>" + value.city
                            + "</td><td id='idcountry" + (index) + "'>" + value.country
                            + "</td><td id='idRole" + (index) + "'>" + value.role


                            + "</td><td><input value='Update' id='idsubmit" + index + "' type='submit'   class='btn-sm roundedBorder' style='background-color: #4CAF50;color: white;' onclick= 'UpdateRecord(" + index + "); return false' ></td></tr> ");

                        header += '<tr>' + row[0].innerHTML + '</tr>';

                    })

                    $('#tbladdcandidates').append(header);


                }

            }


        }
    });

}

function insertRecords(id) {
    var num = id;
    var candidatename = $('#idcandidatename' + num).val();
    var partyname = $('#idpartyname' + num).val();
    var participatingfrom = $('#idparticipatingfrom' + num).val();
    var state = $('#idstate' + num).val();
    var district = $('#iddistrict' + num).val();
    var city = $('#idcity' + num).val();

    var country = $('#idcountry' + num).val();
    var role = $('#idRole' + num).val();
    $.ajax({
        type: "POST",
        url: "../handlers/AdminHandler.ashx",
        data: {
            'CallName': 'UploadParticipantData',

            'PPersonName': candidatename,
            'Party': partyname,
            'locationfrom': participatingfrom,
            'state': state,
            'district': district,
            'city': city,
            'country': country,
            'Role': role

        },
        datatype: 'json',
        success: function (response) {
            response = $.parseJSON(response)
            if (response == "1") {
                ///write logic
            }

        }
    })

}


//result view .js

//chart.js
function StatewiseViseResult() {

    $.ajax({
        type: "POST",
        url: "../handlers/AdminHandler.ashx",
        data: {
            'CallName': 'GetElectionDataChartViewByStatewise',
           
        },
        datatyepe: 'json',
        success: function (response) {
            var responsedet = $.parseJSON(response)
            var arrdet = responsedet;
            statearray = [];
            statearraydata = [];
            // generate the cards based on count 
            generatecards(response);
            if (arrdet != null && arrdet != undefined && arrdet.length != 0) {
                $.each(arrdet, function (i, item) {
                    var arraydetails =
                    {
                        statename: item.strState
                     
                    }
                    statearray.push(arraydetails);
                    
                    statearraydata.push(item.strjson);

                });

            }
            // to display the state name on each card.
            $.each(statearray, function (i, value) {
                $('#headertext' + i).append("<h5 id='idstatename" + i + "'>" + value.statename + "</h5>");
            });
            // generates the graph data using the json array
            generatechart(statearraydata);
        }

    });
}

//select each state  card based on the length of json object
//<a href="#" onclick="onclickdistrictdata('+i+')" ></a>
function generatecards(response) {

    for (var i = 0; i < $.parseJSON(response).length; i++) {
        $('#generatecards').append('<div class="col-lg-4"><div class="card card-chart"><div class="card-header" id="headertext' + i + '"></div> <div class="card-body"><div class="chart-area"> <canvas id="barLineblue' + i + '"></canvas> <a href="AdminDistrictResult.aspx" class="stretched-link" onclick="onclickdistrictdata(' + i +')" ></a></div> </div> </div> </div>');
    }
}
// generates the chart data using the json response
function generatechart(array) {

    gradientBarChartConfiguration = {
        maintainAspectRatio: false,
        legend: {
            display: false
        },

        tooltips: {
            backgroundColor: '#f5f5f5',
            titleFontColor: '#333',
            bodyFontColor: '#666',
            bodySpacing: 4,
            xPadding: 12,
            mode: "nearest",
            intersect: 0,
            position: "nearest"
        },
        responsive: true,
        scales: {
            yAxes: [{

                gridLines: {
                    drawBorder: false,
                    color: 'rgba(29,140,248,0.1)',
                    zeroLineColor: "transparent",
                },
                ticks: {
                    suggestedMin: 60,
                    suggestedMax: 120,
                    padding: 20,
                    fontColor: "#9e9e9e"
                }
            }],

            xAxes: [{

                gridLines: {
                    drawBorder: false,
                    color: 'rgba(29,140,248,0.1)',
                    zeroLineColor: "transparent",
                },
                ticks: {
                    padding: 20,
                    fontColor: "#9e9e9e"
                }
            }]
        }
    };
    
    var statedata=array

    for (var i = 0; i < statedata.length; i++) {
        var json = $.parseJSON(array[i]);
        partynamearray = [];
        pointsarray = [];

        $.each(json, function (i, item) {

            partynamearray.push(item.txtpartyname);

            pointsarray.push(item.totalvotes);

        })

        // need to write the logic for state , district and constituency

        var ctx = document.getElementById("barLineblue" + i).getContext("2d");

        var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

        gradientStroke.addColorStop(1, 'rgba(29,140,248,0.2)');
        gradientStroke.addColorStop(0.4, 'rgba(29,140,248,0.0)');
        gradientStroke.addColorStop(0, 'rgba(29,140,248,0)'); //blue colors


        var myChart = new Chart(ctx,
            {
                type: 'bar',
                responsive: true,
                legend: {
                    display: false
                },
                data: {
                    labels: partynamearray,
                    datasets: [{
                        label: " Total  votes in  Each Party ",
                        fill: true,
                        backgroundColor: gradientStroke,
                        hoverBackgroundColor: gradientStroke,
                        borderColor: '#1f8ef1',
                        borderWidth: 2,
                        borderDash: [],
                        borderDashOffset: 0.0,
                        data: pointsarray,
                    }]
                },
                options: gradientBarChartConfiguration
            });
    }
}

function onclickdistrictdata(id) {
    var num = id;
    var statename = $('#idstatename' + num).text();
    $.ajax({
        type: "POST",
        url: "../handlers/AdminHandler.ashx",
        data: {
            'CallName': 'GetElectionDataChartViewBydistrict',
            'Statename': statename
        },
        datatyepe: 'json',
        success: function (response) {
            responsedet = $.parseJSON(response)
            var arrdet = responsedet;
            districtarray = [];
            jsonarray = [];

            // generate the cards based on count 
            generatecardsdistrict(response);
            if (arrdet != null && arrdet != undefined && arrdet.length != 0) {
                $.each(arrdet, function (i, item) {
                    var arraydetails =
                    {
                        districtname: item.strDistrict

                    }
                    districtarray.push(arraydetails);
                    
                    jsonarray.push(item.strjson);


                });

            }
            
            // to display the state name on each card.
            $.each(districtarray, function (i, value) {
                $('#headertext' + i).append("<h5 id='iddistrictname" + i + "'>" + value.districtname + "</h5>");
            });
            // generates the graph data using the json array
            generatechart(jsonarray);
        }
        
    });
}


function generatecardsdistrict(response) {

    for (var i = 0; i < $.parseJSON(response).length; i++) {
        $('#generatecards').append('<a href="#" onclick="onclickconstituencydata(' + i + ')"><div class="col-lg-4"><div class="card card-chart"><div class="card-header" id="headertext' + i + '"></div> <div class="card-body"><div class="chart-area"> <canvas id="barLineblue' + i + '"></canvas> </div> </div> </div> </div></a>');
    }
}

function onclickconstituencydata(id) {
    var num = id;
    var district = $('#iddistrictname' + num).text();
    $.ajax({
        type: "POST",
        url: "../handlers/AdminHandler.ashx",
        data: {
            'CallName': 'GetElectionDataChartViewbyConstituency',
            'DistrictNames': district
        },
        datatyepe: 'json',
        success: function (response) {
            responsedet = $.parseJSON(response)
            var arrdet = responsedet;
            districtarray = [];
            constjsonarray = [];

            // generate the cards based on count 
            generatecardsconstituency(response);

            if (arrdet != null && arrdet != undefined && arrdet.length != 0) {
                $.each(arrdet, function (i, item) {
                    var arraydetails =
                    {
                        constituent: item.strParticipatingFrom

                    }
                    districtarray.push(arraydetails);
                    
                    constjsonarray.push(item.strjson);

                });

            }
            // to display the state name on each card.
            $.each(districtarray, function (i, value) {
                $('#headertext' + i).append("<h5 id='idconstiname" + i + "'>" + value.constituent + "</h5>");
            });
            // generates the graph data using the json array
            generatechart(constjsonarray);
        }

    });
}


