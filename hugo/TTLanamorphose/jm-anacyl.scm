(define (jm-anacyl img drawable rad ang)
	(set! rad (* rad 2))
	(set! ang (max ang 60))

	(gimp-undo-push-group-start img)

	(set! lay (car (gimp-image-active-drawable img)))
	(set! w (car (gimp-drawable-width lay)))
	(set! h (car (gimp-drawable-height lay)))

	(gimp-flip lay 1)
	(set! dw (* w (- (/ 360 ang) 1)))
	(set! w (+ w dw))
	(set! h (+ h rad))

	(gimp-image-resize img w h (/ dw 2) rad)
 	(gimp-image-flatten img)

	(set! lay (car (gimp-image-active-drawable img)))
	(plug-in-polar-coords 1 img lay 100.0 0.0 0 1 1)

	(gimp-image-resize img h h (/ (- h w) 2) 0)

	(gimp-undo-push-group-end img)
	(gimp-displays-flush)
)

(script-fu-register
	"jm-anacyl" 
	"<Image>/Script-Fu/Anamorphose/Cylindrique"
	"Anamorphose cylindrique"
	"J.M. Grimaldi"
	"J.M. Grimaldi"
	"2001"
	"" 
	SF-IMAGE "Image" 0
	SF-DRAWABLE "Drawable" 0
	SF-VALUE "Rayon central" "40"
	SF-VALUE "Angle de développement" "200"
)
