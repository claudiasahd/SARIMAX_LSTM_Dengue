################################### SARIMAX #####################################

# Carregar as bibliotecas necessárias
library(forecast)
library(tseries)

# Definir o diretório de trabalho e carregar os dados
setwd("C:\\Users\\Claudia\\OneDrive\\Área de Trabalho\\Mestrado\\Banco de dados\\")
dados=read.csv2("Banco de dados_dengue_semana_OK.csv")

# Ajustar o modelo SARIMAX para a Temperatura Mínima
modelo1 = Arima(dados$casos, order = c(2,1,8),
                season = list(order = c(1,1,1), freq = 52),
                xreg = dados$tempmin)
summary(modelo1)

# Ajustar o modelo SARIMAX para a Temperatura Média
modelo2 = Arima(dados$casos, order = c(2,1,8),
                season = list(order = c(1,1,1), freq = 52),
                xreg = dados$tempmed)
summary(modelo2)

# Ajustar o modelo SARIMAX para a Temperatura Máxima
modelo3 = Arima(dados$casos, order = c(2,1,8),
                season = list(order = c(1,1,1), freq = 52),
                xreg = dados$tempmax)
summary(modelo3)

# Ajustar o modelo SARIMAX para a Umidade Média
modelo4 = Arima(dados$casos, order = c(2,1,8),
                season = list(order = c(1,1,1), freq = 52),
                xreg = dados$umidmed)
summary(modelo4)

# Ajustar o modelo SARIMAX para a Umidade Máxima
modelo5 = Arima(dados$casos, order = c(2,1,8),
                season = list(order = c(1,1,1), freq = 52),
                xreg = dados$umidmax)
summary(modelo5)

# Ajustar o modelo SARIMAX para a Umidade Mínima
modelo6 = Arima(dados$casos, order = c(2,1,8),
                season = list(order = c(1,1,1), freq = 52),
                xreg = dados$umidmin)
summary(modelo6)

# Ajustar o modelo SARIMAX para a Precipitação
modelo_precipitacao = Arima(dados$casos, order = c(2,1,8),
                            season = list(order = c(1,1,1), freq = 52),
                            xreg = dados$precipitacao)
summary(modelo_precipitacao)

# Comparar os AIC e BIC dos modelos ajustados
resultados <- data.frame(
  Modelo = c("Modelo com tempmin", "Modelo com tempmed", "Modelo com tempmax", 
             "Modelo com umidmed", "Modelo com umidmax", "Modelo com umidmin", 
             "Modelo com precipitacao"),
  AIC = c(AIC(modelo1), AIC(modelo2), AIC(modelo3), AIC(modelo4), 
          AIC(modelo5), AIC(modelo6), AIC(modelo_precipitacao)),
  BIC = c(BIC(modelo1), BIC(modelo2), BIC(modelo3), BIC(modelo4),
          BIC(modelo5), BIC(modelo6), BIC(modelo_precipitacao))
)

# Exibindo os resultados
print(resultados)

# Identificando o modelo com o menor AIC e BIC
melhor_modelo_AIC <- resultados$Modelo[which.min(resultados$AIC)]
melhor_modelo_BIC <- resultados$Modelo[which.min(resultados$BIC)]

cat("Modelo com o menor AIC: ", melhor_modelo_AIC, "\n")
cat("Modelo com o menor BIC: ", melhor_modelo_BIC, "\n")

# Gerar previsões com o melhor modelo
melhor_modelo <- modelo_precipitacao  # Substitua pelo melhor modelo identificado
previsao_sarimax <- forecast(melhor_modelo, xreg = dados$precipitacao, h = 20)  # Previsões para 20 períodos à frente

# Plotando os resultados com uma linha de previsão mensal
plot(previsao_sarimax, main = "Previsão de Casos com Modelo SARIMAX",
     xlab = "Ano", ylab = "Casos de Dengue",
     col = "blue", lwd = 2, lty = 1)  # Valor real em azul

# Adicionando a linha de previsão em vermelho e mais espessa
lines(previsao_sarimax$mean, col = "red", lwd = 2, lty = 2)

# Adicionando a legenda no canto superior direito
legend("topright", legend = c("Série Original", "Previsão SARIMAX"),
       col = c("blue", "red"), lty = c(1, 2), lwd = 2, cex = 0.8)




############# Segundo Modelo SARIMAX / Este foi um SUCESSOOOOOO!!!!!! ##############################


################################## SARIMAX ##############################


# Definir diretório de trabalho e carregar os dados
setwd("C:\\Users\\Claudia\\OneDrive\\Área de Trabalho\\Mestrado\\Banco de dados\\")
dados=read.csv2("Banco de dados_dengue_semana_OK.csv")

# Ajustar os modelos SARIMA com diferentes covariáveis
modelo1 = Arima(dados$casos, order = c(2,1,8),
                seasonal = list(order = c(1,1,1), freq = 52),
                xreg = dados$tempmin)

