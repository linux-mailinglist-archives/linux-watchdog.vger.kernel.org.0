Return-Path: <linux-watchdog+bounces-3415-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90327AA73C8
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 15:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E90E4168A35
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 13:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC0D2522AB;
	Fri,  2 May 2025 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6C9HHEM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C2182;
	Fri,  2 May 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192839; cv=none; b=L+z5PXCnV3ftpUOtldAKaxtHUInwbRhzy4URGiZt3A8RlCG3S9lSWVyBiKg34+SGFHaNeaIudrWjIDMzZJPy2KL1zDIX1h8OvVOxNCWD/L+TPb1/bSLRSCtwXQiUyv+kCV3ytLC6Q58boFCTGV99sG4qAl0RHym2os1oa6JvL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192839; c=relaxed/simple;
	bh=p3uamlHZayQCiI4Y/IVO1eAkOmzkebRcGSVv/2xLPbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jloUCSUna454lAi+3dC2Y0yroYd5XTUX32j/Wr5DML6edf/R24d0tlZrmq1l3pJEtmClqCwCCgITXXLrcKG2hLCncKA+3xpYF/le/LP84B8oPqUoNPNkMwQ/K3pgzmD4qQACEW6K8Zosdrla0EI6+jJWtM3bDYH/TcwEY1bPs64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6C9HHEM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736aaeed234so1859187b3a.0;
        Fri, 02 May 2025 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746192837; x=1746797637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5aBoY+zrWtlruLTzjERnQLm7/ZSUbk+rmwguZmkmn5c=;
        b=H6C9HHEMvtezO8ozkMLFOdE9EyGJbaM/6IDPqPphX8jf4EQoQ7e+4bdr89XzN+cItS
         aFbmjnFN34SvkSKBAMhEb37JvSTc9xu6Z3XIvpUD2iXPpXATJYdk29xHGzzuOzBNAAVG
         Gl7rZxRiVKBI54A8Z3nmtjgRGtHDubZz9sdH9lJL3IUnoX5+/OK0qE+7Jrj2QNNmjas0
         GhxmED4ScEEOUZFDRcKa1F/9KIYusPu/X4/jMitX2yPQJeEWLa9gMWy71k+d8+I2dIXW
         N5QDV6dWdzb9FYctDArfvjFdhw2EN7/95fJSCF03wEoE2+XZ65BU2Gk2hIGSyFjOS13C
         Xznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192837; x=1746797637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aBoY+zrWtlruLTzjERnQLm7/ZSUbk+rmwguZmkmn5c=;
        b=E2vnY74dAc1n/lmEPptWMONDj1INuy342bFxKRUX4TpSpxvvpGCdxDPiyIqSAp7NLI
         oD5rmmBeTG/kocEDrEPdNnl8NZVVPxuiKo4yeFB4M4LGIIwj+/04pBI4cpr8Yn/wglc5
         cmCuq1De4l0NiqGBiZLaD4P8WWCmuJthf4tyFdBaoxx3oQoP75//jgGNizv5H+53/1LF
         bICbVnx7rG3RkGoruHTfFE4Md5Yy9L/Y8bwXoFz0x7ljOEoD1uqDTKvlPW7p2k5ykEI1
         6zd7lpaqtKvEpZgdJSdekxM56YF5V4pCiLo1qmgwQwKinBrS+opr7EXnt7IoZTs5NnG+
         Yr+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDnLMoTfsisMgKUqBoywxsYyXnC1OYDMJN5kGiRS7jX6Gk3NPlgsy0g5qXIAWQtiatk66sef27NBK+@vger.kernel.org, AJvYcCVTAggtqWjAIR6jieJr4oN6DI+/0VyJfcBGA4gO0xmW/jB56bteWec0XTSOJDbT+LRvOi5Z9b5ZTQI2t26ffWA=@vger.kernel.org, AJvYcCXSXbSSZD3d81SRmK3p7gBrY/M0TFzFr65zXyvdP7gtliAutAfCffrQTtfwcvqm70m2L8lOULhMnPdQrbsr@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgq1QbVvZoZmhWIFmG8VbOWysCRG4++YNuvGRyypna8olNFoj
	OcaSxUyEc+7ZkYjgfK1k9/SGvTjB1hUZqwI45ArpXaz9rtQ2PUMZJlM1gQ==
