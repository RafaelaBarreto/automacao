Add-Type -AssemblyName System.Windows.Forms

$hostAlvo = "8.8.8.8"  # Pode ser qualquer IP ou site
$ping = Test-Connection -ComputerName $hostAlvo -Count 1 -ErrorAction SilentlyContinue

if ($ping) {
    $tempo = $ping.ResponseTime

    Write-Host "Tempo de resposta: $tempo ms"

    if ($tempo -gt 100) {
        [System.Windows.Forms.MessageBox]::Show("⚠️ Ping alto detectado: $tempo ms", "Alerta de Latência", 'OK', 'Warning')
    } else {
        Write-Host "Tudo ok! Latência normal."
    }
} else {
    [System.Windows.Forms.MessageBox]::Show("❌ Falha ao pingar $hostAlvo", "Erro de Conexão", 'OK', 'Error')
}
