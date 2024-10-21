$(document).on('turbolinks:load', function() {
  // 星評価の初期化コード
  let elem = document.querySelector('#post_raty');
  if (elem) {
    elem.innerHTML = "";
    let opt = {
      starOn: "/assets/star-on.png",
      starOff: "/assets/star-off.png",
      starHalf: "/assets/star-half.png",
      scoreName: 'post[star]',
      score: 1,  // 初期値を1に設定
      click: function(score) {
        $('#review_star').val(score);  // 星評価の値をhiddenフィールドに設定
      }
    };
    if (typeof window.raty !== 'undefined') {
      window.raty(elem, opt); // グローバルに設定した raty 関数を使用
    } else {
      console.error("raty function is not defined. Please check that raty-js is loaded properly.");
    }
  }

  // フォーム送信時の星の評価バリデーション
  $(document).on('submit', 'form', function(event) {
    let starValue = $('#review_star').val();
    if (starValue < 1) {
      alert('星の評価を1以上選んでください。');
      event.preventDefault();
    }
  });
});
