#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright (c) 2017 - hongzhi.wang <hongzhi.wang@moji.com> 
'''
Author: hongzhi.wang
Create Date: 2019/2/20
Modify Date: 2019/2/20
'''

from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'

@app.route('/healthz')
def healthz():
    return 'ok'

if __name__ == '__main__':
    app.run()
