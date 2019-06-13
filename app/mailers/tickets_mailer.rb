class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket

    # TODO: locale
    mail(to: user.email,
         subject: "Хэй-хо вы купили билет! Hi, you bought a ticket!")
  end

  def delete_ticket(user, ticket)
    @user = user
    @ticket = ticket

    # TODO: locale
    mail(to: user.email,
         subject: "Билет удален! Ticket was delete!")
  end
end
