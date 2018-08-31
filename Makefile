.PHONY: clean

NAME := wkrpt

$(NAME).pdf: $(NAME).tex $(NAME).bib signature.png
	# In the worst case, we need all four steps:
	# - biber wants pdflatex to run first (even though it will fail)
	# - biber has to run next to process bibliography
	# - next, pdflatex will succeed
	# - we run pdflatex again at the end as ToC and LoF require a second pass
	# If we didn't need all four steps, it's fine:
	# a work term report should be reasonably short
	pdflatex $(NAME) && biber $(NAME) && pdflatex $(NAME) && pdflatex $(NAME)

clean:
	find . -regex '.*/$(NAME)\..*' -not -regex '.*.\(bib\|pdf\|tex\)' -delete
