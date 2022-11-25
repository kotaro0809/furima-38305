require 'rails_helper'
#bundle exec rspec spec/models/user_spec.rb 

RSpec.describe User, type: :model do
  
  #インスタンス生成
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    context '新規登録がうまくいく時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上あれば登録できること' do
        @user.password = 'kokoko22222'
        @user.password_confirmation = 'kokoko22222'
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかない時" do
     it 'nicknameが空では登録できない' do
       # nicknameが空では登録できないテストコードを記述します
       @user.nickname = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空では登録できない' do
       # emailが空では登録できないテストコードを記述します
       @user.email = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'family_nameが空では登録できない' do
       # family_nameが空では登録できないテストコードを記述します
       @user.family_name = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Family name can't be blank")
     end
     it 'first_nameが空では登録できない' do
       # first_nameが空では登録できない
       @user.first_name = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'family_name_kanaが空では登録できない' do
       # family_name_kanaが空では登録できないテストコードを記述します
       @user.family_name_kana = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Family name kana can't be blank")
     end
     it 'first_name_kanaが空では登録できない' do
       # first_name_kanaが空では登録できないテストコードを記述します
       @user.first_name_kana = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it 'birth_dayが空では登録できない' do
       # birth_dayが空では登録できないテストコードを記述します
       @user.birth_day = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Birth day can't be blank")
     end
     it 'passwordが空では登録できない' do
       # passwordが空では登録できないテストコードを記述します
       @user.password = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'family_name_kanaがカタカナ以外登録できない' do
       # family_name_kanaが空では登録できないテストコードを記述します
       @user.family_name_kana = 'かかか'
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Family name kana カタカナで入力してね")
     end
     it 'first_name_kanaがカタカナ以外登録できない' do
       # first_name_kanaが空では登録できないテストコードを記述します
       @user.first_name_kana = 'かかか'
       @user.valid?
       
       expect(@user.errors.full_messages).to include("First name kana カタカナで入力してね")
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
       @user.password = 'ko0809ma'
       @user.password_confirmation = 'ko0909ma'
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it '重複したemailが存在する場合は登録できない' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
      
       expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'emailは@を含まないと登録できない' do
       @user.email = 'testmail'
       @user.valid?
      
       expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it 'passwordが5文字以下では登録できない' do
       @user.password = 'ko08'
       @user.password_confirmation = 'ko08'
       @user.valid?
       
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it 'passwordが129文字以上では登録できない' do
       @user.password = "ko999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999"
       @user.password_confirmation = @user.password
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
     end

     it 'passwordが英字のみのパスワードでは登録できない' do
      @user.password = 'kokoko'
       @user.password_confirmation = 'kokoko'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
     end

     it 'パスワードが英語のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
     end
     it 'パスワードが数字のみでは登録できない' do
      @user.password = '11111111'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
     end
     it 'パスワードに全角文字が含まれていたら登録できない' do
      @user.password = 'aっっm１１１'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
     end

     it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.family_name = 'aaaあああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
     end

     it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'aaaあああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end
    end
    
  
  end
end
 
 
