$(function(){
  function calSalesCommission(price){
    html = `<div class="tax">¥
              ${price.sales_commission}
            </div>`;
    $('.stick__tax').append(html)
  }
  function calProfit(price){
    html = `<div class="margin">¥
              ${price.profit}
            </div>`;
    $('.stick__margin').append(html)
  }

  $(document).on('change', '#price__form' ,function(){
    price = document.getElementById('price__form').value
    $.ajax ({
      url: '/items/cal_profit',
      type: 'GET',
      data: { price: price },
      dataType: 'json'
    })
    .done(function(price){
      $(document).on('change', '#price__form', function(){
        $('.stick__tax').remove(); 
        $('.stick__margin').remove();
      })
      calSalesCommission(price);
      calProfit(price);
    })
  });
});