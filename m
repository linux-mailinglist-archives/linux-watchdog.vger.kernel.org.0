Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C6B1B35DD
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Apr 2020 06:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgDVECA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 22 Apr 2020 00:02:00 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:11272 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgDVECA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 22 Apr 2020 00:02:00 -0400
Received: from [10.28.39.241] (10.28.39.241) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 22 Apr 2020
 12:02:48 +0800
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
CC:     <jwerner@chromium.org>, Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <64c40c96-5a5f-b111-3b3f-44f874cc3968@amlogic.com>
Date:   Wed, 22 Apr 2020 12:02:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.39.241]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,Evan

On 2020/4/21 19:05, Evan Benn wrote:
> From: Julius Werner <jwerner@chromium.org>
> 
> This patch adds a watchdog driver that can be used on ARM systems
> with the appropriate watchdog implemented in Secure Monitor firmware.
> The driver communicates with firmware via a Secure Monitor Call.
> This may be useful for platforms using TrustZone that want
> the Secure Monitor firmware to have the final control over the watchdog.
> 
> This is implemented on mt8173 chromebook devices oak, elm and hana in
> arm trusted firmware file plat/mediatek/mt8173/drivers/wdt/wdt.c.
> 
> Signed-off-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> ---
> 
> Changes in v4:
> - Get smc-id from of property
> - Return a1 instead of a0 in timeleft
> 
> Changes in v3:
> - Add optional get_timeleft op
> - change name to arm_smc_wdt
> 
> Changes in v2:
> - use watchdog_stop_on_reboot
> - use watchdog_stop_on_unregister
> - use devm_watchdog_register_device
> - remove smcwd_shutdown, smcwd_remove
> - change error codes
> 
>   MAINTAINERS                    |   1 +
>   arch/arm64/configs/defconfig   |   1 +
>   drivers/watchdog/Kconfig       |  13 +++
>   drivers/watchdog/Makefile      |   1 +
>   drivers/watchdog/arm_smc_wdt.c | 194 +++++++++++++++++++++++++++++++++
>   5 files changed, 210 insertions(+)
>   create mode 100644 drivers/watchdog/arm_smc_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f2b39767bfa9..2b782bbff200a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1462,6 +1462,7 @@ M:	Julius Werner <jwerner@chromium.org>
>   R:	Evan Benn <evanbenn@chromium.org>
>   S:	Maintained
>   F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
> +F:	drivers/watchdog/arm_smc_wdt.c
>   
>   ARM SMMU DRIVERS
>   M:	Will Deacon <will@kernel.org>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 24e534d850454..0619df80f7575 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -513,6 +513,7 @@ CONFIG_UNIPHIER_THERMAL=y
>   CONFIG_WATCHDOG=y
>   CONFIG_ARM_SP805_WATCHDOG=y
>   CONFIG_ARM_SBSA_WATCHDOG=y
> +CONFIG_ARM_SMC_WATCHDOG=y
>   CONFIG_S3C2410_WATCHDOG=y
>   CONFIG_DW_WATCHDOG=y
>   CONFIG_SUNXI_WATCHDOG=m
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0663c604bd642..c440b576d23bf 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -867,6 +867,19 @@ config DIGICOLOR_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called digicolor_wdt.
>   
> +config ARM_SMC_WATCHDOG
> +	tristate "ARM Secure Monitor Call based watchdog support"
> +	depends on ARM || ARM64
> +	depends on OF
> +	depends on HAVE_ARM_SMCCC
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for a watchdog timer
> +	  implemented by the EL3 Secure Monitor on ARM platforms.
> +	  Requires firmware support.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called arm_smc_wdt.
> +
>   config LPC18XX_WATCHDOG
>   	tristate "LPC18xx/43xx Watchdog"
>   	depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 6de2e4ceef190..97bed1d3d97cb 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -94,6 +94,7 @@ obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
>   obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
>   obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
>   obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
> +obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>   
>   # X86 (i386 + ia64 + x86_64) Architecture
>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> new file mode 100644
> index 0000000000000..29d2573b2ca11
> --- /dev/null
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ARM Secure Monitor Call watchdog driver
> + *
> + * Copyright 2020 Google LLC.
> + * Julius Werner <jwerner@chromium.org>
> + * Based on mtk_wdt.c
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <uapi/linux/psci.h>
> +
> +#define DRV_NAME		"arm_smc_wdt"
> +#define DRV_VERSION		"1.0"
> +
> +#define get_smc_func_id(wdd) (*(u32 *)watchdog_get_drvdata(wdd))
> +enum smcwd_call {
> +	SMCWD_INIT		= 0,
> +	SMCWD_SET_TIMEOUT	= 1,
> +	SMCWD_ENABLE		= 2,
> +	SMCWD_PET		= 3,
> +	SMCWD_GET_TIMELEFT	= 4,
> +};
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +static unsigned int timeout;
> +
> +static int smcwd_call(unsigned long smc_func_id, enum smcwd_call call,
> +		      unsigned long arg, struct arm_smccc_res *res)
> +{
> +	struct arm_smccc_res local_res;
> +
> +	if (!res)
> +		res = &local_res;
> +
> +	arm_smccc_smc(smc_func_id, call, arg, 0, 0, 0, 0, 0, res);
> +
> +	if (res->a0 == PSCI_RET_NOT_SUPPORTED)
> +		return -ENODEV;
> +	if (res->a0 == PSCI_RET_INVALID_PARAMS)
> +		return -EINVAL;
> +	if (res->a0 != PSCI_RET_SUCCESS)
> +		return -EIO;
> +	return 0;
> +}
> +
> +static int smcwd_ping(struct watchdog_device *wdd)
> +{
> +	return smcwd_call(get_smc_func_id(wdd), SMCWD_PET, 0, NULL);
> +}
> +
> +static unsigned int smcwd_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +
> +	smcwd_call(get_smc_func_id(wdd), SMCWD_GET_TIMELEFT, 0, &res);
> +	return res.a1;It should return 0 when the smcwd_call return error according to 
Guenter's suggestion at [0]

[0]: https://patchwork.kernel.org/patch/11197781/

Thanks.
> +
> +static int smcwd_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
> +{
> +	int res;
> +
> +	res = smcwd_call(get_smc_func_id(wdd), SMCWD_SET_TIMEOUT, timeout,
> +			 NULL);
> +	if (!res)
> +		wdd->timeout = timeout;
> +	return res;
> +}
> +
> +static int smcwd_stop(struct watchdog_device *wdd)
> +{
> +	return smcwd_call(get_smc_func_id(wdd), SMCWD_ENABLE, 0, NULL);
> +}
> +
[...]
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Julius Werner <jwerner@chromium.org>");
> +MODULE_DESCRIPTION("ARM Secure Monitor Call Watchdog Driver");
> +MODULE_VERSION(DRV_VERSION);
> 
