every :monday, at: "3:24 pm" do 
  runner Mutations::StatSenderJob.perform_async(User.pluck(:id))
end