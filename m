Return-Path: <linux-watchdog+bounces-4618-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F686C6CCC0
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Nov 2025 06:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id E77342C1BD
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Nov 2025 05:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A242FF651;
	Wed, 19 Nov 2025 05:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG3Zzyf0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091A2EC081
	for <linux-watchdog@vger.kernel.org>; Wed, 19 Nov 2025 05:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763529538; cv=none; b=oMhYGAhxAjyr1V4xeLfyt5foBWzUGextdLB/ccS4qGMeiiNGC8LzUuPAJFvqOCYOvCqO4jUKkwblXchdBEIpdD4Flwws6bSpuxflwEbzRtKzNzmaSSQUcZ3SglNZVuWEPQ20exFbLCnTRpOcaQLGdlFIzUJ8Df33Vrs+X6MQfK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763529538; c=relaxed/simple;
	bh=8Umg0gg6Xs+tQuw+ASeqA4ycc8l9H032aAiznOmfSoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaKP0d2s5I/OcOO0nJxuOdIS+xMQyzfGPNHMXMKVDDf42RmBh1ljG1n0Ffs665xM2nKXiTxr7pkFJtUTGavuo1aob1GmRBIZMgCzm88yO7hwsNz8J3o2aYtn0lFJx/zS4hKIEwM09geb9xyJxLIbR2d7VS66pILHej/Bgs8ZDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG3Zzyf0; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc1f6dfeb3dso3601470a12.1
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 21:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763529535; x=1764134335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=inqmL2h4RcfUfan1007KEW1p2HFr+6rLaEWeQySilRk=;
        b=TG3Zzyf07Kxq32ubNer2xLXHc7H/SxrlZ/Pj53J2Cx6MNrQEnGNXdILmBcCw72npR2
         PeYxmYdInhRzFr/uZcKwEDTC377Ab7pWFl6gY3cNv1tHWEyzrJgmplxOjYyLbmGIRw1n
         LQmlSMCLCCtsxck64ymeUySpXw9NSjrM7Xi64MscjUgs33jMzIIcK9J6Bdk95AnFzn/s
         g3PVXw/lK3GzesragjJePk/UKOunonRC03VAPOBdwihtHuCSAHnB7tbAVyDD8VeylTyh
         szeCartZbaNYlNU3aX6xrefjA0pqO9Id82/j1u0FjlGU72eyABH3X/Y8A0q/zyQ9J2lB
         mVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763529535; x=1764134335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inqmL2h4RcfUfan1007KEW1p2HFr+6rLaEWeQySilRk=;
        b=pPBuDLIobb4JyJulk3Ppd0q4+l9/NnfmsUHqRC5/j718K3gfYSRj28X+/i3wuTlAOZ
         WuT8qDhr7ddPEKxPsgL3C91WSSvrrp1Mqy1aZOhc4ttoWaExUSprICvfEc9vDg1IFMUx
         uMpXNE0BWzKYVY6Hy836JRquxK5P+SaXSoh+ik9GFKRKh/K63cIOwb/zcPGAj630Yiu0
         4YPSkgahPgyNJQSQlZMXixhicawdE+Lqvev8xXElwWRVeXf+zJ0B7oE9P9pxMA0iCkuv
         By4fv6ZuRn4PLxjEgXdvcvgEfOIOQaboUL/Bq+hrPeFCD3FQFnvWtGvcK3ZBO6ebFYFF
         vFew==
X-Forwarded-Encrypted: i=1; AJvYcCUiMddWPlgqUuF4g7SLmrAzdjoaVaJ4HlUEKLdbPZar0h+AgJEAqCflxC09dw9N1kzoDDmX7WLRRCzYbjJTrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+8A5cuNrND0In34/pV1d9/HiqCH3hUG1UxdHZ8PUq41Sm3DYF
	VL/Bv2XXcsrbOQYUWaU8lAaAdzGC45yX6cKfr0Cd5rTjWhj6ZjNxvZzR
