Return-Path: <linux-watchdog+bounces-4588-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B801C5D659
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 14:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 783F635DEBD
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 13:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1936631A815;
	Fri, 14 Nov 2025 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ3iGFuZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D280631A578
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127369; cv=none; b=gs8ctbS2sZwhmkl+rUN/9isVoQeUZ/Fy6gqnzToE2HEmfELMD/cNi7tYwg4h+8i8yqb7FETat/+eK78ZfQzPZQlMQrldhHG1khgfPwwWD3kh5IqhLQ8Upi7KRHkO3qtffoIE7jVYeFJ3Rh33PwUJC90WD6Vzsx0rYbs284Eilu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127369; c=relaxed/simple;
	bh=rsbpRPLuJ8Y4/Yw4PnJKo8krV5yqmWDCP57lNFV6hSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRdtqfeEFLRa1WhfGSaDcVuTxpWS48RWbtJT23/KSm+bpbiG5EnOcMg+29xAw1TsgxGcgBPZa8vuFEXPez/vYSPixafwVAtSQFMz6lu5FnHmKcuRKPzCUeLyN5xHmnfyIjx8/1/EEbZUkcxw0YkW8zAAitxp7aolQ+H2EekpgWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ3iGFuZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297f35be2ffso29585655ad.2
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127366; x=1763732166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lb4Qki5bHo72eO9B2OE3Jm1rNZljAEP6P1/UtnhCU+k=;
        b=cQ3iGFuZXuDxi0Q+37GjVIY5yo1v1yyf0NuonAgFBCImEHSPvfAOIThknyTw5pDCOj
         Qpf9wI9+KK2c5hVoN853EIHzmVFdpcHgRDz1dEZ+E3PFhAwlMLBiHY3ISZ3o361z3drp
         zHvbH0IcWWJ6JWtiWPKYgA5NBVO1GwyZ6NGw3dPGClQXM8UWCG1sF0CSI5/6UWKeGA8h
         YDzwOupF020PNV6Syuc8Bt2F7b6CnwdWT8uyKQJFz6j2ckjevQENDarN8ediOuoA6C4O
         X9IfSA0H/tkHHEitSThidVzoGSTm2HbaWdvzyCW051vjmmOVrMLfNSSDIMTyEjD+gfQB
         fckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127366; x=1763732166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lb4Qki5bHo72eO9B2OE3Jm1rNZljAEP6P1/UtnhCU+k=;
        b=O35PV2nP2uqznLbDtucY2lryGr5AWQPk25JldwvUkynGB2QFCQrYB6Pv+PUu349abN
         NDL2n8EEjlUPAZjMZl7ttmbNiaAm5j1l/+kKuKOhCFhHCotDgr4m/V6HfQx9vtIMw65p
         O1Rp1Q99UWs1QJ0pGZH2uJf7siZMV0w9K9y8dIGzmkg57Ju9amOyeDhG7mlR4d6PsFqn
         SIq23p+HtkdwS5x4TKWlXkX1jKCQL3U/0JnyAFSYaORJ1iHyTKroWPHtFRCRiCGtFGFv
         jab/jLXoYe/js1p92pg/GYGAGax8L76EsrE626w9+nW1evrH8tC3vOgW1xOkx4BOBiNC
         0X+g==
X-Forwarded-Encrypted: i=1; AJvYcCXpePBiMw1DPHEG9AdRBZM0Bq0yB45LCnBfhqIWX+qXrnJtN1RqaVrndxag3huDs+vWQopNw4VJzUNzO87yLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgvpjtvPaV1eWNO/Ny+BQ4bfsti637XT9mzJP1LBwMNQ/U2CsS
	UxnKU1u9xe46Rkd7I5q/6mPQDlyx9HrMU/LB0PJNAv18jTeHO5Ems4Ak
