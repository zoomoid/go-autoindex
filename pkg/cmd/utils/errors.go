package cmdutils

import (
	"os"

	"k8s.io/klog/v2"
)

func CheckErr(err error) {
	if err != nil {
		klog.Error(err)
		os.Exit(1)
	}
}
