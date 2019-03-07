require_relative '../config/environment'
require 'pry'
@prompt = TTY::Prompt.new


def greeting
  a = Artii::Base.new :font => 'slant'
  puts a.asciify('KEY JAMMER')
end

def get_choice
  i = ""
  while i.empty?
    i = gets.chomp
    if i.empty?
      puts "Input is required"
    elsif i.to_i > 2 || i.to_i < 1
      puts "Invalid input"
      i = ""
    end
  end
  i
end

def main_menu
  prompt = TTY::Prompt.new
  prompt.select('Select an Option') do |menu|
    menu.choice name: 'New User!',  value: 1
    menu.choice name: 'Load User', value: 2
  end
end

def new_user?
  case main_menu
  when 1
      initialize_user
  when 2
      load_user
  end
end

# def new_user?
#   puts "Press 1 to create a new user\nPress 2 to load user"
#   choice = get_choice.to_i
#
# end

def load_user
  puts "Enter user name"
  usr_nm = get_username
  if User.find_by_name(usr_nm)
     User.find_by_name(usr_nm)
  else
    puts "That user doesn't exist."
    new_user?
  end
end

def get_username
  name = ""
  while name.empty?
    name = gets.chomp
    if name.empty?
      puts "Input is required"
    end
  end
  puts "Hello #{name}"
  name
end

def initialize_user
  puts "Enter user name"
  this_user = nil
  user_name = get_username
  all_users = User.all.map {|user| user.name}
  a = true
  while a == true
     if all_users.include?(user_name)
       puts "Sorry, that name is taken.  Try again."
       print ":"
        user_name = get_username
    else
      a = false
      this_user = User.create(name: user_name)
      this_user
    end
  end
  this_user.default_kit
  this_user
end

populate
greeting

this_user = new_user?
this_user.user_choice_menu_method
