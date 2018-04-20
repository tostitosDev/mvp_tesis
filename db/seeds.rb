# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TypeMark.destroy_all
DetailSchedule.destroy_all
Schedule.destroy_all

TypeMark.create id: 1, name_type: 'Entrada'
TypeMark.create id: 2, name_type: 'Salida Colación'
TypeMark.create id: 3, name_type: 'Entrada Colación'
TypeMark.create id: 4, name_type: 'Salida'

Schedule.create id:1, name: 'Practica'
@s1 = Schedule.last

DetailSchedule.create day: 'Monday', time_in: '08:30', time_out_collation: '14:00', time_in_collation: '15:00', time_out: '18:30', work_time:'09:00', collation_time: '01:00', schedule_id: @s1.id
DetailSchedule.create day: 'Tuesday', time_in: '08:30', time_out_collation: '14:00', time_in_collation: '15:00', time_out: '18:30', work_time:'09:00', collation_time: '01:00', schedule_id: @s1.id
DetailSchedule.create day: 'Wednesday', time_in: '08:30', time_out_collation: '14:00', time_in_collation: '15:00', time_out: '18:30', work_time:'09:00', collation_time: '01:00', schedule_id: @s1.id
DetailSchedule.create day: 'Thursday', time_in: '08:30', time_out_collation: '14:00', time_in_collation: '15:00', time_out: '18:30', work_time:'09:00', collation_time: '01:00', schedule_id: @s1.id
DetailSchedule.create day: 'Friday', time_in: '08:30', time_out_collation: '14:00', time_in_collation: '15:00', time_out: '18:30', work_time:'09:00', collation_time: '01:00', schedule_id: @s1.id
