module SoMeta
  module Helper
    def so_meta(name)
      interpolation_data = instance_variable_get("@so_meta_#{name}_interpolation") || {}
      key = params[:id] ? "#{controller_name}.#{action_name}.#{params[:id]}.#{name}" : "#{controller_name}.#{action_name}.#{name}"
      t("so_meta.#{key}", interpolation_data.merge(default: t("so_meta.defaults.#{name}")))
    end

    def so_meta_interpolation(name, hash)
      instance_variable_set("@so_meta_#{name}_interpolation", hash)
    end
  end
end
