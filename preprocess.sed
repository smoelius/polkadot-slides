s/^\\section{[^}]*}/\\end{frame}&\\begin{frame}\\frametitle{\\sectionprefix~\\insertsectionhead}/;
s/^\\sectionbreak\>/\\end{frame}\\begin{frame}\\frametitle{\\sectionprefix~\\insertsectionhead~(continued)}/;
s/^\\subsection{[^}]*}/\\end{frame}&\\begin{frame}\\frametitle{\\subsectionprefix~\\insertsubsectionhead}/;
s/^\\subsectionbreak\>/\\end{frame}\\begin{frame}\\frametitle{\\subsectionprefix~\\insertsubsectionhead~(continued)}/;
s/^\\begin{thebibliography}{}/&\\begin{frame}\\frametitle{References}/;
s/^\\end{thebibliography}/\\end{frame}&/;
s/^\\bibbreak\>/\\end{frame}\\begin{frame}\\frametitle{References~(continued)}/
