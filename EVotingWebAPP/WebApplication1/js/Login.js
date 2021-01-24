



function GetUIAccess()
{
    var inputvoterid = $('#idVoterid').val();
    

    sessionStorage.setItem('id', inputvoterid);
    $.ajax
        ({
            type: 'POST',
            url: "../handlers/LoginHandler.ashx",
            data: {
                'CallName': 'GetUIAccess',
                'voterid':inputvoterid
            },
            datatype: "json",
            success: function (response)
            {
                res = JSON.parse(response);
                if (res=="User") {
                    window.location.href = 'UserVoting';
                }
                if (res == "Admin") {
                    window.location.href = 'AdminVoting';
                }
            }
            

        })
}


