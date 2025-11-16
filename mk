<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tradutor MK | Login de Acesso</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'primary-gold': '#D4AF37', /* Dourado da logo */
                        'secondary-silver': '#C0C0C0', /* Prata da logo */
                        'dark-bg': '#0A0A0A', /* Preto mais suave para o fundo */
                        'light-text': '#E0E0E0', /* Texto claro para contraste */
                        'white-contrast': '#FFFFFF', /* Branco puro para detalhes */
                        'input-bg': '#1A1A1A', /* Fundo para inputs em modo escuro */
                        'border-light': '#333333', /* Borda mais clara para contraste sutil */
                    },
                    fontFamily: {
                        sans: ['Montserrat', 'sans-serif'], /* Fonte mais elegante */
                        serif: ['Playfair Display', 'serif'], /* Fonte complementar, se necessário */
                    },
                    boxShadow: {
                        'gold-glow': '0 0 15px rgba(212, 175, 55, 0.6)',
                        'silver-glow': '0 0 15px rgba(192, 192, 192, 0.6)',
                        'xl-dark': '0 20px 25px -5px rgba(0, 0, 0, 0.4), 0 10px 10px -5px rgba(0, 0, 0, 0.2)',
                    }
                }
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap');
        /* Scrollbar styling for a cleaner look */
        textarea::-webkit-scrollbar { width: 8px; }
        textarea::-webkit-scrollbar-thumb { background-color: #444444; border-radius: 4px; }
        textarea::-webkit-scrollbar-track { background-color: #222222; }
        
        body {
            background-image: linear-gradient(135deg, #121212 0%, #000000 100%);
        }
        .app-container {
            border-radius: 1.5rem; /* Mais arredondado */
            box-shadow: 0 10px 30px rgba(0,0,0,0.5), 0 0 60px rgba(212, 175, 55, 0.15); /* Sombra mais profunda com brilho dourado sutil */
        }
        .btn-primary {
            background-image: linear-gradient(to right, #D4AF37 0%, #A27F1A 100%);
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            box-shadow: 0 5px 15px rgba(212, 175, 55, 0.4);
            transform: translateY(-2px);
        }
        .select-custom {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='none'%3e%3cpath d='M7 7l3-3 3 3m0 6l-3 3-3-3' stroke='%23C0C0C0' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 1.5em 1.5em;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
    </style>
</head>
<body class="dark-bg min-h-screen p-6 flex items-center justify-center font-sans text-light-text">

    <!-- Tela de Login (Aparece primeiro) -->
    <div id="login-screen" class="w-full max-w-sm bg-gradient-to-br from-gray-900 to-black p-8 md:p-10 rounded-2xl border border-gray-800 shadow-xl-dark app-container">
        <header class="text-center mb-8">
            <div class="mb-4">
                <!-- Imagem da Logo da Equipe Ouro Branco -->
                <img src="https://i.imgur.com/CAoyBbB.png" onerror="this.onerror=null; this.src='https://placehold.co/128x128/0A0A0A/D4AF37?text=LOGO';" alt="Equipe Ouro Branco Logo" class="mx-auto h-20 sm:h-24 object-contain filter drop-shadow-lg"> 
            </div>
            <h1 class="text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-primary-gold to-secondary-silver leading-tight mb-2">
                Acesso Restrito
            </h1>
            <p class="text-sm text-gray-400 font-light">Insira suas credenciais para acessar o Tradutor MK.</p>
        </header>

        <form id="login-form">
            <div class="mb-4">
                <label for="username" class="block text-sm font-medium text-gray-300 mb-2">Login</label>
                <input type="text" id="username" class="w-full p-3 bg-input-bg border border-border-light rounded-lg shadow-inner focus:ring-primary-gold focus:border-primary-gold text-light-text transition duration-200" placeholder="tradutormk" required>
            </div>
            <div class="mb-6">
                <label for="password" class="block text-sm font-medium text-gray-300 mb-2">Senha</label>
                <input type="password" id="password" class="w-full p-3 bg-input-bg border border-border-light rounded-lg shadow-inner focus:ring-primary-gold focus:border-primary-gold text-light-text transition duration-200" placeholder="••••••••" required>
            </div>
            <p id="login-error-message" class="text-center text-red-400 mb-6 hidden">Login ou senha incorretos.</p>
            
            <button type="submit" class="btn-primary w-full py-3 px-6 text-white-contrast font-bold rounded-lg shadow-lg hover:shadow-gold-glow transition duration-300 transform hover:-translate-y-0.5">
                Entrar
            </button>
        </form>
    </div>

    <!-- Interface do Tradutor (Inicialmente oculta) -->
    <div id="app" class="app-container w-full max-w-4xl bg-gradient-to-br from-gray-900 to-black p-8 md:p-10 lg:p-12 border border-gray-800 hidden">

        <!-- Título e Logo --><header class="text-center mb-10">
            <div class="mb-6">
                <!-- Imagem da Logo da Equipe Ouro Branco -->
                <img src="https://i.imgur.com/CAoyBbB.png" onerror="this.onerror=null; this.src='https://placehold.co/128x128/0A0A0A/D4AF37?text=LOGO';" alt="Equipe Ouro Branco Logo" class="mx-auto h-24 sm:h-32 object-contain filter drop-shadow-lg"> 
            </div>
            <h1 class="text-4xl md:text-5xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-primary-gold to-secondary-silver leading-tight mb-2">
                Tradutor MK
            </h1>
            <p class="text-lg text-gray-400 font-light">Comunique-se globalmente com a Equipe Ouro Branco.</p>
        </header>

        <!-- Controles de Linguagem e Ação --><div class="grid grid-cols-1 md:grid-cols-5 gap-6 mb-8 items-center">
            
            <!-- Idioma de Origem --><div class="md:col-span-2">
                <label for="source-lang" class="block text-sm font-medium text-gray-300 mb-2">Traduzir de:</label>
                <select id="source-lang" class="select-custom w-full p-3 bg-input-bg border border-border-light rounded-xl shadow-inner focus:ring-primary-gold focus:border-primary-gold text-light-text transition duration-200">
                    <option value="af">Africâner</option>
                    <option value="sq">Albanês</option>
                    <option value="de">Alemão</option>
                    <option value="ar">Árabe</option>
                    <option value="hy">Armênio</option>
                    <option value="az">Azeri</option>
                    <option value="bn">Bengali</option>
                    <option value="bg">Búlgaro</option>
                    <option value="ca">Catalão</option>
                    <option value="zh">Chinês (Mandarim)</option>
                    <option value="ko">Coreano</option>
                    <option value="hr">Croata</option>
                    <option value="da">Dinamarquês</option>
                    <option value="sk">Eslovaco</option>
                    <option value="es">Espanhol</option>
                    <option value="tl">Filipino (Tagalo)</option>
                    <option value="fi">Finlandês</option>
                    <option value="fr">Francês</option>
                    <option value="cy">Galês</option>
                    <option value="el">Grego</option>
                    <option value="he">Hebraico</option>
                    <option value="hi">Hindi</option>
                    <option value="nl">Holandês</option>
                    <option value="hu">Húngaro</option>
                    <option value="id">Indonésio</option>
                    <option value="en">Inglês</option>
                    <option value="ga">Irlandês</option>
                    <option value="is">Islandês</option>
                    <option value="it">Italiano</option>
                    <option value="ja">Japonês</option>
                    <option value="ms">Malaio</option>
                    <option value="no">Norueguês</option>
                    <option value="fa">Persa (Farsi)</option>
                    <option value="pl">Polonês</option>
                    <option value="pt" selected>Português</option>
                    <option value="ro">Romeno</option>
                    <option value="ru">Russo</option>
                    <option value="sr">Sérvio</option>
                    <option value="sv">Sueco</option>
                    <option value="th">Tailandês</option>
                    <option value="cs">Tcheco</option>
                    <option value="tr">Turco</option>
                    <option value="uk">Ucraniano</option>
                    <option value="vi">Vietnamita</option>
                    <option value="zu">Zulu</option>
                </select>
            </div>

            <!-- Botão de Inverter --><div class="md:col-span-1 flex justify-center">
                <button id="swap-btn" class="p-3 bg-gray-700 text-secondary-silver rounded-full hover:bg-primary-gold hover:text-white-contrast transition duration-300 transform hover:scale-110 shadow-lg" title="Inverter Idiomas">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14m-5-7l5 5 5-5m-5-9l-5 5 5 5"/></svg>
                </button>
            </div>

            <!-- Idioma de Destino --><div class="md:col-span-2">
                <label for="target-lang" class="block text-sm font-medium text-gray-300 mb-2">Para:</label>
                <select id="target-lang" class="select-custom w-full p-3 bg-input-bg border border-border-light rounded-xl shadow-inner focus:ring-primary-gold focus:border-primary-gold text-light-text transition duration-200">
                    <option value="af">Africâner</option>
                    <option value="sq">Albanês</option>
                    <option value="de">Alemão</option>
                    <option value="ar">Árabe</option>
                    <option value="hy">Armênio</option>
                    <option value="az">Azeri</option>
                    <option value="bn">Bengali</option>
                    <option value="bg">Búlgaro</option>
                    <option value="ca">Catalão</option>
                    <option value="zh">Chinês (Mandarim)</option>
                    <option value="ko">Coreano</option>
                    <option value="hr">Croata</option>
                    <option value="da">Dinamarquês</option>
                    <option value="sk">Eslovaco</option>
                    <option value="es">Espanhol</option>
                    <option value="tl">Filipino (Tagalo)</option>
                    <option value="fi">Finlandês</option>
                    <option value="fr">Francês</option>
                    <option value="cy">Galês</option>
                    <option value="el">Grego</option>
                    <option value="he">Hebraico</option>
                    <option value="hi">Hindi</option>
                    <option value="nl">Holandês</option>
                    <option value="hu">Húngaro</option>
                    <option value="id">Indonésio</option>
                    <option value="en" selected>Inglês</option>
                    <option value="ga">Irlandês</option>
                    <option value="is">Islandês</option>
                    <option value="it">Italiano</option>
                    <option value="ja">Japonês</option>
                    <option value="ms">Malaio</option>
                    <option value="no">Norueguês</option>
                    <option value="fa">Persa (Farsi)</option>
                    <option value="pl">Polonês</option>
                    <option value="pt">Português</option>
                    <option value="ro">Romeno</option>
                    <option value="ru">Russo</option>
                    <option value="sr">Sérvio</option>
                    <option value="sv">Sueco</option>
                    <option value="th">Tailandês</option>
                    <option value="cs">Tcheco</option>
                    <option value="tr">Turco</option>
                    <option value="uk">Ucraniano</option>
                    <option value="vi">Vietnamita</option>
                    <option value="zu">Zulu</option>
                </select>
            </div>
        </div>

        <!-- Área de Entrada de Texto --><div class="mb-8">
            <label for="input-text" class="block text-lg font-semibold text-gray-200 mb-3">Seu Texto Original</label>
            <textarea id="input-text" rows="6" placeholder="Digite o texto que deseja traduzir aqui..." class="w-full p-4 bg-input-bg border-2 border-primary-gold rounded-xl focus:ring-2 focus:ring-primary-gold focus:border-transparent resize-none shadow-xl-dark text-light-text placeholder-gray-500 transition duration-200"></textarea>
            <p id="input-error" class="text-sm text-red-400 mt-2 hidden">Por favor, digite algum texto para traduzir.</p>
        </div>

        <!-- Botão de Tradução --><div class="mb-10">
            <button id="translate-btn" class="btn-primary w-full py-4 px-6 text-white-contrast font-bold text-xl rounded-xl shadow-lg hover:shadow-gold-glow transition duration-300 transform hover:-translate-y-1 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center" disabled>
                <svg id="translate-icon" xmlns="http://www.w3.org/2000/svg" class="h-7 w-7 mr-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12a9 9 0 0 0-9-9 9.75 9.75 0 0 0-6.74 2.75l-2.75 2.75m18 0l-2.75-2.75m-15 0a9 9 0 0 0 9 9 9.75 9.75 0 0 0 6.74-2.75l2.75-2.75m-18 0l2.75 2.75"/></svg>
                <span id="translate-text">Traduzir</span>
                <div id="loading-spinner" class="hidden w-6 h-6 border-3 border-white-contrast border-t-transparent rounded-full animate-spin ml-3"></div>
            </button>
        </div>

        <!-- Área de Saída de Texto --><div>
            <label for="output-text" class="block text-lg font-semibold text-gray-200 mb-3">Tradução</label>
            <div class="relative">
                <textarea id="output-text" rows="6" placeholder="Sua tradução aparecerá aqui..." class="w-full p-4 bg-input-bg border-2 border-secondary-silver rounded-xl resize-none shadow-xl-dark text-light-text placeholder-gray-500 transition duration-200" readonly></textarea>
                <button id="copy-btn" class="absolute top-4 right-4 p-3 bg-gray-700 text-secondary-silver rounded-lg hover:bg-primary-gold hover:text-white-contrast transition duration-200 shadow-md" title="Copiar Tradução" disabled>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="13" height="13" x="9" y="9" rx="2" ry="2"/><path d="M5 15V5c0-1.1.9-2 2-2h8"/></svg>
                </button>
                <span id="copy-message" class="absolute top-1/2 right-6 -translate-y-1/2 px-3 py-1.5 bg-green-600 text-white-contrast text-sm rounded-lg opacity-0 transition-opacity duration-300 pointer-events-none shadow-lg">Copiado!</span>
            </div>
            
            <!-- Seção de Fontes (Grounding) --><div id="sources-container" class="mt-6 hidden p-4 bg-gray-800 border-l-4 border-primary-gold rounded-lg shadow-inner">
                <p class="font-medium text-gray-300 text-sm mb-2">Fontes de Confiabilidade:</p>
                <ul id="sources-list" class="list-disc list-inside text-gray-400 text-xs space-y-1">
                    <!-- Fontes serão injetadas aqui --></ul>
            </div>
        </div>
        
        <!-- Modal para Erros e Mensagens --><div id="modal" class="fixed inset-0 bg-black bg-opacity-70 hidden items-center justify-center z-50 p-6">
            <div class="bg-gray-900 rounded-xl p-8 w-full max-w-sm shadow-gold-glow border border-primary-gold">
                <h3 id="modal-title" class="text-2xl font-bold text-primary-gold mb-4 text-center">Erro de Tradução</h3>
                <p id="modal-message" class="text-gray-300 text-center mb-6">Ocorreu um erro ao processar sua solicitação.</p>
                <button id="modal-close-btn" class="w-full py-3 bg-primary-gold text-dark-bg font-semibold rounded-lg hover:bg-gold-500 transition duration-200 shadow-md hover:shadow-lg">Entendi</button>
            </div>
        </div>

    </div>

    <script type="module">
        // Elementos da Interface Principal (Tradutor)
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
        
        // Elementos do Modal (Erro Geral)
        const modal = document.getElementById('modal');
        const modalTitle = document.getElementById('modal-title');
        const modalMessage = document.getElementById('modal-message');
        const modalCloseBtn = document.getElementById('modal-close-btn');

        // Elementos da Tela de Login
        const loginScreen = document.getElementById('login-screen');
        const appScreen = document.getElementById('app');
        const loginForm = document.getElementById('login-form');
        const usernameInput = document.getElementById('username');
        const passwordInput = document.getElementById('password');
        const loginErrorMsg = document.getElementById('login-error-message');

        // Credenciais de Acesso (APENAS PARA DEMONSTRAÇÃO!)
        const CORRECT_USERNAME = 'tradutormk';
        const CORRECT_PASSWORD = 'deusefiel';

        // Configurações da API
        const apiKey = ""; // A chave será injetada em tempo de execução
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

        // Função para habilitar/desabilitar os botões de tradução e cópia
        function updateTranslateButtonState() {
            translateBtn.disabled = inputTextarea.value.trim() === '';
            copyBtn.disabled = outputTextarea.value.trim() === '';
        }

        // Função para alternar os idiomas
        swapBtn.addEventListener('click', () => {
            const tempValue = sourceLangSelect.value;
            sourceLangSelect.value = targetLangSelect.value;
            targetLangSelect.value = tempValue;
            
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
                // Usando execCommand('copy') como alternativa mais robusta em alguns ambientes de iframe
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
                        a.className = 'hover:underline text-blue-400';
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

        // --- Lógica de Login ---
        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const enteredUsername = usernameInput.value.trim();
            const enteredPassword = passwordInput.value.trim();

            if (enteredUsername === CORRECT_USERNAME && enteredPassword === CORRECT_PASSWORD) {
                // Login bem-sucedido
                loginScreen.classList.add('hidden');
                appScreen.classList.remove('hidden');
                loginErrorMsg.classList.add('hidden');
                updateTranslateButtonState(); // Inicializa o estado dos botões da tela principal
            } else {
                // Login falhou
                loginErrorMsg.textContent = 'Login ou senha incorretos.';
                loginErrorMsg.classList.remove('hidden');
                passwordInput.value = ''; // Limpa o campo da senha
            }
        });

        // Adicionar o listener de click ao botão de tradução
        translateBtn.addEventListener('click', translateTextFromInput);
        
        // Adicionar event listener para o Enter key no textarea (para conveniência)
        inputTextarea.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault(); // Impede a quebra de linha
                translateTextFromInput();
            }
        });

        // Inicializa o estado do login para garantir que a tela de login apareça primeiro
        window.onload = () => {
            loginScreen.classList.remove('hidden');
            appScreen.classList.add('hidden');
        };

    </script>
</body>
</html>
