Return-Path: <linux-watchdog+bounces-4426-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5472BC15B14
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 17:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A6684F757C
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 16:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EF0342173;
	Tue, 28 Oct 2025 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lf37kFEr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4B33F8C6
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761667578; cv=none; b=S8U2t9EOFMJWw6LADdTaSdT3sTwoXEmEq/aVTQJgqPpIc8AohzBQsdzAZc0NjOYC0PMjvJb7/Oi2MXxI2VCOtNBYWvUiVyMJtlstQFRuyT1Yz1Vjc1GVE4tRREiweVLaYGSPb3MoJ/dcPwT6iQBXQA3zJ6ji6ZxgXaGZNQ4mHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761667578; c=relaxed/simple;
	bh=YKwaK/A47S6nF0Lh1sBwKbIM6EoF4WO3cWoLFzZlAdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWgCK13bduQ423/YbopAVb8VH3OGY9fi6siovODWHyLEqlFmOt4v+gVxeX/s/Wzt1VxcEjX4qB5BYWYAseiglO5HRNs5oLNjt3ZTRkh9YbMStU/P04zsxDeSXiorvGkQFACETyzRkJhYt2+1YkWleGHFcSedwLySsqgG6hMGw2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lf37kFEr; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-79af647cef2so5281785b3a.3
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 09:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761667576; x=1762272376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=h4a530v/dHyN1LbswSN3qEMy0albsn4FjiCbQX4El9E=;
        b=lf37kFEryv0aRPz96kC8T0L5JsQlsjGspd7v6cftp+BFYKoO/vIRoBbExuEVKM6KQz
         +lngI7s6WYrpBtPoc3xfmutd0xtgNC6bg7D2y+NEaPeeUCcpgEtkGNNejI+c8zVuxsdp
         u3YeA5y9bQeqmhFYQYHtqrFSLhXQl2UWG5BcadNseRK5MdLUdv/IbMkcI+1nf2wDIeqX
         gu+KPXZf0rDOClTgCdDY8GfHqEbst/Did47Jsrq6AjexZz0RTGOg84q218M6h7ZZVGkW
         PAALCf+DEAlaxyJpqiuGKWjXb+sTfqe+q63CuCpWWRdZFVxEziYYBR23JDmo7syRnixq
         /rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761667576; x=1762272376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4a530v/dHyN1LbswSN3qEMy0albsn4FjiCbQX4El9E=;
        b=urqndVZsIZYt2cyIqlJdV1X96xaVcQSNGaKEUbLmyDL+3srEn8tY4YEipB9RSedGBW
         RSCxYb5079pAQW5FlualPjg/A0CmQDmr2z04uGwW2Gkt3syutxmcWNKJvWLwl0QcFT/0
         p8eOZHGFkyEsLsP2EL1N340FKyTMFFZvpiO69fXkGo1EFDuNi0T5TYhl28PofcF2DoJf
         fFJVTGX+iUU89O4D/IuymgPUPq43+3wN9zCx3K/iTIjRdkCL9kP/o5cse7Z0Z+jjUIUY
         HT47z+KRfrLN5U+pNrh+QF+LtHGrgaEFAdgBCgIX+9NszOIAGAh83mTrvbtGNmILYkGI
         u6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWhONqA9tOrN3RKkAwGXfLnE66Z9wLq0910eSeyoGpHglV7/BDQRGnaOTOu5ddVNJr9eXXKhpZoXut0rm7XeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH73BAHDLcKmjAA6F+vQzLh4nLwVVcnTzijNgeDGQ8Mp8+WWV4
	+oyHvkfq6DbEbRTiHvxu2Lv6xGo7i3jZys+vifZHXWBxqAp0SzKQExy4
