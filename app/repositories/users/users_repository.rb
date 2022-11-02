module Users
  class UsersRepository
    def find(id)
      User.find(id)
    end

    def find_by(options)
      User.find_by(options)
    end
  end
end
