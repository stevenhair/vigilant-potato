from invoke import run, task


# noinspection PyUnusedLocal
@task
def install_dependencies(ctx):
    run('npm install')


# noinspection PyUnusedLocal
@task(default=True, pre=[install_dependencies])
def test(ctx):
    run('npm test')