X-Gm-Gg: ASbGnctTOfSeJvGy7yMBgufMa7q9thPECDUA7NllI7r8zZI7V9T7GV2oCsnVy3kXGhG
	jbC1P2Xk+mgWgW5Ew6SFL0+Du7JX20Sf6CgIU6wXXWTuAI0Lhmwau4KmzL4UMinxMduLkBAtY2J
	TDVGGoMksW4SPB1aOKJGT+sECx/sW4inEUZGGpSXwhz70RBavCVradXyIflp14dw6xNf6O6u80c
	iRU4DLR4AeolaGnORC/JJ7xNywlWGM6MaUgWHOEorbz0q4ymRxBJWbmwHXk3QrqK2K4o7mV8H5k
	w9W7ZRcA1/UBPlCG2I+OnfzJQPB//BIcVdKEnDpNR2lkJV1YzR+16/PVEFKAjLw5L4geE98AlXD
	SzZ06ik3kDV2P5x91eM/UZvv3QMak5lMCctZejABzVbEXNO/x9eQTVao7U6nuXNjUuo6MxLhafv
	ju5vMj/Ewp5cXkYplZaQ8kQgSBG66Eq+Dwd3FRLsDTpn9WBpKg
X-Google-Smtp-Source: AGHT+IGWTJWci7zBvxykrb10yv5bxwA6wJYkCFcpJdNBvMc5y6WUllUUCboNr50i/eEkCTQz9nUAdw==
X-Received: by 2002:a05:6a20:958f:b0:323:b12:bda6 with SMTP id adf61e73a8af0-344d1da2b34mr5143104637.13.1761667575308;
        Tue, 28 Oct 2025 09:06:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404d760sm11969985b3a.39.2025.10.28.09.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:06:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4659e69b-907a-49ba-8eb6-ac17232a5219@roeck-us.net>
