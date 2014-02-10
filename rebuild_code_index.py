#!/usr/bin/python

import sys
import os

class BuildIndex:

    def build_tag(self, project_root):
        if project_root in self.allow_projet :
            os.system('/home/dragon/vim_plugins/rebuild_tag_2.sh '+project_root)
    def __init__(self):
        self.allow_projet = ['/home/dragon/project/kz_www', '/home/dragon/project/elearn']

if __name__ == '__main__':
    b = BuildIndex()
    b.build_tag(sys.argv[1])
