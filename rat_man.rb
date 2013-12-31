require "capybara"
require "capybara/poltergeist"
require "capybara/dsl"

require_relative 'seakrets'

Capybara.javascript_driver = :poltergeist
Capybara.run_server = false

module RatMan

  include Capybara::DSL

  def self.login!(session=nil)
    session ||= Capybara::Session.new(:poltergeist)

    session.visit(HOMEPAGE)
    session.click_link("LOG IN")
    session.fill_in("email", :with => EMAIL)
    session.fill_in("password", :with => PASS)
    session.click_button("LOG IN")
    wait_for_javascript
    session.save_screenshot('login.png')
    return session
  end

  def self.follow_link!(session, link)
    session.visit(link)
    wait_for_javascript
    session.save_screenshot('followed.png')
  end

  def self.wait_for_javascript
    sleep 4
  end
  private_class_method :wait_for_javascript

end
