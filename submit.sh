steps:

- name: gcr.io/cloud-builders/mvn
  args: ['-Dproject.build.sourceEncoding=UTF-8', '-Dproject.reporting.outputEncoding=UTF-8, 'clean']

- name: gcr.io/cloud-builders/mvn
  args: ['install', '-Dmaven.test.skip=true', '-dcheckstyle=skip']

- name: gcr.io/cloud-builders/mvn
  args: ['package', '-Dmaven.test.skip=true', '-dcheckstyle=skip']