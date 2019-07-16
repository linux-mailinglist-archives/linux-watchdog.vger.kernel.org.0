Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8E66AC93
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2019 18:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfGPQSM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Jul 2019 12:18:12 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:22900 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727796AbfGPQSM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Jul 2019 12:18:12 -0400
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6GGG1oB009413;
        Tue, 16 Jul 2019 16:18:10 GMT
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 2tsehj9tap-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Jul 2019 16:18:10 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net [16.208.49.245])
        by g9t5009.houston.hpe.com (Postfix) with ESMTP id 8BC625C;
        Tue, 16 Jul 2019 16:18:09 +0000 (UTC)
Received: from anatevka.americas.hpqcorp.net (anatevka.americas.hpqcorp.net [10.34.81.61])
        by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id 03B7847;
        Tue, 16 Jul 2019 16:18:08 +0000 (UTC)
Date:   Tue, 16 Jul 2019 10:18:08 -0600
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 03/14] docs: fix broken doc references due to renames
Message-ID: <20190716161808.GA13404@anatevka.americas.hpqcorp.net>
Reply-To: Jerry.Hoemann@hpe.com
References: <cover.1563277838.git.mchehab+samsung@kernel.org>
 <aa415583bf6b812b0249093a601aa31412f3a1cf.1563277838.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa415583bf6b812b0249093a601aa31412f3a1cf.1563277838.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-16_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160200
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 16, 2019 at 09:10:42AM -0300, Mauro Carvalho Chehab wrote:
> Some files got renamed but probably due to some merge conflicts,
> a few references still point to the old locations.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/RCU/rculist_nulls.txt                   | 2 +-
>  Documentation/devicetree/bindings/arm/idle-states.txt | 2 +-
>  Documentation/locking/spinlocks.rst                   | 4 ++--
>  Documentation/memory-barriers.txt                     | 2 +-
>  Documentation/translations/ko_KR/memory-barriers.txt  | 2 +-
>  Documentation/watchdog/hpwdt.rst                      | 2 +-

For: Documentation/watchdog/hpwdt.rst

Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>


