class Admin::OrderDetailsController < ApplicationController
  def update
  # 注文詳細データを取得
  # 注文詳細に紐づく注文データを取得
  # 製作ステータスを更新
    if # 注文に紐づく注文詳細の製作ステータスが全部「製作完了」だったら
      # 注文の注文ステータスを「発送準備中」に更新
    end
  end
end