X-Gm-Gg: ASbGncusvsUgdZVU2quOr7XwI9e/tcAgb95gsOA+DYLS1KUP+YF9cyQ8nbrXjppjmlm
	sNLRDB2zS13MU7FBHVAeYmo0pILUblwagPBke4qzMovRITkdfmaIb7sAaIAsj295JLqs+j93ZX+
	s/Y/JRXzsp7fSypUDOVIzyNDdIjA1aY7nWPCouxlSp/ftG589lB9H4AC3KvOj3bCEfzSBeql7NB
	otFJzwo7M/bdyvcuxI8bq8LCAKrDAnnw2UnvEiDSPliq/G10Y5ZPuEkbq2ggNzJRQDn/IkYK5ou
	OFQYRaCRjdDh3su38V70l4ahFa1tYOAy8bThJvkTjBp+5Uf2V4Gknf/9WzGgrOp+zPEbhGqDH8w
	LRLBXz3RduT18Gppjbias68RL
X-Google-Smtp-Source: AGHT+IEuK2DaM5ooUxQ3ZXCHx+6/AU2aCtLexk5RPVYt2XwVnuG1SV9qPSGLuZXxyQoUNBgFkpbNgg==
X-Received: by 2002:aa7:9313:0:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-74058ae3ac2mr3860482b3a.15.1746192837318;
        Fri, 02 May 2025 06:33:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a136esm1494424b3a.167.2025.05.02.06.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 06:33:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f8b57c99-2f6a-496b-a6fe-3e2aa6b0b989@roeck-us.net>
Date: Fri, 2 May 2025 06:33:55 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/25 06:17, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was
> restarted due to WDT expiry, XBL update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
> 
> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v3:
> 	- Split the introduction of device data into separate patch
> 	- s/bootloaders/XBL - for clarity of which bootloader is
> 	  involved
> 	- Mention the sysfs path on to extract this information
> 	- s/compatible/imem_compatible in the device data structure to
> 	  avoid the confusion / better naming
> Changes in v2:
> 	- Use the syscon API to access the IMEM region
> 	- Handle the error cases returned by qcom_wdt_get_restart_reason
> 	- Define device specific data to retrieve the IMEM compatible,
> 	  offset and the value for non secure WDT, which allows to
> 	  extend the support for other SoCs
> ---
>   drivers/watchdog/qcom-wdt.c | 40 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index dfaac5995c84c1f377023e6e62770c5548528a4c..f2cb8bfdf53a5090bcfff6ea3a23005b629ef948 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -7,9 +7,11 @@
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/watchdog.h>
>   
>   enum wdt_reg {
> @@ -42,6 +44,9 @@ struct qcom_wdt_match_data {
>   	const u32 *offset;
>   	bool pretimeout;
>   	u32 max_tick_count;
> +	const char *imem_compatible;
> +	unsigned int restart_reason_offset;
> +	unsigned int non_secure_wdt_val;
>   };
>   
>   struct qcom_wdt {
> @@ -185,6 +190,9 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
>   	.offset = reg_offset_data_kpss,
>   	.pretimeout = true,
>   	.max_tick_count = 0xFFFFFU,
> +	.imem_compatible = "qcom,ipq5424-imem",
> +	.restart_reason_offset = 0x7b0,
> +	.non_secure_wdt_val = 0x5,
>   };
>   
>   static const struct qcom_wdt_match_data match_data_kpss = {
> @@ -193,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>   	.max_tick_count = 0xFFFFFU,
>   };
>   
> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> +					const struct qcom_wdt_match_data *data)
> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> +	if (IS_ERR(imem))
> +		return PTR_ERR(imem);
> +
> +	ret = regmap_read(imem, data->restart_reason_offset, &val);
> +	if (ret) {
> +		dev_err(wdt->wdd.parent, "failed to read the restart reason info\n");
> +		return ret;
> +	}
> +
> +	if (val == data->non_secure_wdt_val)
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	return 0;
> +}
> +
>   static int qcom_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>   	wdt->wdd.parent = dev;
>   	wdt->layout = data->offset;
>   
> -	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	ret = qcom_wdt_get_restart_reason(wdt, data);
> +	if (ret == -ENODEV) {
> +		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> +			wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	} else if (ret) {
> +		return ret;
> +	}

Seems odd to me that there is now a function qcom_wdt_get_restart_reason()
but it doesn't handle all means to get the restart reason. Maybe I missed it,
but what is the reason for that ? Why not move reading WDT_STS into
qcom_wdt_get_restart_reason() as well ?

Guenter


>   
>   	/*
>   	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
> 


