feature "user can receive message" do
  
  let(:receiver) { FactoryBot.create(:user, email: 'receiver@example.com')}
  let(:sender) { FactoryBot.create(:user, email: 'sender@example.com') }

  before do 
    login_as(receiver, scope: :user)
    visit mailbox_inbox_path
    sender.send_message(receiver, 'Today we will have pizza for dinner', 'Friday Dinner' )
  end

  it 'expects user to receive message' do
    count = receiver.mailbox.inbox.count
    expect(count).not_to eq 0
  end
end
