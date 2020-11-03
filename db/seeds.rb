# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Tag.create(name: 'プログラミング', explanation: 'プログラミングに関すること')
Tag.create(name: '動画編集', explanation: '動画編集に関すること')
Tag.create(name: '副業', explanation: '副業に関すること')
Tag.create(name: 'その他', explanation: 'それ以外に関すること')