## Predição de casos de dengue em Londrina-PR usando métodos de análise de séries temporais: SARIMAX e Deep Learning com LSTM.
## 🎓 Produto da dissertação de mestrado

Este estudo é parte da dissertação de **Claudia Sahd**, desenvolvida no **Programa de Pós-Graduação em Bioinformática (PPGBIOINFO)** da Universidade Tecnológica Federal do Paraná, sob orientação da **Profª. Dra. Elisângela Lizzi**.

---

## 🧾 Descrição do estudo

**Dengue** é uma arbovirose transmitida pelo mosquito *Aedes aegypti* e representa uma preocupação constante de saúde pública em regiões tropicais e subtropicais. A incidência da doença está fortemente associada a fatores climáticos, como **temperatura** e **precipitação**, que favorecem o desenvolvimento do vetor.

Este estudo tem como objetivo prever a incidência de casos de dengue no município de **Londrina-PR**, entre os anos de **2013 e 2024**, por meio de modelos preditivos baseados em **análise de séries temporais**.

---

## 📊 Base de dados

- **Casos semanais de dengue**: obtidos do sistema [InfoDengue](https://info.dengue.mat.br/)
- **Variáveis climáticas**: temperatura, umidade relativa e precipitação

---

## 🧠 Metodologia

Duas abordagens foram aplicadas para modelagem e predição:

### 1. SARIMAX — *Seasonal ARIMA with Exogenous Variables*
Modelo estatístico tradicional com inclusão de variáveis exógenas (climáticas), adequado para séries com estrutura sazonal.  
**Modelo final:** `SARIMAX(2,1,8)(1,1,1)[52]`  
- Sazonalidade semanal (s = 52)
- Covariável com melhor desempenho: **temperatura mínima**
- Resultado: excelente ajuste aos dados e previsões com boa acurácia

### 2. LSTM — *Long Short-Term Memory*
Rede neural recorrente profunda, especializada em capturar dependências temporais complexas.  
- Utilizada como comparação ao modelo estatístico
- Resultado: bom desempenho na captação da sazonalidade, porém com **maior volatilidade nas previsões**

---

## 📈 Resultados principais

- O modelo **SARIMAX**, integrado às variáveis climáticas, apresentou **melhor desempenho geral** na previsão de casos de dengue, com previsões mais estáveis e acuradas.
- As redes **LSTM** demonstraram potencial promissor, sobretudo para detectar padrões não lineares e complexos, mas ainda exigem aprimoramento quanto à estabilidade preditiva.
- O uso de dados climáticos como **covariáveis exógenas** demonstrou ser crucial para aumentar o poder preditivo dos modelos.

---

## ✅ Conclusão

Este estudo evidencia que modelos estatísticos como o SARIMAX, quando combinados com variáveis ambientais, constituem uma ferramenta eficaz para apoiar a **vigilância epidemiológica e o planejamento de ações preventivas**.  
Além disso, destaca o **potencial das redes neurais LSTM** como alternativas robustas, desde que calibradas adequadamente para reduzir a variabilidade preditiva.

---

## 🛠️ Tecnologias utilizadas

- Python
  - `statsmodels`, `pandas`, `numpy`, `scikit-learn`, `matplotlib`
  - `TensorFlow` / `Keras` para construção do modelo LSTM
- Jupyter Notebooks
- Visualizações gráficas com `matplotlib` e `seaborn`

---

## 👩‍🏫 Autoria e orientação

- **Mestranda:** Claudia Sahd  
- **Orientadora:** Profª. Dra. Elisângela Lizzi  
- **Programa:** Pós-Graduação em Bioinformática – UTFPR Cornélio Procópio  

---

## 📬 Contato

Para dúvidas ou colaborações:

- elisangelalizzi@utfpr.edu.br  
- [LinkedIn da professora Elisângela Lizzi](https://www.linkedin.com/in/elisangelalizzi)

