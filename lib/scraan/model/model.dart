//Model ************************
class Enderco {
  var cep;
  var logradouro;
  var complemento;
  var bairro;
  var localidade;
  var uf;
  var ibge;
  Enderco(
      {this.cep,
      this.bairro,
      this.complemento,
      this.ibge,
      this.localidade,
      this.logradouro,
      this.uf});

  Enderco fromJson(Map<String, dynamic> json) {
    return Enderco(
        cep: json["cep"],
        bairro: json["bairro"],
        complemento: json["complemento"],
        ibge: json["ibge"],
        localidade: json["localidade"],
        logradouro: json["logradouro"],
        uf: json["uf"]);
  }

  @override
  String toString() {
    return 'sua cidade é $localidade e seu $bairro é';
  }
}
