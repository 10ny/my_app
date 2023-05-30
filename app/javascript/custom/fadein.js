//Turbolinks使用時はイベント発火のため最初の1行を記述するZ

// ページ全体を 0.7 秒かけてフェードイン
document.addEventListener("turbo:load", function() {
  $('body').fadeIn(700);
});

//renderの際も 0.7 秒かけてフェードイン(フォロー・フォロワー表示用)
document.addEventListener("turbo:render", function() {
  $('body').fadeIn(700);
});
