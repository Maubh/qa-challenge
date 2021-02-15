
class ContactPage
    include Capybara::DSL

    def initialize 
        @subjectField = '#uniform-id_contact'
        @emailField = '#email'
        @orderField = '#id_order'
        @messageField = '#message'
        @sendMessageBtn = '#submitMessage'
        @successMsg = '.alert.alert-success'
        @errorMsg = '.alert.alert-danger'
    end


    def fill_form (subject,email,order,message)
        @subjectField = selectSubject(subject)
        #select('subject',:from => 'id_contact')
        find(@emailField).set email
        find(@orderField).set order
        find(@messageField).set message
        find(@sendMessageBtn).click
    end



    def selectSubject(subject)
        dropSubject = find(@subjectField)
        dropSubject.find('option', text: subject).select_option
        # emptySubject = find(@subjectField)
        # emptySubject.find('option', value:[0]).select_option
    end

    # def setEmail(email)
    #     find(@emailField).set email
    # end

    # def setOrder(order)
    #     find(@orderField).set order
    # end

    # def setTextMessage(txtMessage)
    #     find(@messageField).set txtMessage
    # end

    def sendMessage
        find(@sendMessageBtn).click
    end

    def getSuccessMsg
        find(@successMsg).text()
    end

    def getErrorMsg
        find(@errorMsg).text()
    end
    
end