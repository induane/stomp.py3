PYTHON=python2.7

ENV_DIR=.env_$(PYTHON)
IN_ENV=. $(ENV_DIR)/bin/activate &&

all: pep8 sdist

env: $(ENV_DIR)

artifacts: env build_reqs sdist

$(ENV_DIR):
	virtualenv -p $(PYTHON) .env_$(PYTHON)

build_reqs:
	$(IN_ENV) pip install pep8 coverage

sdist: build_reqs
	$(IN_ENV) python setup.py sdist

pep8: build_reqs
	- $(IN_ENV) pep8 stomp > pep8.out

clean:
	- rm -rf BUILD
	- rm -rf BUILDROOT
	- rm -rf RPMS
	- rm -rf SRPMS
	- rm -rf SOURCES
	- rm -rf docs/build
	- rm -rf src/*.egg-info
	- rm -rf build
	- rm -rf dist
	- rm -f .coverage
	- rm -f test_results.xml
	- rm -f coverage.xml
	- rm -f pep8.out
	- find ./stomp -name '*.pyc' -delete
	- find ./stomp -name '*.pyo' -delete
	- find . -name '.egg-info' -delete

env_clean: clean
	- rm -rf $(ENV_DIR)