Date: Tue, 28 Oct 2025 09:06:12 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
To: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 02:35, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> through MMIO is not available on all platforms. Depending on the
> hypervisor configuration, the watchdog is either fully emulated or
> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
> Specific Hypervisor Service Calls space.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
> expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
> the devicetree. If we detect either of the device nodes, we don't
> proceed ahead. Otherwise, we go ahead and invoke GUNYAH_WDT_STATUS SMC
> to initiate the discovery of the SMC-based watchdog.
> 
> Add driver to support the SMC-based watchdog provided by the Gunyah
> Hypervisor. module_exit() is intentionally not implemented as this
> driver is intended to be a persistent module.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
> Gunyah is a Type-I hypervisor which was introduced in the patch series
> [1]. It is an open source hypervisor. The source repo is available at
> [2].
> 
> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> access the MMIO watchdog. It either provides the fully emulated MMIO
> based watchdog interface or the SMC-based watchdog interface depending
> on the hypervisor configuration.
> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> 
> This patch series adds support for the SMC-based watchdog interface
> provided by the Gunyah Hypervisor.
> 
> This series is tested on SM8750 platform.
> 
> [1]
> https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
> 
> [2]
> https://github.com/quic/gunyah-hypervisor
> ---
> Changes in v3:
> - Move back to platform driver model. In module init, determine if we're
>    running on a Qualcomm device and there is no supported memory-mapped
>    watchdog present. Then proceed to register platform device and driver
>    for SMC-based Gunyah watchdog.
> - To determine if we're running on a Qualcomm device we're checking the
>    presence of "qcom,smem" compatible devicetree node. As an alternative,
>    we also tried using socinfo for the same purpose. When both
>    gunyah_wdt and socinfo drivers were made built-in, it couldn't be
>    ensured that the socinfo driver probed successfully before gunyah_wdt
>    init was called. Hence, we resorted to the devicetree node approach.
> - Limit the errors listed in gunyah_error to the ones that can be
>    produced by the driver.
> - Link to v2: https://lore.kernel.org/r/20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com
> 
> Changes in v2:
> - Move away from platform driver model since the devicetree overlay does
>    not happen by default.
>    See https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/
> - Only when MMIO-based watchdog device is absent in the devicetree,
>    proceed to detect SMC-based watchdog using GUNYAH_WDT_STATUS SMC and
>    initialize if SMC returns success.
> - Implement pm notifiers as gunyah_wdt is no longer a platform driver so
>    dev_pm_ops cannot be used.
> - Pretimeout IRQ is no longer supported.
> - Remove struct gunyah_wdt since it is not required.
> - Move the contents of gunyah_errno.h to gunyah_wdt.c.
> - Link to v1: https://lore.kernel.org/r/20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com
> ---
>   MAINTAINERS                   |   1 +
>   drivers/watchdog/Kconfig      |  14 ++
>   drivers/watchdog/Makefile     |   1 +
>   drivers/watchdog/gunyah_wdt.c | 291 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 307 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0b444e5fd5a..56dbd0d3e31b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3083,6 +3083,7 @@ F:	arch/arm64/boot/dts/qcom/
>   F:	drivers/bus/qcom*
>   F:	drivers/firmware/qcom/
>   F:	drivers/soc/qcom/
> +F:	drivers/watchdog/gunyah_wdt.c
>   F:	include/dt-bindings/arm/qcom,ids.h
>   F:	include/dt-bindings/firmware/qcom,scm.h
>   F:	include/dt-bindings/soc/qcom*
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0c25b2ed44eb..f0dee04b3650 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2343,4 +2343,18 @@ config KEEMBAY_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called keembay_wdt.
>   
> +config GUNYAH_WATCHDOG
> +	tristate "Qualcomm Gunyah Watchdog"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on HAVE_ARM_SMCCC
> +	depends on OF
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for watchdog timer provided by the
> +	  Gunyah hypervisor. The driver uses ARM SMC Calling Convention (SMCCC)
> +	  to interact with Gunyah Watchdog.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called gunyah_wdt.
> +
>   endif # WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index bbd4d62d2cc3..308379782bc3 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -102,6 +102,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>   obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>   obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>   obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
> +obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
>   
>   # X86 (i386 + ia64 + x86_64) Architecture
>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
> new file mode 100644
> index 000000000000..a165aff5be37
> --- /dev/null
> +++ b/drivers/watchdog/gunyah_wdt.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define GUNYAH_WDT_DRV_NAME "gunyah-wdt"
> +
> +#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
> +			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
> +
> +/* SMCCC function IDs for watchdog operations */
> +#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
> +#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
> +#define GUNYAH_WDT_PING      GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
> +#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)
> +
> +/*
> + * Control values for GUNYAH_WDT_CONTROL.
> + * Bit 0 is used to enable or disable the watchdog. If this bit is set,
> + * then the watchdog is enabled and vice versa.
> + * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
> + * it's expected to be 1.
> + */
> +#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
> +#define WDT_CTRL_DISABLE BIT(1)
> +
> +enum gunyah_error {
> +	GUNYAH_ERROR_OK				= 0,
> +	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
> +	GUNYAH_ERROR_ARG_INVAL			= 1,
> +};
> +
> +static struct platform_device *gunyah_wdt_dev;
> +
> +/**
> + * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
> + * @gunyah_error: Gunyah hypercall return value
> + */
> +static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
> +{
> +	switch (gunyah_error) {
> +	case GUNYAH_ERROR_OK:
> +		return 0;
> +	case GUNYAH_ERROR_UNIMPLEMENTED:
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
> +			   unsigned long arg2, struct arm_smccc_res *res)
> +{
> +	arm_smccc_1_1_smc(func_id, arg1, arg2, res);
> +	return gunyah_error_remap(res->a0);
> +}
> +
> +static int gunyah_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +	unsigned int timeout_ms;
> +	struct device *dev = wdd->parent;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
> +	if (ret && watchdog_active(wdd)) {
> +		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	timeout_ms = wdd->timeout * 1000;
> +	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME,
> +			      timeout_ms, timeout_ms, &res);
> +	if (ret) {
> +		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
> +	if (ret)
> +		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static int gunyah_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +
> +	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
> +}
> +
> +static int gunyah_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +
> +	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
> +}
> +
> +static int gunyah_wdt_set_timeout(struct watchdog_device *wdd,
> +				  unsigned int timeout_sec)
> +{
> +	wdd->timeout = timeout_sec;
> +
> +	if (watchdog_active(wdd))
> +		return gunyah_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +	unsigned int seconds_since_last_ping;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
> +	if (ret)
> +		return 0;
> +
> +	seconds_since_last_ping = res.a2 / 1000;
> +	if (seconds_since_last_ping > wdd->timeout)
> +		return 0;
> +
> +	return wdd->timeout - seconds_since_last_ping;
> +}
> +
> +static int gunyah_wdt_restart(struct watchdog_device *wdd,
> +			      unsigned long action, void *data)
> +{
> +	struct arm_smccc_res res;
> +
> +	/* Set timeout to 1ms and send a ping */
> +	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
> +	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1, &res);
> +	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
> +
> +	/* Wait to make sure reset occurs */
> +	mdelay(100);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info gunyah_wdt_info = {
> +	.identity = "Gunyah Watchdog",
> +	.firmware_version = 0,
> +	.options = WDIOF_SETTIMEOUT
> +		 | WDIOF_KEEPALIVEPING
> +		 | WDIOF_MAGICCLOSE,
> +};
> +
> +static const struct watchdog_ops gunyah_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = gunyah_wdt_start,
> +	.stop = gunyah_wdt_stop,
> +	.ping = gunyah_wdt_ping,
> +	.set_timeout = gunyah_wdt_set_timeout,
> +	.get_timeleft = gunyah_wdt_get_timeleft,
> +	.restart = gunyah_wdt_restart
> +};
> +
> +static int gunyah_wdt_probe(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdd;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	wdd = devm_kzalloc(dev, sizeof(*wdd), GFP_KERNEL);
> +	if (!wdd)
> +		return -ENOMEM;
> +
> +	wdd->info = &gunyah_wdt_info;
> +	wdd->ops = &gunyah_wdt_ops;
> +	wdd->parent = dev;
> +
> +	/*
> +	 * Although Gunyah expects 16-bit unsigned int values as timeout values
> +	 * in milliseconds, values above 0x8000 are reserved. This limits the
> +	 * max timeout value to 32 seconds.
> +	 */
> +	wdd->max_timeout = 32; /* seconds */
> +	wdd->min_timeout = 1; /* seconds */
> +	wdd->timeout = wdd->max_timeout;
> +
> +	gunyah_wdt_stop(wdd);
> +	platform_set_drvdata(pdev, wdd);
> +	watchdog_set_restart_priority(wdd, 0);
> +
> +	ret = devm_watchdog_register_device(dev, wdd);
> +	if (ret) {
> +		dev_err(dev, "Failed to register watchdog device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "Gunyah watchdog registered\n");
> +	return 0;
> +}
> +
> +static int __maybe_unused gunyah_wdt_suspend(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(wdd))
> +		gunyah_wdt_stop(wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused gunyah_wdt_resume(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(wdd))
> +		gunyah_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
> +
> +static struct platform_driver gunyah_wdt_driver = {
> +	.probe = gunyah_wdt_probe,
> +	.driver = {
> +		.name = GUNYAH_WDT_DRV_NAME,
> +		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
> +	},
> +};
> +
> +static int __init gunyah_wdt_init(void)
> +{
> +	struct arm_smccc_res res;
> +	struct device_node *np;
> +	int ret;
> +
> +	/* Check if we're running on a Qualcomm device */
> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
> +	if (!np)
> +		return -ENODEV;
> +	of_node_put(np);
> +
> +	/*
> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> +	 * the case.
> +	 */
> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> +	if (np) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +
> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> +	if (np) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
> +	if (ret)
> +		return -ENODEV;
> +
> +	ret = platform_driver_register(&gunyah_wdt_driver);
> +	if (ret)
> +		return ret;
> +
> +	gunyah_wdt_dev = platform_device_register_simple(GUNYAH_WDT_DRV_NAME,
> +							 -1, NULL, 0);

I did not follow the discussion around this, so I may be missing something.
If so, apologies.

This is a highly unusual approach. What is the point of not instantiating
the watchdog device through devicetree and doing it in the init function
instead ? There should be a devicetree node which instantiates the device;
it should never be instantiated from the init function unless there _is_
no devicetree, which is obviously not the case here.

Every other driver which supports devicetree has an .of_match_table
which triggers device instantiation. If the Gunyah watchdog can for
some reason not use that approach, its devicetree description should
be fixed. Instantiating the device from its init function because its
devicetree description is bad or missing is just wrong. It is even more
wrong to try to contact the hardware or embedded controller to figure out
if the device is there. This can have all kinds of negative impact on other
hardware.

Guenter


