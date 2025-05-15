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

    def calculate_progress(tasks_undone, tasks)
      return 0 if tasks == 0
      (tasks_undone.to_f / tasks * 100).round(1)
    end

    def define_progress_color(tasks_undone, tasks)
      progress = calculate_progress(tasks_undone, tasks)
      if progress == 100
        '#abeb94'
      elsif progress >= 50
        '#fce399'
      else
        '#ed8679'
      end
    end
  end
  