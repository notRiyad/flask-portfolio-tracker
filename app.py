#Libs
import pymysql
pymysql.install_as_MySQLdb()

from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

#App
app = Flask(__name__)

#Configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:%40AmiralGestion%232024@localhost/portefeuille_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


#Définition des modèles
class Fonds(db.Model):
    __tablename__ = 'referentielfonds'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    instruments = db.relationship('Instrument', back_populates='fond')

class Instrument(db.Model):
    __tablename__ = 'referentielinstruments'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    type = db.Column(db.String(50))
    fond_id = db.Column(db.Integer, db.ForeignKey('referentielfonds.id'))
    fond = db.relationship('Fonds', back_populates='instruments')

class Position(db.Model):
    __tablename__ = 'positions'
    id = db.Column(db.Integer, primary_key=True)
    instrument_id = db.Column(db.Integer, db.ForeignKey('referentielinstruments.id'))
    fond_id = db.Column(db.Integer, db.ForeignKey('referentielfonds.id'))
    poids = db.Column(db.Numeric(5, 2))
    instrument = db.relationship('Instrument')
    fond = db.relationship('Fonds')

#Routes
@app.route('/')
def index():
    return "Lancement de l'application Flask Portfolio Tracker réussi."

@app.route('/fonds')
def show_fonds():
    fonds = Fonds.query.all()
    return render_template('fonds.html', fonds=fonds)

@app.route('/instruments')
def show_instruments():
    instruments = Instrument.query.all()
    return render_template('instruments.html', instruments=instruments)

@app.route('/positions/<int:fond_id>')
def show_positions(fond_id):
    positions = Position.query.filter_by(fond_id=fond_id).all()
    total_poids = sum(position.poids for position in positions)
    return render_template('positions.html', positions=positions, total_poids=total_poids)

if __name__ == '__main__':
    #Debug Mode (On/Off)
    app.run(debug=True)