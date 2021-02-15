require 'json'

class BrakemanToSonarReport

  def perform
    new_issues = { "issues": collect_warnings }
    replace_old_issues(new_issues)
  end

  def load_warnings_from_file
    file = File.open("#{ENV['PWD']}/brakeman.json")
    data = JSON.load(file)
    file.close

    data['warnings']
  end

  def warning_to_issue(warning)
    {
      "engineId": 'BRAKEMAN',
      "ruleId": 'test',
      "severity": 'MAJOR',
      "type": 'VULNERABILITY',
      "primaryLocation": {
        "message": "#{warning['warning_type']} / #{warning['message']}",
        "filePath": warning['file']
      }
    }
  end

  def collect_warnings
    [].tap do |issues|
      warnings_array = load_warnings_from_file

      warnings_array.each do |warning|
        issues.push(warning_to_issue(warning))
      end
    end
  end

  def replace_old_issues(new_issues)
    file = File.open("#{ENV['PWD']}/issues.json", 'w')
    file.write(JSON.pretty_generate(new_issues))
    file.close
  end
end
