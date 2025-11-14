<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tradutor MK</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'gemini-blue': '#4A90E2',
                        'gemini-dark': '#1F2937',
                        'gemini-light': '#F3F4F6',
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
        /* Scrollbar styling for a cleaner look */
        textarea::-webkit-scrollbar { width: 6px; }
        textarea::-webkit-scrollbar-thumb { background-color: #9CA3AF; border-radius: 3px; }
        textarea::-webkit-scrollbar-track { background-color: #E5E7EB; }
    </style>
</head>
<body class="bg-gray-100 min-h-screen p-4 flex items-center justify-center font-sans">

    <div id="app" class="w-full max-w-4xl bg-white shadow-2xl rounded-xl p-6 md:p-8 lg:p-10">

        <!-- Título e Logo -->
        <header class="text-center mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold text-gemini-dark flex items-center justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 mr-3 text-gemini-blue" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="M12 5l7 7-7 7"/></svg>
                Tradutor MK
            </h1>
            <p class="text-sm text-gray-500 mt-1">Converse com qualquer pessoa, em qualquer lugar.</p>
        </header>

        <!-- Controles de Linguagem e Ação -->
        <div class="grid grid-cols-1 md:grid-cols-5 gap-4 mb-6 items-center">
            
            <!-- Idioma de Origem -->
            <div class="md:col-span-2">
                <label for="source-lang" class="block text-sm font-medium text-gray-700 mb-1">Traduzir de:</label>
                <select id="source-lang" class="w-full p-2 border border-gray-300 rounded-lg shadow-sm focus:ring-gemini-blue focus:border-gemini-blue appearance-none bg-white">
                    <option value="pt" selected>Português</option>
                    <option value="en">Inglês</option>
                    <option value="es">Espanhol</option>
                    <option value="fr">Francês</option>
                    <option value="de">Alemão</option>
                    <option value="it">Italiano</option>
                    <option value="ja">Japonês</option>
                </select>
            </div>

            <!-- Botão de Inverter -->
            <div class="md:col-span-1 flex justify-center">
                <button id="swap-btn" class="p-3 bg-gray-200 text-gemini-dark rounded-full hover:bg-gemini-blue hover:text-white transition duration-200 transform hover:scale-105 shadow-md" title="Inverter Idiomas">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14m-5-7l5 5 5-5m-5-9l-5 5 5 5"/></svg>
                </button>
            </div>

            <!-- Idioma de Destino -->
            <div class="md:col-span-2">
                <label for="target-lang" class="block text-sm font-medium text-gray-700 mb-1">Para:</label>
                <select id="target-lang" class="w-full p-2 border border-gray-300 rounded-lg shadow-sm focus:ring-gemini-blue focus:border-gemini-blue appearance-none bg-white">
                    <option value="en" selected>Inglês</option>
                    <option value="pt">Português</option>
                    <option value="es">Espanhol</option>
                    <option value="fr">Francês</option>
                    <option value="de">Alemão</option>
                    <option value="it">Italiano</option>
                    <option value="ja">Japonês</option>
                </select>
            </div>
        </div>

        <!-- Área de Entrada de Texto -->
        <div class="mb-6">
            <label for="input-text" class="block text-lg font-semibold text-gemini-dark mb-2">Seu Texto Original</label>
            <textarea id="input-text" rows="5" placeholder="Digite o texto que deseja traduzir aqui..." class="w-full p-4 border-2 border-gemini-blue rounded-lg focus:ring-2 focus:ring-blue-400 resize-none shadow-inner transition duration-150"></textarea>
            <p id="input-error" class="text-sm text-red-500 mt-1 hidden">Por favor, digite algum texto para traduzir.</p>
        </div>

        <!-- Botão de Tradução -->
        <div class="mb-8">
            <button id="translate-btn" class="w-full py-3 px-4 bg-gemini-blue text-white font-bold text-lg rounded-xl shadow-lg hover:bg-blue-600 transition duration-300 transform hover:-translate-y-0.5 disabled:opacity-50 flex items-center justify-center" disabled>
                <svg id="translate-icon" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12a9 9 0 0 0-9-9 9.75 9.75 0 0 0-6.74 2.75l-2.75 2.75m18 0l-2.75-2.75m-15 0a9 9 0 0 0 9 9 9.75 9.75 0 0 0 6.74-2.75l2.75-2.75m-18 0l2.75 2.75"/></svg>
                <span id="translate-text">Traduzir</span>
                <div id="loading-spinner" class="hidden w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin ml-2"></div>
            </button>
        </div>

        <!-- Área de Saída de Texto -->
        <div>
            <label for="output-text" class="block text-lg font-semibold text-gemini-dark mb-2">Tradução</label>
            <div class="relative">
                <textarea id="output-text" rows="5" placeholder="Sua tradução aparecerá aqui..." class="w-full p-4 border-2 border-gray-300 bg-gemini-light rounded-lg resize-none shadow-inner" readonly></textarea>
                <button id="copy-btn" class="absolute top-3 right-3 p-2 bg-white text-gray-600 rounded-lg hover:bg-gray-200 transition duration-200 shadow-md" title="Copiar Tradução" disabled>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="13" height="13" x="9" y="9" rx="2" ry="2"/><path d="M5 15V5c0-1.1.9-2 2-2h8"/></svg>
                </button>
                <span id="copy-message" class="absolute top-1/2 right-4 -translate-y-1/2 px-2 py-1 bg-green-500 text-white text-xs rounded-lg opacity-0 transition-opacity duration-300 pointer-events-none">Copiado!</span>
            </div>
            
            <!-- Seção de Fontes (Grounding) -->
            <div id="sources-container" class="mt-4 hidden p-3 bg-blue-50 border-l-4 border-gemini-blue rounded-md">
                <p class="font-medium text-gemini-dark text-sm mb-1">Fontes:</p>
                <ul id="sources-list" class="list-disc list-inside text-gray-600 text-xs space-y-1">
                    <!-- Fontes serão injetadas aqui -->
                </ul>
            </div>
        </div>
        
        <!-- Modal para Erros e Mensagens (Substituindo alert()) -->
        <div id="modal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50 p-4">
            <div class="bg-white rounded-lg p-6 w-full max-w-sm shadow-2xl">
                <h3 id="modal-title" class="text-xl font-bold text-red-600 mb-3">Erro de Tradução</h3>
                <p id="modal-message" class="text-gray-700">Ocorreu um erro ao processar sua solicitação.</p>
                <button id="modal-close-btn" class="mt-4 w-full py-2 bg-gemini-blue text-white font-semibold rounded-lg hover:bg-blue-600 transition duration-200">Entendi</button>
            </div>
        </div>

    </div>

    <script type="module">
        const sourceLangSelect = document.getElementById('source-lang');
        const targetLangSelect = document.getElementById('target-lang');
        const swapBtn = document.getElementById('swap-btn');
        const inputTextarea = document.getElementById('input-text');
        const outputTextarea = document.getElementById('output-text');
        const translateBtn = document.getElementById('translate-btn');
        const loadingSpinner = document.getElementById('loading-spinner');
        const translateText = document.getElementById('translate-text');
        const translateIcon = document.getElementById('translate-icon');
        const copyBtn = document.getElementById('copy-btn');
        const copyMessage = document.getElementById('copy-message');
        const inputError = document.getElementById('input-error');
        const sourcesContainer = document.getElementById('sources-container');
        const sourcesList = document.getElementById('sources-list');
        
        // Modal elements
        const modal = document.getElementById('modal');
        const modalTitle = document.getElementById('modal-title');
        const modalMessage = document.getElementById('modal-message');
        const modalCloseBtn = document.getElementById('modal-close-btn');

        // Configurações da API
        const apiKey = "" // A chave API será fornecida pelo ambiente em tempo de execução.
        const apiUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-preview-09-2025:generateContent?key=${apiKey}`;
        const MAX_RETRIES = 5;
        
        // --- Funções de Utilidade ---

        // Função para mostrar o modal de erro
        function showModal(title, message) {
            modalTitle.textContent = title;
            modalMessage.textContent = message;
            modal.classList.remove('hidden');
            modal.classList.add('flex');
        }

        // Função para esconder o modal
        modalCloseBtn.onclick = () => {
            modal.classList.add('hidden');
            modal.classList.remove('flex');
        };

        // Função para habilitar/desabilitar o botão de tradução
        function updateTranslateButtonState() {
            translateBtn.disabled = inputTextarea.value.trim() === '';
            copyBtn.disabled = outputTextarea.value.trim() === '';
        }

        // Função para alternar os idiomas
        swapBtn.addEventListener('click', () => {
            const sourceValue = sourceLangSelect.value;
            sourceLangSelect.value = targetLangSelect.value;
            targetLangSelect.value = sourceValue;
            // Se houver texto, tenta traduzir novamente com as novas configurações
            if (inputTextarea.value.trim() !== '') {
                translateTextFromInput();
            }
        });

        // Event listener para habilitar/desabilitar o botão de tradução
        inputTextarea.addEventListener('input', () => {
            updateTranslateButtonState();
            inputError.classList.add('hidden');
        });

        // Event listener para o botão de copiar
        copyBtn.addEventListener('click', () => {
            const textToCopy = outputTextarea.value;
            if (textToCopy) {
                // Usa o método preferido para copiar texto
                const tempInput = document.createElement('textarea');
                tempInput.value = textToCopy;
                document.body.appendChild(tempInput);
                tempInput.select();
                document.execCommand('copy');
                document.body.removeChild(tempInput);

                // Mostra mensagem de "Copiado!"
                copyMessage.classList.remove('opacity-0');
                copyMessage.classList.add('opacity-100');
                setTimeout(() => {
                    copyMessage.classList.remove('opacity-100');
                    copyMessage.classList.add('opacity-0');
                }, 1500);
            }
        });
        
        // Função de backoff exponencial para retentar a chamada da API
        async function fetchWithRetry(url, options, maxRetries) {
            for (let i = 0; i < maxRetries; i++) {
                try {
                    const response = await fetch(url, options);
                    if (response.status !== 429) { // Não é erro de rate limit, retorna
                        return response;
                    }
                    // Se for 429 (Rate Limit), espera e tenta novamente
                    const delay = Math.pow(2, i) * 1000 + Math.random() * 1000;
                    await new Promise(resolve => setTimeout(resolve, delay));
                } catch (error) {
                    // Erros de rede/conexão
                    if (i === maxRetries - 1) throw error; 
                    const delay = Math.pow(2, i) * 1000 + Math.random() * 1000;
                    await new Promise(resolve => setTimeout(resolve, delay));
                }
            }
            throw new Error("Falha na chamada da API após várias retentativas.");
        }


        // --- Lógica Principal de Tradução ---

        async function translateTextFromInput() {
            const inputText = inputTextarea.value.trim();
            const sourceLang = sourceLangSelect.value;
            const targetLang = targetLangSelect.value;

            if (inputText === '') {
                inputError.classList.remove('hidden');
                return;
            }

            // Ativar estado de carregamento
            translateBtn.disabled = true;
            translateText.textContent = 'Traduzindo...';
            translateIcon.classList.add('hidden');
            loadingSpinner.classList.remove('hidden');
            outputTextarea.value = '';
            sourcesContainer.classList.add('hidden');
            sourcesList.innerHTML = '';


            try {
                // System Instruction para guiar o modelo
                const systemPrompt = "Você é um tradutor profissional, preciso e fluente. Traduza o texto fornecido do idioma de origem para o idioma de destino exatamente como solicitado. Não adicione frases introdutórias, explicações, ou análises. Apenas apresente o texto traduzido.";
                
                // Query do usuário
                const userQuery = `Traduza este texto de ${sourceLang} para ${targetLang}: "${inputText}"`;
                
                // Construção do Payload
                const payload = {
                    contents: [{ parts: [{ text: userQuery }] }],
                    
                    // Usar Google Search grounding para garantir precisão contextual
                    tools: [{ "google_search": {} }], 
                    
                    systemInstruction: {
                        parts: [{ text: systemPrompt }]
                    },
                };
                
                const options = {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                };

                const response = await fetchWithRetry(apiUrl, options, MAX_RETRIES);
                
                if (!response.ok) {
                    const errorJson = await response.json();
                    throw new Error(`Erro da API: ${response.status} - ${errorJson.error?.message || 'Erro desconhecido.'}`);
                }

                const result = await response.json();
                const candidate = result.candidates?.[0];
                
                let translatedText = "Não foi possível obter a tradução.";
                let sources = [];

                if (candidate && candidate.content?.parts?.[0]?.text) {
                    translatedText = candidate.content.parts[0].text;
                    
                    // Extrair fontes de Grounding, se disponíveis
                    const groundingMetadata = candidate.groundingMetadata;
                    if (groundingMetadata && groundingMetadata.groundingAttributions) {
                        sources = groundingMetadata.groundingAttributions
                            .map(attribution => ({
                                uri: attribution.web?.uri,
                                title: attribution.web?.title,
                            }))
                            .filter(source => source.uri && source.title);
                    }
                }
                
                outputTextarea.value = translatedText;
                
                // Exibir fontes, se houver
                if (sources.length > 0) {
                    sourcesContainer.classList.remove('hidden');
                    sources.forEach(source => {
                        const li = document.createElement('li');
                        const a = document.createElement('a');
                        a.href = source.uri;
                        a.target = '_blank';
                        a.rel = 'noopener noreferrer';
                        a.className = 'hover:underline text-blue-700';
                        a.textContent = source.title;
                        li.appendChild(a);
                        sourcesList.appendChild(li);
                    });
                }


            } catch (error) {
                console.error("Erro na tradução:", error);
                outputTextarea.value = "Desculpe, ocorreu um erro ao traduzir. Por favor, tente novamente.";
                showModal("Erro de Conexão/API", error.message);

            } finally {
                // Desativar estado de carregamento
                translateBtn.disabled = false;
                translateText.textContent = 'Traduzir';
                translateIcon.classList.remove('hidden');
                loadingSpinner.classList.add('hidden');
                updateTranslateButtonState(); // Atualiza o estado do botão de copiar
            }
        }

        // Adicionar o listener de click ao botão de tradução
        translateBtn.addEventListener('click', translateTextFromInput);
        
        // Adicionar event listener para o Enter key no textarea (para conveniência)
        inputTextarea.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault(); // Impede a quebra de linha
                translateTextFromInput();
            }
        });

        // Inicializar o estado dos botões ao carregar
        window.onload = updateTranslateButtonState;

    </script>
</body>
</html>
