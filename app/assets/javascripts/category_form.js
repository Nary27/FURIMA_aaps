$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){ 
    var childSelectHtml = '';
      childSelectHtml = `<div class='category__name' id= 'children_wrapper'>
                            <select class="category__name--form" id="child_category" required="required" name="item[category_id]">
                              <option value="">選択してください</option>
                              ${insertHTML}
                            </select>
                          </div>
                          <div class= 'item_select-grandchildren'>
                          </div>
                        </div>`;
    $('.item_select-children').append(childSelectHtml);
  }
  function appendgrandChidrenBox(insertHTML){
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='category__name' id= 'grandchildren_wrapper'>
                                  <select class="category__name--form" id="grandchild_category" required="required" name="item[category_id]">
                                    <option value="">選択してください</option>
                                    ${insertHTML} 
                                  </select>
                                <div class="item_select-size">
                                </div>
                              </div>`;
    $('.item_select-grandchildren').append(grandchildrenSelectHtml);
  }
  function appendSizeBox(){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class='item-select-wrapper category__name' id= 'set_sizes_wrapper'>
                        <div class="category__name--size">
                          <label for="item_size">サイズ</label>
                          <span>必須</span>
                        </div>
                        <div class='ategory__name--form'>
                          <select class="contents__main__detail__right__select__form" name="item[size]" id="item_size">
                            <option value="">選択してください</option>
                            <option value="XXSS">XXS以下</option>
                            <option value="XS">XS(SS)</option>
                            <option value="S">S</option>
                            <option value="M">M</option>
                            <option value="L">L</option>
                            <option value="XL">XL(LL)</option>
                            <option value="2XL">2XL(3L)</option>
                            <option value="3XL">3XL(4L)</option>
                            <option value="4XL">4XL(5L)以上</option>
                            <option value="FREE SIZE">FREE SIZE</option>
                          </select>
                        </div>
                      </div>`;
    $('.item_select-size').append(sizeSelectHtml);
  }
  function appendSizeBoxChild(){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class='item-select-wrapper category__name' id= 'set_sizes_wrapper'>
                        <div class="category__name--size">
                          <label for="item_size">サイズ</label>
                          <span>必須</span>
                        </div>
                        <div class='ategory__name--form'>
                          <select class="contents__main__detail__right__select__form" name="item[size]" id="item_size">
                            <option value="">選択してください</option>
                            <option value="60cm">60cm</option>
                            <option value="70cm">70cm</option>
                            <option value="80cm">80cm</option>
                            <option value="90cm">90cm</option>
                            <option value="95cm">95cm</option>
                          </select>
                        </div>
                      </div>`;
    $('.item_select-size').append(sizeSelectHtml);
  }
  function appendSizeBoxShoes(){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class='item-select-wrapper category__name' id= 'set_sizes_wrapper'>
                        <div class="category__name--size">
                          <label for="item_size">サイズ</label>
                          <span>必須</span>
                        </div>
                        <div class='ategory__name--form'>
                          <select class="contents__main__detail__right__select__form" name="item[size]" id="item_size">
                            <option value="">選択してください</option>
                            <option value="23.5cm以下">23.5cm以下</option>
                            <option value="24cm">24cm</option>
                            <option value="24.5cm">24.5cm</option>
                            <option value="25cm">25cm</option>
                            <option value="25.5cm">25.5cm</option>
                            <option value="26cm">26cm</option>
                            <option value="26.5cm">26.5cm</option>
                            <option value="27cm">27cm</option>
                            <option value="27.5cm">27.5cm</option>
                            <option value="28cm">28cm</option>
                            <option value="28.5cm">28.5cm</option>
                            <option value="29cm">29cm</option>
                            <option value="29.5cm">29.5cm</option>
                            <option value="30cm">30cm</option>
                            <option value="30.5cm">30.5cm</option>
                            <option value="31cm以上">31cm以上</option>
                          </select>
                        </div>
                      </div>`;
    $('.item_select-size').append(sizeSelectHtml);
  }

  $(document).on('change', '#category_select', function(){
    var category_value = document.getElementById('category_select').value;
    if (category_value != ''){
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { category_value: category_value },
        dataType: 'json'
      })
      .done(function(children){
        var insertHTML = '';
        children.forEach(function(child){  
          insertHTML += appendOption(child); 
        });
        appendChidrenBox(insertHTML); 
        $(document).on('change', '#category_select', function(){
          $('.item_select-grandchildren').remove();
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
          $('#set_sizes_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリーの取得に失敗しました');
      })
    }
  });
  $(document).on('change', '#child_category', function(){
    var category_value = document.getElementById('child_category').value;
    if (category_value != ''){
      $.ajax ({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { category_value: category_value },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $(document).on('change', '#child_category',function(){
          $('set_sizes_wrapper').remove();
        })
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendgrandChidrenBox(insertHTML);  
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          $('#set_sizes_wrapper').remove();
        })
        $(document).on('change', '#grandchildren_wrapper',function(){
          $('#set_sizes_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリーの取得に失敗しました');
      })
    }
  });
  $(document).on('change', '#grandchild_category', function(){
    var parents_category_value = document.getElementById('category_select').value;
    var child_category_value = document.getElementById('child_category').value;
    if (parents_category_value == 2 && child_category_value == 31) {
      appendSizeBoxShoes();
      $(document).on('change', '#child_category',function(){
        $('#grandchildren_wrapper').remove();
        $('#set_sizes_wrapper').remove();
      })
    }
    else if (parents_category_value == 1 && child_category_value == 19) {
      appendSizeBoxShoes();
      $(document).on('change', '#child_category',function(){
        $('#grandchildren_wrapper').remove();
        $('#set_sizes_wrapper').remove();
      })
    }
    else if (parents_category_value == 1 || parents_category_value == 2){
        appendSizeBox();
      $(document).on('change', '#child_category',function(){
        $('#grandchildren_wrapper').remove();
        $('#set_sizes_wrapper').remove();
      })
      $(document).on('change', '#grandchild_category',function(){
        $('#set_sizes_wrapper').remove();
      })
    }
    else if (parents_category_value == 3) {
      appendSizeBoxChild();
      $(document).on('change', '#child_category',function(){
        $('#grandchildren_wrapper').remove();
        $('#set_sizes_wrapper').remove();
      })
    }
    $(document).on('change', '#grandchild_category',function(){
      $('#set_sizes_wrapper').remove();
    })
  });
});