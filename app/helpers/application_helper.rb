module ApplicationHelper
    def css_class_for_priority(priority)
      case priority
      when 'alta' then 'prioridade-alta'
      when 'media' then 'prioridade-media'
      when 'baixa' then 'prioridade-baixa'
      else 'prioridade-indefinida'
      end
    end
  end
  