module MessagesHelper

  def imply_sender
    params[:message][:sender_id] = current_user.id
    params[:message][:sender] = current_user.email
  end

  def internal_only?
    @message.recipient_emails.split(";").map(&:strip).slice(1..-1).all? do |email|
      email.ends_with?('@abemail.net')
    end #use a lambda here?
  end


end
