require 'rails_helper'
RSpec.describe Collection, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with name and explanation and image' do
        expect(build(:collection)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without name and explanation and image' do
        collection = build(:collection, name: nil, explanation: nil, image: nil)
        collection.valid?
        expect(collection.errors[:name]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without user_id' do
        collection = build(:collection, user_id: nil)
        collection.valid?
        expect(collection.errors[:user]).to include(I18n.t('errors.messages.blank'))
      end
    end
  end
end