>  MAINTAINERS                                           | 8 ++++----
>  drivers/gpu/drm/drm_modes.c                           | 2 +-
>  drivers/i2c/busses/i2c-nvidia-gpu.c                   | 2 +-
>  drivers/scsi/hpsa.c                                   | 4 ++--
>  10 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/RCU/rculist_nulls.txt b/Documentation/RCU/rculist_nulls.txt
> index 8151f0195f76..23f115dc87cf 100644
> --- a/Documentation/RCU/rculist_nulls.txt
> +++ b/Documentation/RCU/rculist_nulls.txt
> @@ -1,7 +1,7 @@
>  Using hlist_nulls to protect read-mostly linked lists and
>  objects using SLAB_TYPESAFE_BY_RCU allocations.
>  
> -Please read the basics in Documentation/RCU/listRCU.txt
> +Please read the basics in Documentation/RCU/listRCU.rst
>  
>  Using special makers (called 'nulls') is a convenient way
>  to solve following problem :
> diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
> index 326f29b270ad..2d325bed37e5 100644
> --- a/Documentation/devicetree/bindings/arm/idle-states.txt
> +++ b/Documentation/devicetree/bindings/arm/idle-states.txt
> @@ -703,4 +703,4 @@ cpus {
>      https://www.devicetree.org/specifications/ 
>  
>  [6] ARM Linux Kernel documentation - Booting AArch64 Linux
> -    Documentation/arm64/booting.txt
> +    Documentation/arm64/booting.rst
> diff --git a/Documentation/locking/spinlocks.rst b/Documentation/locking/spinlocks.rst
> index 098107fb7d86..e93ec6645238 100644
> --- a/Documentation/locking/spinlocks.rst
> +++ b/Documentation/locking/spinlocks.rst
> @@ -82,7 +82,7 @@ itself.  The read lock allows many concurrent readers.  Anything that
>  **changes** the list will have to get the write lock.
>  
>     NOTE! RCU is better for list traversal, but requires careful
> -   attention to design detail (see Documentation/RCU/listRCU.txt).
> +   attention to design detail (see Documentation/RCU/listRCU.rst).
>  
>  Also, you cannot "upgrade" a read-lock to a write-lock, so if you at _any_
>  time need to do any changes (even if you don't do it every time), you have
> @@ -90,7 +90,7 @@ to get the write-lock at the very beginning.
>  
>     NOTE! We are working hard to remove reader-writer spinlocks in most
>     cases, so please don't add a new one without consensus.  (Instead, see
> -   Documentation/RCU/rcu.txt for complete information.)
> +   Documentation/RCU/rcu.rst for complete information.)
>  
>  ----
>  
> diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> index 045bb8148fe9..1adbb8a371c7 100644
> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -548,7 +548,7 @@ There are certain things that the Linux kernel memory barriers do not guarantee:
>  
>  	[*] For information on bus mastering DMA and coherency please read:
>  
> -	    Documentation/PCI/pci.rst
> +	    Documentation/driver-api/pci/pci.rst
>  	    Documentation/DMA-API-HOWTO.txt
>  	    Documentation/DMA-API.txt
>  
> diff --git a/Documentation/translations/ko_KR/memory-barriers.txt b/Documentation/translations/ko_KR/memory-barriers.txt
> index a33c2a536542..2774624ee843 100644
> --- a/Documentation/translations/ko_KR/memory-barriers.txt
> +++ b/Documentation/translations/ko_KR/memory-barriers.txt
> @@ -569,7 +569,7 @@ ACQUIRE 는 해당 오퍼레이션의 로드 부분에만 적용되고 RELEASE 
>  
>  	[*] 버스 마스터링 DMA 와 일관성에 대해서는 다음을 참고하시기 바랍니다:
>  
> -	    Documentation/PCI/pci.rst
> +	    Documentation/driver-api/pci/pci.rst
>  	    Documentation/DMA-API-HOWTO.txt
>  	    Documentation/DMA-API.txt
>  
> diff --git a/Documentation/watchdog/hpwdt.rst b/Documentation/watchdog/hpwdt.rst
> index 94a96371113e..49c647dba8aa 100644
> --- a/Documentation/watchdog/hpwdt.rst
> +++ b/Documentation/watchdog/hpwdt.rst
> @@ -59,7 +59,7 @@ Last reviewed: 08/20/2018
>   and loop forever.  This is generally not what a watchdog user wants.
>  
>   For those wishing to learn more please see:
> -	Documentation/kdump/kdump.rst
> +	Documentation/admin-guide/kdump/kdump.rst
>  	Documentation/admin-guide/kernel-parameters.txt (panic=)
>  	Your Linux Distribution specific documentation.
>  
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b3a5c72f3298..b0acc138e9e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -899,7 +899,7 @@ L:	linux-iio@vger.kernel.org
>  W:	http://ez.analog.com/community/linux-device-drivers 
>  S:	Supported
>  F:	drivers/iio/adc/ad7124.c
> -F:	Documentation/devicetree/bindings/iio/adc/adi,ad7124.txt
> +F:	Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
>  
>  ANALOG DEVICES INC AD7606 DRIVER
>  M:	Stefan Popa <stefan.popa@analog.com>
> @@ -4189,7 +4189,7 @@ M:	Jens Axboe <axboe@kernel.dk>
>  L:	cgroups@vger.kernel.org
>  L:	linux-block@vger.kernel.org
>  T:	git git://git.kernel.dk/linux-block
> -F:	Documentation/cgroup-v1/blkio-controller.rst
> +F:	Documentation/admin-guide/cgroup-v1/blkio-controller.rst
>  F:	block/blk-cgroup.c
>  F:	include/linux/blk-cgroup.h
>  F:	block/blk-throttle.c
> @@ -6848,7 +6848,7 @@ R:	Sagi Shahar <sagis@google.com>
>  R:	Jon Olson <jonolson@google.com>
>  L:	netdev@vger.kernel.org
>  S:	Supported
> -F:	Documentation/networking/device_drivers/google/gve.txt
> +F:	Documentation/networking/device_drivers/google/gve.rst
>  F:	drivers/net/ethernet/google
>  
>  GPD POCKET FAN DRIVER
> @@ -12096,7 +12096,7 @@ M:	Juergen Gross <jgross@suse.com>
>  M:	Alok Kataria <akataria@vmware.com>
>  L:	virtualization@lists.linux-foundation.org
>  S:	Supported
> -F:	Documentation/virtual/paravirt_ops.txt
> +F:	Documentation/virtual/paravirt_ops.rst
>  F:	arch/*/kernel/paravirt*
>  F:	arch/*/include/asm/paravirt*.h
>  F:	include/linux/hypervisor.h
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 57e6408288c8..4645af681ef8 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1680,7 +1680,7 @@ static int drm_mode_parse_cmdline_options(char *str, size_t len,
>   *
>   * Additionals options can be provided following the mode, using a comma to
>   * separate each option. Valid options can be found in
> - * Documentation/fb/modedb.txt.
> + * Documentation/fb/modedb.rst.
>   *
>   * The intermediate drm_cmdline_mode structure is required to store additional
>   * options from the command line modline like the force-enable/disable flag.
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index cfc76b5de726..5a1235fd86bb 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -364,7 +364,7 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
>  /*
>   * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
>   * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
> - * Documentation/power/pci.txt also insists for driver to provide this.
> + * Documentation/power/pci.rst also insists for driver to provide this.
>   */
>  static __maybe_unused int gpu_i2c_suspend(struct device *dev)
>  {
> diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c
> index 43a6b5350775..eaf6177ac9ee 100644
> --- a/drivers/scsi/hpsa.c
> +++ b/drivers/scsi/hpsa.c
> @@ -7798,7 +7798,7 @@ static void hpsa_free_pci_init(struct ctlr_info *h)
>  	hpsa_disable_interrupt_mode(h);		/* pci_init 2 */
>  	/*
>  	 * call pci_disable_device before pci_release_regions per
> -	 * Documentation/PCI/pci.rst
> +	 * Documentation/driver-api/pci/pci.rst
>  	 */
>  	pci_disable_device(h->pdev);		/* pci_init 1 */
>  	pci_release_regions(h->pdev);		/* pci_init 2 */
> @@ -7881,7 +7881,7 @@ static int hpsa_pci_init(struct ctlr_info *h)
>  clean1:
>  	/*
>  	 * call pci_disable_device before pci_release_regions per
> -	 * Documentation/PCI/pci.rst
> +	 * Documentation/driver-api/pci/pci.rst
>  	 */
>  	pci_disable_device(h->pdev);
>  	pci_release_regions(h->pdev);
> -- 
> 2.21.0

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
