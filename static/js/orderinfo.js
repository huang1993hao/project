$(function(){
    // $('.orderinfo').width(innerWidth)
     $('#buy_btn').click(function () {
        console.log('zhifu')
        var identifier = $(this).attr('identifier')
        $.get('/pay/',{'identifier':identifier},function (response) {
            // console.log(response.alipay_url)
            window.open(response.alipay_url,target='_self')
        })
    })
})