// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


// 必要なライブラリのインポート
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

// Bootstrap導入用
import $ from "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

// jQueryをグローバルに設定
window.$ = window.jQuery = $;

// Ratyのインポート
import Raty from 'raty-js';

// jQueryプラグインとしてRatyを設定
$.fn.raty = function(options) {
  return this.each(function() {
    let ratyInstance = new Raty(this, options);
    ratyInstance.init();
  });
};

// Rails, Turbolinks, ActiveStorage のスタート
Rails.start();
Turbolinks.start();
ActiveStorage.start();


// インデックスビューでの星評価表示の設定
$(document).on('turbolinks:load', function() {
  if (typeof postsData !== 'undefined') {
    console.log('postsData:', postsData); // デバッグ用にpostsDataを確認
    postsData.forEach(function(post) {
      let elem = document.querySelector('#post_raty_' + post.id);
      if (elem == null) return;

      // 星評価のオプション設定
      let opt = {
        starOn: "<%= asset_path('star-on.png') %>",
        starOff: "<%= asset_path('star-off.png') %>",
        starHalf: "<%= asset_path('star-half.png') %>",
        score: post.star || 0,
        readOnly: true,
        number: 5
      };
      
      // ratyのインスタンスを初期化して表示
      window.raty(elem, opt);
    });
  }
});
