module ApplicationHelper
    def css_class_for_priority(priority)
      case priority
      when 'alta' then 'prioridade-alta'
      when 'media' then 'prioridade-media'
      when 'baixa' then 'prioridade-baixa'
      else 'prioridade-indefinida'
      end
    end

    def is_complete(tasks_undone, tasks)
      tasks_done = tasks - tasks_undone
      tasks_done == 0 ? 'complete' : 'incomplete'
    end
  end
  