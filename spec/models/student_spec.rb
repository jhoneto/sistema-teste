require 'rails_helper'

RSpec.describe Student, :type => :model do
  it 'valid student' do
    student = FactoryGirl.build(:student)
    expect(student.valid?).to be_truthy
  end

  it 'invalid without name' do
    student = FactoryGirl.build(:student, name: nil)
    student.valid?
    expect(student.errors[:name].size).to eq(1)
  end

  it 'invalid with name with more 45 char' do
    student = FactoryGirl.build(:student, name: 'Aluno Teste com Muito Mais de 45 Letra para Dá Erro')
    student.valid?
    expect(student.errors[:name].size).to eq(1)
  end

  it 'invalid with register number with more 45 char' do
    student = FactoryGirl.build(:student, register_number: 'Aluno Teste com Muito Mais de 45 Letra para Dá Erro')
    student.valid?
    expect(student.errors[:register_number].size).to eq(1)
  end

  it 'invalid remove if exists classroom' do
    student = FactoryGirl.create(:student)
    classroom = FactoryGirl.create(:classroom, student_id: student.id)
    expect(student.destroy).to be_falsey
  end

  it 'valid remove if no exists classroom' do
    student = FactoryGirl.create(:student)
    expect(student.destroy).to be_truthy
  end


end
