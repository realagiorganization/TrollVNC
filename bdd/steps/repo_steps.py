import os
from behave import given, then

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))


def _full_path(path):
    return os.path.join(REPO_ROOT, path)


def _read(path):
    full_path = _full_path(path)
    with open(full_path, "r", encoding="utf-8") as handle:
        return handle.read()


@given('the repository file "{path}" exists')
def step_file_exists(context, path):
    full_path = _full_path(path)
    assert os.path.exists(full_path), f"Expected file to exist: {path}"


@then('the file "{path}" contains "{needle}"')
def step_file_contains(context, path, needle):
    content = _read(path)
    assert needle in content, f"Expected '{needle}' to appear in {path}"