X-Gm-Gg: ASbGncuhvR3CaxEcajRvIozHCopv/3lRui0932gO3aR9sBWh89XVKDyu7nmgZXnTW5S
	9mxJwGOsLQbjLQJatp7HoARz0GAPzAhIi6LXnRcxLiGe5n9p1wa1cpwCduvwOWuZNUB0r5T3y3q
	yDEZAHsoy1sfOsLg+RSS22TDGee1jUIs4g92/KaEs7ImWGEhuSSS2/w6BWnFoiq68KfSxSv5dxS
	SY2CokrM2z8Pcsvjuu+nL5LspSrg9fdzzIxjNewM1Eb4oy9+6rw6u0eeNnrV2Z/W1MGnBe4aqER
	3KoT2xuHLn1FS79udIGEbZR+ulSojJ+vSGyIGefFGQrz+O0CrWDg5FF3JFVy3rbsFBLabsR7ZZZ
	jMGpQYCFwLGh+rb0z2CBA6mIes88MR03N2e54zFFFujQqcawC6Yjaq+phWrEVn9aPe9bQ6DxHXK
	hDGfpbTwzsL2/WMyNCmMY4dS0fFdd7T/BBFtU4bes8y4XUoavyulXBlF94jac1N1yh2DThk7pa0
	YxPguE7
X-Google-Smtp-Source: AGHT+IFwBM6wjya5jLEbZUqmrfSz2q2QzSYaX5BizFd2uIrqfqNQRNInKj/AS+IPfO3/fFf1pe9xtA==
X-Received: by 2002:a05:7301:4591:b0:2a4:3593:4687 with SMTP id 5a478bee46e88-2a4abe122d6mr8854275eec.35.1763529535337;
        Tue, 18 Nov 2025 21:18:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db102f5sm52511895eec.4.2025.11.18.21.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 21:18:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0c90c983-c1e9-4231-8551-f8809ee29a04@roeck-us.net>
Date: Tue, 18 Nov 2025 21:18:52 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] watchdog: Add driver for Gunyah Watchdog
To: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <20251118-gunyah_watchdog-v8-2-e5de12e2eef5@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251118-gunyah_watchdog-v8-2-e5de12e2eef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 02:40, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> through MMIO is not available on all platforms. Depending on the
> hypervisor configuration, the watchdog is either fully emulated or
> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
> Specific Hypervisor Service Calls space.
> 
> Add driver to support the SMC-based watchdog provided by the Gunyah
> Hypervisor. Device registration is done in the QCOM SCM driver after
> checks to restrict the watchdog initialization to Qualcomm devices
> running under Gunyah.
> 
> Gunyah watchdog is not a hardware but an SMC-based vendor-specific
> hypervisor interface provided by the Gunyah hypervisor. The design
> involving QCOM SCM driver for registering the platform device has been
> devised to avoid adding non-hardware nodes to devicetree.
> 
> Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>   MAINTAINERS                   |   1 +
>   drivers/watchdog/Kconfig      |  13 +++
>   drivers/watchdog/Makefile     |   1 +
>   drivers/watchdog/gunyah_wdt.c | 261 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 276 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64b94e6b5a9..5d2212c3c917 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3216,6 +3216,7 @@ F:	arch/arm64/boot/dts/qcom/
>   F:	drivers/bus/qcom*
>   F:	drivers/firmware/qcom/
>   F:	drivers/soc/qcom/
> +F:	drivers/watchdog/gunyah_wdt.c
>   F:	include/dt-bindings/arm/qcom,ids.h
>   F:	include/dt-bindings/firmware/qcom,scm.h
>   F:	include/dt-bindings/soc/qcom*
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 05008d937e40..bc6db9a1c116 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2354,4 +2354,17 @@ config KEEMBAY_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called keembay_wdt.
>   
> +config GUNYAH_WATCHDOG
> +	tristate "Qualcomm Gunyah Watchdog"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on HAVE_ARM_SMCCC
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
> index b680e4d3c1bc..1215efb7816d 100644
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
> index 000000000000..49dfef459e84
> --- /dev/null
> +++ b/drivers/watchdog/gunyah_wdt.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
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
> +			   unsigned long arg2)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_smc(func_id, arg1, arg2, &res);
> +	return gunyah_error_remap(res.a0);
> +}
> +
> +static int gunyah_wdt_start(struct watchdog_device *wdd)
> +{
> +	unsigned int timeout_ms;
> +	struct device *dev = wdd->parent;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
> +	if (ret && watchdog_active(wdd)) {
> +		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);

I am not a friend of such logging noise (it will clog the kernel log if there
is a problem with the firmware), but then I figure that it isn't _my_ system
that gets flooded with noise, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter


