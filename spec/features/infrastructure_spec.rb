feature "hello world" do
  scenario "display hello world at /" do
    visit "/"
    expect(page).to have_content "Hello world"
  end
end
