# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'InnerWorldsCrew@gmail.com'
  layout 'mailer'
end
