class ContactsController < ApplicationController
    def new
        @user = User.find(params[:id])
        # 下記は動かない-----------------
        #table = Contact.arel_table
        #condition = table[:sender_id].eq(current_user.id).and(table[:receiver_id].eq(@user.id))
        #condition = condition.or(table[:receiver_id].eq(current_user.id).and(table[:sender_id].eq(@user.id)))
        #@contacts = Contact.where(condition)

        # groupingを使うのが正解-----------------
        # table = Contact.arel_table
        # u1 = current_user
        # u2 = @user
        # a = :sender_id
        # b = :receiver_id
        # condition1 = table.grouping(table[a].eq(u1.id).and(table[b].eq(u2.id)))
        # condition2 = table.grouping(table[b].eq(u1.id).and(table[a].eq(u2.id)))
        # @contacts = Contact.where(condition1.or(condition2)).order(:created_at)

        # 元のコード-----------------
        # @contacts = Contact.where(sender_id: current_user.id, receiver_id: params[:id]) + Contact.where(sender_id: params[:id], receiver_id: current_user.id)
        # @contacts.sort!
        
        # scopeを使う see Contact model 
        @contacts = Contact.all_from_to(current_user, @user).order(:created_at)
        @contact = Contact.new(sender_id: current_user.id, receiver_id: @user.id)
    end
    
    def create
        @contact = Contact.new(contact_params)
        @contact.save
        redirect_to contact_user_path(@contact["receiver_id"])
    end
    
    private
    
    def contact_params
        par = params.require(:contact).permit(:comment, :receiver_id)
        par[:sender_id] = current_user.id
        par
    end
end