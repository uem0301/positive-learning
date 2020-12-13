require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with title,explanation,image,video' do
        expect(create(:item)).to be_valid
      end

      it "it Even if you don't have an image, a video will work" do
        expect(create(:item, image: nil)).to be_valid
      end

      it "it Even if you don't have an video, a image will work" do
        expect(create(:item, video: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without title and explanation and image and video' do
        item = build(:item, title: nil, explanation: nil, image: nil, video: nil)
        item.valid?
        expect(item.errors[:title]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without user_id' do
        item = build(:item, user_id: nil)
        item.valid?
        expect(item.errors[:user]).to include(I18n.t('errors.messages.blank'))
      end
      it 'is invalid without collection_id' do
        item = build(:item, collection: nil)
        item.valid?
        expect(item.errors[:collection]).to include(I18n.t('errors.messages.blank'))
      end

    end
  end
end