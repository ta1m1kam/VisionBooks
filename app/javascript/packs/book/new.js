
document.addEventListener('DOMContentLoaded', () => {
  $('#isbn_search_button').on('click', function(){
    const isbn = $("#book_isbn").val();
    const url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn;
    $.getJSON(url, function(data) {
      if(!data.totalItems) {
        $("#isbn").val("");
        $("#book_title").text("エラーです");
        $("#book_author").text("");
        $("#book_description").text("");
        $("#message").html('<p class="bg-warning" id="warning">該当する書籍がありません。</p>');
        $('#message > p').fadeOut(3000);
      } else {
  // 該当書籍が存在した場合、JSONをパースして入力項目のデータを取得する
        $("#book_title").val(data.items[0].volumeInfo.title);
        $("#book_author").val(data.items[0].volumeInfo.authors[0]);
        $("#book_publishdate").val(data.items[0].volumeInfo.publishedDate);
        $("#book_description").text(data.items[0].volumeInfo.description);
        $("#book_thumbnail").html('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
        $("#book_image_name").val(data.items[0].volumeInfo.imageLinks.smallThumbnail);
        $("#book_publisher").val(data.items[0].volumeInfo.publisher);
        $("#book_pagecount").val(data.items[0].volumeInfo.pageCount);
        $("#book_textshippet").val(data.items[0].searchInfo.textSnippet);
      }
    });
  });

  $('#title_search_button').on('click', function(){
    const title = $("#search_title").val();
    const url = "https://www.googleapis.com/books/v1/volumes?q=" + title;
    $.getJSON(url, function(data) {
      if(!data.totalItems) {
        $("#isbn").val("");
        $("#book_title").text("エラーです");
        $("#book_author").text("");
        $("#book_description").text("");
        $("#message").html('<p class="bg-warning" id="warning">該当する書籍がありません。</p>');
        $('#message > p').fadeOut(3000);
      } else {
  // 該当書籍が存在した場合、JSONをパースして入力項目のデータを取得する
        console.log(data);
        bookInfo = data.items[0].volumeInfo;
        if (itemExists(bookInfo.title)) {
          $("#book_title").val(bookInfo.title);
        }

        if (itemExists(bookInfo.authors)) {
          $("#book_author").val(bookInfo.authors[0]);
        }

        if (itemExists(bookInfo.publishedDate)) {
          $("#book_publish_date").val(bookInfo.publishedDate);
        }

        if (itemExists(bookInfo.description)) {
          $("#book_description").val(bookInfo.description);
        }

        if (itemExists(bookInfo.imageLinks.thumbnail)) {
          $("#book_thumbnail").html('<img src=\"' + bookInfo.imageLinks.thumbnail + '\" />');
          $("#book_image_url").val(bookInfo.imageLinks.thumbnail);
        }

        if (itemExists(bookInfo.publisher)) {
          $("#book_publisher").val(bookInfo.publisher);
        }

        if (itemExists(bookInfo.pageCount)) {
          $("#book_pagecount").val(bookInfo.pageCount);
        }

        if (itemExists(data.items[0].searchInfo.textSnippet)) {
          $("#book_textshippet").val(data.items[0].searchInfo.textSnippet);
        }
      }
    });
  });

  function itemExists(item) {
    if (item === undefined) {
      return false
    } else {
      return true
    }
  }
});