modelo2 = Arima(dados$casos, order = c(2,1,8),
                seasonal = list(order = c(1,1,1), freq = 52),
                xreg = dados$tempmed)

modelo3 = Arima(dados$casos, order = c(2,1,8),
                seasonal = list(order = c(1,1,1), freq = 52),
                xreg = dados$tempmax)

modelo4 = Arima(dados$casos, order = c(2,1,8),
                seasonal = list(order = c(1,1,1), freq = 52),
                xreg = dados$umidmin)

modelo5 = Arima(dados$casos, order = c(2,1,8),
                seasonal = list(order = c(1,1,1), freq = 52),
                xreg = dados$umidmed)

modelo6 = Arima(dados$casos, order = c(2,1,8),
                seasonal = list(order = c(1,1,1), freq = 52),
                xreg = dados$umidmax)

modelo7 = Arima(dados$casos, order = c(2,1,8),
                seasonal = list(order = c(1,1,1), freq = 52),
                xreg = dados$precipitacao)

# Obter o resumo de cada modelo
summary(modelo1)
summary(modelo2)
summary(modelo3)
summary(modelo4)
summary(modelo5)
summary(modelo6)
summary(modelo7)

# Criando o dataframe com as métricas dos modelos
resultados <- data.frame(
  Modelo = c("Modelo com tempmin", "Modelo com tempmed", "Modelo com tempmax", "Modelo com umidmin",
             "Modelo com umidmed", "Modelo com umidmax", "Modelo com precipitacao"),
  AICc = c(7701.81, 7701.67, 7701.67, 7700.36, 7699.66, 7698.69, 7701.85),
  Estimativa = c(0.4416, 0.9998, 0.8976, -0.4992, -0.7312, -1.0944, -0.0107),
  Erro_Padrao = c(2.3332, 2.3291, 1.8488, 0.4118, 0.5105, 0.6177, 0.3335)
)

# Exibindo os resultados para comparação
print(resultados)

# Identificando o modelo com o menor AIC e BIC
melhor_modelo_AIC <- resultados$Modelo[which.min(resultados$AICc)]
cat("Modelo com o menor AIC: ", melhor_modelo_AIC, "\n")

# Identificando o modelo com a melhor estimativa
melhor_modelo_estimativa <- resultados$Modelo[which.max(resultados$Estimativa)]
cat("Modelo com a melhor estimativa: ", melhor_modelo_estimativa, "\n")

# Identificando o modelo com o menor erro padrão
melhor_modelo_erro <- resultados$Modelo[which.min(resultados$Erro_Padrao)]
cat("Modelo com o menor erro padrão: ", melhor_modelo_erro, "\n")




###################### Modelo Preditivo com SARIMAX #####################
# Carregar a biblioteca necessária
library(forecast)

# Definir o diretório de trabalho e carregar os dados
setwd("C:\\Users\\Claudia\\OneDrive\\Área de Trabalho\\Mestrado\\Banco de dados\\")
dados=read.csv2("Banco de dados_dengue_semana_OK.csv")

# Ajuste do modelo SARIMAX
modelo1 = Arima(dados$casos, order = c(2,1,2),  # Definir a ordem do ARIMA (p,d,q)
                season = list(order = c(1,1,1), freq = 52),  # Sazonalidade de 12 meses
                xreg = dados$umidmax )  # Adicionar covariáveis, como a umidade máxima (melhor modelo/ menor AIC)

# Ajuste do modelo 2 SARIMAX
modelo2 = Arima(dados$casos, order = c(2,1,8),  # Definir a ordem do ARIMA (p,d,q)
                season = list(order = c(1,1,1), freq = 52),  # Sazonalidade de 12 meses
                xreg = dados$umidmax )  # Adicionar covariáveis, como a umidade máxima (melhor modelo/ menor AIC)

# Gerar previsões para o próximo período (ajustar conforme a necessidade de previsão)
previsao <- predict(modelo2, n.ahead = 20, newxreg = dados$umidmax[(length(dados$umidmax) - 19):length(dados$umidmax)], se.fit = TRUE)

# Plotando os resultados
plot(dados$casos, type = "l", col = "black", lwd = 0.5, xlab = "Amostra", ylab = "Casos",
     main = "Previsão de casos com Modelo SARIMAX ", xaxt = "n")
lines(c(dados$casos, previsao$pred), col = "red", lwd = 2, lty = 2)  # Previsão em laranja (linha pontilhada mais grossa)

# Ajustando o eixo X para amostras (substituir pela data se necessário)
axis(1, at = seq(1, length(dados$casos), by = 52), labels = seq(2013, 2025, by = 1))  # Ajuste do eixo X para mostrar os anos

# Adicionando legenda na lateral direita, fora do gráfico
legend("topleft", legend = c("Série Original", "Modelo Preditivo"), col = c("black", "red"), 
       lty = c(1, 2), lwd = c(2, 1), cex = 0.8)

