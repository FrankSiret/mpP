#include "launcher.h"
#include <QDebug>

Launcher::Launcher(QObject *parent) : QObject(parent)
{

}

void Launcher::launch(const QString &program)
{
    m_process = new QProcess(this);
    m_process->start(program);
    m_process->waitForFinished(-1);
}
