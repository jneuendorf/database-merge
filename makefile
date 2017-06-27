MODULE = database-merge
MAIN = ./database_merge.py

install:
	pip3 install -r requirements.txt

test:
	@# use '-v' for higher verbosity
	python3 -m unittest discover -s ./spec -p "*_test.py"

run:
	python3 database_merge.py --settings-file=./testsettings.yml --log=DEBUG

run_optimized:
	python3 -O database_merge.py --settings-file=./testsettings.yml

lint:
	pylint $(MODULE)
	@#mypy --hide-error-context --show-column-numbers --follow-imports skip --disallow-untyped-calls --allow-untyped-defs --check-untyped-defs --disallow-subclassing-any --no-warn-incomplete-stub --warn-redundant-casts --warn-no-return --warn-return-any --warn-unused-ignores --ignore-missing-imports --strict-optional $(MAIN)
