module ApplicationHelper
  def input_text(form, attribute, record, **options)
    content_tag(:div, class: "flex gap-4 mb-2") do
      content_tag(:div, class: "input") do
        (form.label attribute, class: "content-xs overline") +
          (content_tag(:div, class: "input__container") do
            form.text_field attribute, class: "input__content", **options
          end) +
          errors_for(record, attribute)
      end
    end
  end

  def input_email(form, attribute, record, **options)
    content_tag(:div, class: "flex gap-4 mb-2") do
      content_tag(:div, class: "input") do
        (form.label attribute, class: "content-xs overline") +
          (content_tag(:div, class: "input__container") do
            form.email_field attribute, class: "input__content", **options
          end) +
          errors_for(record, attribute)
      end
    end
  end

  def input_password(form, attribute, record, **options)
    content_tag(:div, class: "flex gap-4 mb-2") do
      content_tag(:div, class: "input") do
        (form.label attribute, class: "content-xs overline") +
          (content_tag(:div, class: "input__container") do
            form.password_field attribute, class: "input__content", **options
          end) +
          errors_for(record, attribute)
      end
    end
  end

  def input_file(form, attribute, record, **options)
    content_tag(:div, class: "flex gap-4 mb-2") do
      content_tag(:div, class: "input") do
        (form.label attribute, class: "content-xs overline") +
          (form.file_field attribute, class: "input__content", **options) +
          errors_for(record, attribute)
      end
    end
  end

  def errors_for(record, attribute)
    errors = record.errors.full_messages_for(attribute).map do |message|
      content_tag(:span, message, class: "input__error-message")
    end

    safe_join(errors)
  end
end
