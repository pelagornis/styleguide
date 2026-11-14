#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"

root = File.expand_path("../.agents/skills", __dir__)
errors = []
names = []
secret_patterns = [
  /(?:api[_-]?key|access[_-]?token|secret)\s*[:=]\s*["']?[A-Za-z0-9_\-]{16,}/i,
  /\bsk-[A-Za-z0-9]{20,}\b/
]

unless Dir.exist?(root)
  warn "Skill directory not found: #{root}"
  exit 1
end

Dir.children(root).sort.each do |directory|
  skill_dir = File.join(root, directory)
  next unless File.directory?(skill_dir)

  skill_file = File.join(skill_dir, "SKILL.md")
  unless File.file?(skill_file)
    errors << "#{directory}: missing SKILL.md"
    next
  end

  content = File.read(skill_file, encoding: "UTF-8")
  errors << "#{directory}: possible credential in SKILL.md" if secret_patterns.any? { |pattern| content.match?(pattern) }
  match = content.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  unless match
    errors << "#{directory}: missing YAML frontmatter"
    next
  end

  metadata = YAML.safe_load(match[1], permitted_classes: [], aliases: false)
  unless metadata.is_a?(Hash)
    errors << "#{directory}: frontmatter must be a mapping"
    next
  end

  name = metadata["name"]
  description = metadata["description"]
  errors << "#{directory}: missing name" unless name.is_a?(String) && !name.empty?
  errors << "#{directory}: missing description" unless description.is_a?(String) && !description.empty?
  errors << "#{directory}: name must match directory name" unless name == directory
  errors << "#{directory}: invalid name" unless name&.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
  names << name if name

  content.scan(/\[[^\]]+\]\(([^)]+)\)/).flatten.each do |link|
    next if link.match?(%r{\A(?:https?:|#)})

    path = File.expand_path(link.split("#", 2).first, skill_dir)
    errors << "#{directory}: missing linked file #{link}" unless File.exist?(path)
  end
end

duplicates = names.tally.select { |_name, count| count > 1 }.keys
errors.concat(duplicates.map { |name| "duplicate skill name: #{name}" })

if errors.empty?
  puts "Validated #{names.length} skills."
  exit 0
end

warn errors.join("\n")
exit 1
