# frozen_string_literal: true

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  def to_yaml
    @data.to_yaml
  end
end
