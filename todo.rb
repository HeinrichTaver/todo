#!/usr/bin/env ruby

require 'bubbletea'
require 'lipgloss'

class Todo
  include Bubbletea::Model

  def initialize(todo_path)
    @todo_path = todo_path
    @projects = Dir.glob("#{@todo_path}/**/TODO.org").map do |file|
      name = File.dirname(file).gsub("#{@todo_path}/", "").gsub(/\/.*/, "")
    end

    @title_style =
      Lipgloss::Style.new
        .bold(true)
    @help_style =
      Lipgloss::Style.new
        .italic(true)
  end

  def init
    [self, Bubbletea.set_window_title('Todo')]
  end

  def update(message)
    case message
    when Bubbletea::KeyMessage
      case message.to_s
      when 'q', 'ctrl+c', 'ctrl+d'
        return [self, Bubbletea.quit]
      end
    else
      [self, nil]
    end
  end

  def view
    lines = []
    lines << @title_style.render('Todo')
    lines << ''
    lines << 'These projects contain TODO.org files:'
    lines << ''

    @projects.each { |project| lines << project }

    lines << ''
    lines << @help_style.render('Press q to quit')
    lines.join("\n")
  end
end

if __FILE__ == $PROGRAM_NAME
  TODO_PATH = ENV['TODO_PATH'] || File.expand_path("~/src")

  if !File.directory?(TODO_PATH)
    puts "#{TODO_PATH} doest not exist or is not a directory."
    puts "Define TODO_PATH environment variable pointing to a valid directory."
    exit 1
  end

  Bubbletea.run(Todo.new(TODO_PATH), alt_screen: true)
end