X-Gm-Gg: ASbGncul8UrOufxtnquconN9iYkz2GKRQXuVG1HdUQEmg7L2HV/+YejGR8oKqtFCDmp
	t2qD+5fsMA7RYPAIhpwK8F4wy/IF4utxGSqm6xIpsrQK2HmuthBpAVZlojwFvkhmMqPnlkSCgvO
	Ejnorf3zwXADS076k5c6crmLcNjukz1uFvs/c3ny7oOIBRLyI6ovybX/YtsFU2V8e0bs/zOcnsg
	wOVmQOp+rXvPYpBQu0b86EobDN86S9EukctLewsxNd4fm6Ape9LsRglol+ruk46YHt2dtt2verx
	Pm+udpwkDXam3vYneHLv9nXrfWCrZIJkU/WA2iy2Kht+6+1SOmnp3TChZq67E67BX1ptMcnrpVo
	EdYkw1dLk1voeMyEifxz9fipvB6vdbhxgqVYrEXKYzX6OqnE/ZVeJSifP5UA8toKw6aQ+5Aa6IF
	SW3XTML5WRMxO7W17JqjiZc/Pftpele22lIJH5Qk2iZCkipcme
X-Google-Smtp-Source: AGHT+IE1pWwQOQUXpelll+Ymz6AwlMQfle3dld9yqkH7aeekCJHQtvNouuavmX71xquKciZcRhoqZQ==
X-Received: by 2002:a17:902:ef06:b0:298:595d:3d3a with SMTP id d9443c01a7336-2986a7566edmr29814205ad.50.1763127366012;
        Fri, 14 Nov 2025 05:36:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c103asm55441335ad.96.2025.11.14.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:36:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <55fba1a9-a24d-40b7-b97a-171f4a60a7dc@roeck-us.net>
Date: Fri, 14 Nov 2025 05:36:02 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] watchdog: Add driver for Gunyah Watchdog
To: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
 <20251114-gunyah_watchdog-v7-2-f5c155b941d5@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251114-gunyah_watchdog-v7-2-f5c155b941d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/25 23:57, Hrishabh Rajput via B4 Relay wrote:
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
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>   MAINTAINERS                   |   1 +
>   drivers/watchdog/Kconfig      |  13 +++
>   drivers/watchdog/Makefile     |   1 +
>   drivers/watchdog/gunyah_wdt.c | 260 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 275 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddecf1ef3bed..f80e762aa324 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3215,6 +3215,7 @@ F:	arch/arm64/boot/dts/qcom/
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
> index 000000000000..addfd1733ad1
> --- /dev/null
> +++ b/drivers/watchdog/gunyah_wdt.c
> @@ -0,0 +1,260 @@
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
> +		return ret;
> +	}
> +
> +	timeout_ms = wdd->timeout * 1000;
> +	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME, timeout_ms, timeout_ms);
> +	if (ret) {
> +		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0);
> +	if (ret)
> +		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static int gunyah_wdt_stop(struct watchdog_device *wdd)
> +{
> +	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
> +}
> +
> +static int gunyah_wdt_ping(struct watchdog_device *wdd)
> +{
> +	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0);
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
> +static int gunyah_wdt_get_time_since_last_ping(void)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_smc(GUNYAH_WDT_STATUS, 0, 0, &res);
> +	if (res.a0)
> +		return gunyah_error_remap(res.a0);
> +
> +	return res.a2 / 1000;
> +}
> +
> +static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	int seconds_since_last_ping;
> +
> +	seconds_since_last_ping = gunyah_wdt_get_time_since_last_ping();
> +	if (seconds_since_last_ping < 0 ||
> +	    seconds_since_last_ping > wdd->timeout)
> +		return 0;
> +
> +	return wdd->timeout - seconds_since_last_ping;
> +}
> +
> +static int gunyah_wdt_restart(struct watchdog_device *wdd,
> +			      unsigned long action, void *data)
> +{
> +	/* Set timeout to 1ms and send a ping */
> +	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
> +	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1);
> +	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0);
> +	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0);
> +
> +	/* Wait to make sure reset occurs */
> +	mdelay(100);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info gunyah_wdt_info = {
> +	.identity = "Gunyah Watchdog",
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
> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "status check failed\n");
> +		return ret;

 From the context, it seems to me that this should fail silently with -ENODEV
if the function returns -EOPNOTSUPP (not implemented).

Guenter


