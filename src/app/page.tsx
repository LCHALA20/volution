import Image from "next/image";

export default function Home() {
  return (
    <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-[family-name:var(--font-geist-sans)]">
      <main className="flex flex-col gap-[32px] row-start-2 items-center sm:items-start">
        <h1 className="text-4xl font-bold text-center sm:text-left">🚀 Bienvenue sur CVolution</h1>
        <p className="text-lg text-gray-600 text-center sm:text-left">
          Trouvez le bon talent, instantanément et sans compromis.
        </p>

        <div className="flex gap-4 items-center flex-col sm:flex-row">
          <a
            className="rounded-full border border-solid border-transparent transition-colors flex items-center justify-center bg-blue-600 text-white gap-2 hover:bg-blue-700 font-medium text-sm sm:text-base h-10 sm:h-12 px-4 sm:px-5 sm:w-auto"
            href="/recruteurs"
          >
            🎯 Espace Recruteur
          </a>
          <a
            className="rounded-full border border-solid border-blue-600 text-blue-600 transition-colors flex items-center justify-center hover:bg-blue-600 hover:text-white font-medium text-sm sm:text-base h-10 sm:h-12 px-4 sm:px-5 w-full sm:w-auto md:w-[158px]"
            href="/candidats"
          >
            📄 Espace Candidat
          </a>
        </div>
      </main>

      <footer className="row-start-3 flex gap-[24px] flex-wrap items-center justify-center">
        <a className="flex items-center gap-2 hover:underline hover:underline-offset-4" href="/a-propos">
          ℹ️ En savoir plus
        </a>
        <a className="flex items-center gap-2 hover:underline hover:underline-offset-4" href="/contact">
          📩 Contactez-nous
        </a>
      </footer>
    </div>
  );
}
