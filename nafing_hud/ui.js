$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        $(".container").css("display", data.show? "none":"block");

        if (event.data.action == "updateStatus") {
            updateStatus(event.data.st);
        }

        if (data.armor > 0 ) {

            $("#boxHealth").css("width", data.health + "%"); // SHOW NORMAL BAR
            $("#boxArmor").css("width", data.armor + "%"); // SHOW NORMAL BAR

            $('#health').hide(); // HIDE 2ND BAR
            $('#armor').hide(); // HIDE 2ND BAR

            $('#boxHealth').hide(); // HIDE 2ND BAR
            $('#boxArmor').hide(); // HIDE 2ND BAR
            
            $('#health').show(); // HIDE 2ND BAR
            $('#boxHealth').show(); // HIDE 2ND BAR

            $('#boxArmor').show(); // HIDE 2ND BAR
            $('#armor').show(); // HIDE 2ND BAR
            

            
        } 
    else
        if (data.armor == 0 ) {
            $("#boxHealth").css("width", data.health + "%"); // SHOW NORMAL BAR
            $("#boxArmor").css("width", data.armor + "%"); // SHOW NORMAL BAR

            $('#boxHealth').hide(); // HIDE 2ND BAR
            $('#health').hide(); // HIDE 2ND BAR

            $('#boxArmor').hide(); // HIDE 2ND BAR
            $('#armor').hide(); // HIDE 2ND BAR

            $('#health').show(); // HIDE 2ND BAR
            $('#boxHealth').show(); // HIDE 2ND BAR

            $('#armor').show(); // HIDE 2ND BAR
            $('#boxArmor').show(); // HIDE 2ND BAR
        }
    })
})

function updateStatus(status){
    $('#boxHunger').css('width', status[0].percent+'%')
    $('#boxThirst').css('width', status[1].percent+'%')
    $('#boxDrunk').css('width', status[3].percent+'%')
    $('#boxStress').css('width', status[2].percent+'%')
}

