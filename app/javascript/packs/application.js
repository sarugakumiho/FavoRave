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

// レビュー機能用のライブラリ読み込み
import Raty from 'raty-js';

// Rails, Turbolinks, ActiveStorage のスタート
Rails.start();
Turbolinks.start();
ActiveStorage.start();

// Ratyの初期化
window.raty = function(elem, opt) {
  if (typeof Raty === 'undefined') {
    console.error('Raty is not defined. Please ensure that raty-js is properly loaded.');
    return;
  }
  let ratyInstance = new Raty(elem, opt);
  ratyInstance.init();
  return ratyInstance;
};
