

function GetCandidateDetails()
{
    var userid = sessionStorage.getItem('id');


    $.ajax({
        type: 'POST',
        url: "../handlers/UserHandler.ashx",
        data: {
            'CallName': 'GetUserVoterInfo',
            'userid': userid,

        },
        dattype: "json",

        success: function (response) {
            Candidatedetails = [];
            if (response != "[]") {
                var responedet = $.parseJSON(response)
                var arrdet = responedet;
                if (arrdet != null && arrdet != undefined && arrdet.length != 0)
                {
                    $.each(arrdet, function (i, item)
                    {
                        var arraydetails =
                        {
                            partyname: item.strPartyName,
                            participatingcandidate: item.strPPersonName,
                            //symbol:item.image

                        }
                        Candidatedetails.push(arraydetails);

                    });

                }

            }
            $.each(Candidatedetails, function (i, item) {
                //$('#carddeck').append("<div class='image'><img class='card-img-top' src='../images/" + item.partyname + ".jpg' ><div class='details'><h5 id='idpartyname" + i + "'>" + item.partyname + "</h5><p id='idpersoname" + i + "'>" + item.participatingcandidate + "</p></div><div class='more'><input class='btn btn-primary'style='margin-left:71px;' type='button' id='idvote" + i + "' onclick='vote(" + i + "); return false'  Value='Vote'></div></div>");
                $('#carddeck').append(" <div class='col-md-3'><div class= 'card'><div class='card-image'><img class='card-img-top' src='../images/" + item.partyname + ".jpg' onerror='this.src = `${usericon.jpg}`;' ><div class='card-text'><h5 id='idpartyname" + i + "'>" + item.partyname + "</h5><p id='idpersoname" + i + "'>" + item.participatingcandidate + "</p></div><div class='card-stats'><input class='btn btn-primary' type='button' id='idvote" + i + "' onclick='vote(" + i + "); return false'  Value='Vote'></div></div>");
                //    $('#cardarea').append('<div class="card-image"><img src="../images/' + item.partyname + '.jpg"></div>');
                //    $('#cardarea').append("<div class='card-stacked'><div class='card-content'><h2 id='idpartyname"+i+"'>"+item.partyname+"</h2><p id='idpersoname"+i+"'>" + item.participatingcandidate + "</p></div></div>");
                //    $('#cardarea').append("<div class='card-action'><button class='btn waves-effect waves-light' id='idvote" + i +"' onclick='vote("+ i +");return false' type='submit' Value='Vote'></button ></div>");
                //});

            });

        }

    });

}    

function OpenModalToVote(id)
{
    var num = id;
    

}



function vote(id) {
    var num = id;
    var candidatename = $('#idpersoname' + num).text();
    var partyname = $('#idpartyname' + num).text();
    var vid = sessionStorage.getItem('id');
    $.ajax({
        type: "POST",
        url: "../handlers/UserHandler.ashx",
        data: {
            'CallName': 'CastUserVote',
            'votersid': vid,
            'PPersonName': candidatename,
            'Party':partyname
        },
        datatype: 'json',
        success: function (response) {
            response=$.parseJSON(response)
            if (response == "1") {
                var msg="Your Vote  has been casted for the above party"
               
                $('#idsucessmodalbody').append('<div><img src="../images/' + partyname + '.jpg"><p>' + candidatename + '</p><h5>' + msg + '</h5></div>');
                $('#idSuccessmodal').modal('show');
                setTimeout(function () { $('#idSuccessmodal').modal('hide') }, 2000);
            }

        }
    })

}

var arraydetailsparties = [];
var arraydetailstotalvotes = [];
function chartViewofMlaresult() {

    var userid = sessionStorage.getItem('id');
    $.ajax({
        type: "POST",
        url: "../handlers/UserHandler.ashx",
        data: {
            'CallName': 'ViewProgressionInUserLocationMLA',
            'voterid': userid,
        },
        datatyepe: 'json',
        success: function (response) {
            
            if (response != "[]") {
                var responedet = $.parseJSON(response)
                var arrdet = responedet;
                if (arrdet != null && arrdet != undefined && arrdet.length != 0) {
                    $.each(arrdet, function (i, item) {
                        
                        arraydetailsparties.push(item.strPartyName);
                        //var arraydetails =
                        //{
                            
                        //    noofvotes: item.inttotalvotes

                        //}
                        arraydetailstotalvotes.push(item.inttotalvotes);

                    });
                    generatechartmla();
                }

            }

           
            

        }

    });
}

function generatechartmla() {

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
   

    var ctx = document.getElementById("barchartmla").getContext("2d");

    var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

    gradientStroke.addColorStop(1, 'rgba(29,140,248,0.2)');
    gradientStroke.addColorStop(0.4, 'rgba(29,140,248,0.0)');
    gradientStroke.addColorStop(0, 'rgba(29,140,248,0)'); //blue colors


    var myChart = new Chart(ctx, {
        type: 'bar',
        responsive: true,
        legend: {
            display: false
        },
        data: {
            labels: arraydetailsparties,
            datasets: [{
                label: " Total  votes in  Each Party ",
                fill: true,
                backgroundColor: gradientStroke,
                hoverBackgroundColor: gradientStroke,
                borderColor: '#1f8ef1',
                borderWidth: 2,
                borderDash: [],
                borderDashOffset: 0.0,
                data:arraydetailstotalvotes ,
            }]
        },
        options: gradientBarChartConfiguration
    });
}
arraydetailsmpparties = [];
arraydetailsmpvotes = [];
function chartViewofMpresult() {

    var userid = sessionStorage.getItem('id');
        $.ajax({
            type: "POST",
            url: "../handlers/UserHandler.ashx",
            data: {
                'CallName': 'ViewProgressionInUserLocationMP',
                'voterid': userid,
            },
            datatyepe: 'json',
            success: function (response) {
               
                if (response != "[]") {
                    var responedet = $.parseJSON(response)
                    var arrdet = responedet;
                    if (arrdet != null && arrdet != undefined && arrdet.length != 0) {
                        $.each(arrdet, function (i, item) {
                            
                                arraydetailsmpparties.push(item.strPartyName);
                                arraydetailsmpvotes.push(item.inttotalvotes);

                        });
                        generatechartmp();
                    }

                }




            }

        });
}

function generatechartmp() {

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

    var ctx = document.getElementById("barchartmp").getContext("2d");

    var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

    gradientStroke.addColorStop(1, 'rgba(29,140,248,0.2)');
    gradientStroke.addColorStop(0.4, 'rgba(29,140,248,0.0)');
    gradientStroke.addColorStop(0, 'rgba(29,140,248,0)'); //blue colors


    var myChart = new Chart(ctx, {
        type: 'bar',
        responsive: true,
        legend: {
            display: false
        },
        data: {
            labels: arraydetailsmpparties,
            datasets: [{
                label: "No of votes ",
                fill: true,
                backgroundColor: gradientStroke,
                hoverBackgroundColor: gradientStroke,
                borderColor: '#1f8ef1',
                borderWidth: 2,
                borderDash: [],
                borderDashOffset: 0.0,
                data: arraydetailsmpvotes,
            }]
        },
        options: gradientBarChartConfiguration
    });
}
