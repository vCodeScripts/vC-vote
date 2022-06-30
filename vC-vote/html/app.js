selected = ''

$(document).on('click', '.VoteForThis', function(){
    $('.checkemoji').css('opacity', '0')
    $(this).find('.checkemoji').css('opacity', 1)
    selected = $(this).parent().attr('data-voteid')
    console.log(selected)
})

addEventListener('message', function(event){
    var poy = event.data;
    if (poy.type == 'show'){
        $('.maincon').fadeIn();
        SetupData();
    }
})

function LoadVoters(){
    $('.loadinggif').fadeOut();
    setTimeout(function(){
        $('.maincon').css('height', '85vh')
        setTimeout(function(){$('.bottompart').fadeIn()}, 180)
    }, 200)

}


document.onkeydown = function(data){
    if (data.which == 27){
        $('.bottompart').fadeOut()
        setTimeout(function(){
            $('.maincon').css('height', '30vh');
            setTimeout(function(){
                $('.maincon').fadeOut();
                $('.checkemoji').css('opacity', '0')
                $('.congratsDiv').fadeOut();

            }, 180)
            
        }, 180)

        $.post('https://vC-vote/close')
    }
}


function SetupData(){
    $.post('https://vC-vote/getConfig', JSON.stringify({}), function(vCode){
        $('.voteName').html(vCode.ElectionName)
        $('.hashtag').html(vCode.ElectionHashtag)
        $('.voteCon').html('')


        $.each(vCode.Options, function (index, data) {
            console.log(index,data)
            htmlsorgu = `<div class="newSelect" data-voteid="${index}">
            <strong class="selectName">${data.name}</strong>
            <span class="selectDesc">${data.desc}</span>
            <button class="VoteForThis">
                <i class="fa-solid fa-check checkemoji"></i>
            </button>
        </div>`
            $('.voteCon').append(htmlsorgu)
        })
        LoadVoters();
    })
}

$(document).on('click','.Vote', function(){
    if (selected != ''){
        $.post('https://vC-vote/voteForSomeone', JSON.stringify({id:selected}))
        $('.bottompart').hide()
        $('.votingForText').html('Voted For:')
        $('.maincon').css('height', '30vh');
        setTimeout(function(){        
            $('.congratsDiv').fadeIn();
            setTimeout(function(){ 
                $('.maincon').fadeOut();
                $.post('https://vC-vote/close');
            }, 3000)

        }, 250)

    } else {
        $.post('https://vC-vote/error')
    }
})