'use strict';

const e = React.createElement;

class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = { liked: false };
  }

  render() {
    if (this.state.liked) {
      return 'You liked this.';
    }

    return e(
      'button',
      { onClick: () => this.setState({ liked: true }) },
      'Like'
    );
  }
}

// ... コピーアンドペーストしたサンプルコード ...

const domContainer = document.querySelector('#like_button_container');
ReactDOM.render(e(LikeButton), domContainer);

// この 2 行のコードは、ステップ 1 で追加した空の <div> 要素を見つけてきて、その中に React コンポーネントの「いいね」ボタンを表示します。
