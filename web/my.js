function ajax_get(){


  $.ajax({
    type: "GET",
    url: "http://127.0.0.1:10080/",
    datatype: "json",
    timeout: "10000",
    data: "",
  })

  .then(
    // ＊1. 少なくとも通信は成功した際の処理＊
    function(json) {
      console.log(json.lunch)
      $("div#box").html(json.lunch)
    },
    // ＊2. 通信すら失敗した時の処理＊
    function() {
      $("div#box").html("Error (server down)")
    }
  );
}

ajax_get();