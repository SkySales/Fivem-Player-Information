window.addEventListener('load', function() {
    console.log('Show Info loaded');
});

window.addEventListener('message', function(event) {
    var v = event.data

    switch (v.action) {
        case 'OpenMenu': 
            $('.container').show()

        break;
    }
})


$(function(){
    $('.showid').click(function(){
        $.post('https://sky_info/showID', JSON.stringify({
        }));
    })

    $('.showjob').click(function(){
        $.post('https://sky_info/showJOB', JSON.stringify({
        }));
    })

    $('.showsoc').click(function(){
        $.post('https://sky_info/showSOC', JSON.stringify({
        }));
    })

    $('.showcash').click(function(){
        $.post('https://sky_info/showCASH', JSON.stringify({
        }));
    })

    $('.showbank').click(function(){
        $.post('https://sky_info/showBANK', JSON.stringify({
        }));
    })

    $('.showdirty').click(function(){
        $.post('https://sky_info/showDIRTY', JSON.stringify({
        }));
    })
})

$(document).keyup((e) => {
    if (e.key === "Escape") {
        CloseAll()
    }
});

function CloseAll(){
    $('.container').fadeOut(500);
    $.post('https://sky_info/exit', JSON.stringify({}));
}