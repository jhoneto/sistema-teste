require 'rails_helper'

RSpec.describe Course, :type => :model do
  it 'valid course' do
    course = FactoryGirl.build(:course)
    expect(course.valid?).to be_truthy
  end

  it 'invalid without name' do
    course = FactoryGirl.build(:course, name: nil)
    course.valid?
    expect(course.errors[:name].size).to eq(1)
  end

  it 'invalid with name with more 45 char' do
    course = FactoryGirl.build(:course, name: 'Curso Teste com Muito Mais de 45 Letra para Dá Erro')
    course.valid?
    expect(course.errors[:name].size).to eq(1)
  end

  it 'invalid with description with more 45 char' do
    course = FactoryGirl.build(:course, description: 'Curso Teste com Muito Mais de 45 Letra para Dá Erro')
    course.valid?
    expect(course.errors[:description].size).to eq(1)
  end
end
