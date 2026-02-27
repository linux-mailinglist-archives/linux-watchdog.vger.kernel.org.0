Return-Path: <linux-watchdog+bounces-5001-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCwuER1LoWkKsAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5001-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:43:25 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF71B40B3
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 635293045008
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 07:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FB61925BC;
	Fri, 27 Feb 2026 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUeZZOls"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA3345CB2
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178144; cv=none; b=TRLJTgttRGuX/bCXKL1k7GKb31l75AwVUlCQfSmdrm6C7PMtzR5is9RvYAHraQdQdYItOHoNm4sgJkx3MHwPV8Htlbh7d5wMV4wLwNbdfpY/neBtQQN9J0SKkjNQuJEoJard7vt+/jHSmGfaOrbdwrXkbwU6pTSKwzvuQYak32c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178144; c=relaxed/simple;
	bh=wnp1Lq8mmX33B8twyR7sFcRofmw9bR6EbHCp61lLaCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWGYBGpTuzVRv4zBwGwFZehkigqi6iOAMMcnBMZlWkfAhi85OpENctaQeA+PLPAyWsE/3hwtwsqjhdsNM76DClBOMRfssWZm9qaOqOCWo4dmSiz0+ncAVDtOmeSNzXKwNjkPcjCDP+WrF2cw7H1CUPYval4PfrgMOzDAe4GTpjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUeZZOls; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8249fc726e9so1069935b3a.2
        for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 23:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772178143; x=1772782943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RSpBFk6h7GjXDnU1XJIlOR6UlooIlnl0CsiskOpIsE0=;
        b=AUeZZOlswcxNYNsbOtVIhiYMSPkhC4p/SX0dSp6mcCHcDMIxNmYAaDRyHNtrFenQX0
         kfq8wG+527JGC6Zx24Lmo6Mrz8TatvNLUsBbjzQxmt5/soQvXfmH3lsRnxNE+m4H0KCF
         Nd6e2PAxAN0kYdXbI/OgA1kVGbHP2edHExna4e3VgDRiJf7JfUfPDf6C2blD1Ml23jbl
         ISY1PNDmgmm3iaPvUaHQW3mM31erqql5sPIL4vwjY9lDg9X+CF154pPQ8g5KaEtYa9oc
         V40hWyW9I3vV7bkQyauvKQV6KTQmPsOYwPV07vKUJ0CDNODNehemaovl0jTuBsvRZH7B
         /VGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772178143; x=1772782943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSpBFk6h7GjXDnU1XJIlOR6UlooIlnl0CsiskOpIsE0=;
        b=e2qp7zkjENtlreCfAj1w6Lc/1M3YD1UbPblGYA2uGDnmet0Rg6Jo2Cwrz0LurFsRL1
         MWYZxJn0wnxOAnUOax3W74JBG1jrtwwi4cM0eXTyGTZ2QQY9mUNeGidsrP8z+qzJGxAt
         78ohAh83ojQ0Z6Ep0Gbhs8GC1Z31H8nwCCuNIw1Fg5mp4/ZSL0LAjnm7vkEy8NhjMgOH
         SrQLTVhnhOe2cmjSvRyb0GpTbIb5bCM4BekCGZurgmpFX9GpuhA8zvdygs6OWehKUTnK
         /n5N9I98h185kn4qpCUZzXz2cT8ZDASxFWg6hi8FvP6ED1cIX7Sq32KeezCqbOQH7Q28
         UDRg==
X-Forwarded-Encrypted: i=1; AJvYcCW3TBqlJxhinUglc9r2+/hOJElDGk4OpepWI4t0OdMzTvm9zNocj/5h7Ne6uwMt0sLuhW7pb/+U8gC4Xj1+Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1tTsBup2l0hbO7uAdFiJTGXj/WG1eCj/dvh5CcvS2JaUSej4W
	hrDP/6W8CwfaCHxa7VTiQ3qYUctKm4PHmDaZXmxOGhEbLabmPeEAgeZg
X-Gm-Gg: ATEYQzxdO19IDxhN51hrkCQ5GUaHLYQ2Eju+d78Lij94NcCVPJIg406G2YJ/Q0ItKzd
	vB8BqhgrCQTmMs/xuZeHEdpJx/3KFESWLcQO3AU3CHjkSf01ivo8mm99mrrCNBgRMyP36Sjt8+F
	IuZNLJbz5SqS83OWEGsXUbZw/MkqUetfUhCHx5Q7ucDT6Fe9d/c7W+2GvJYB9M+7A9G63CcZl4y
	MxAed6lALNFI8qNGT0zlV4QVKcWEb1bMZBBOX0MU4f8Qvqk6IOjHuGmn4xdquvTO0IJoJR4ophQ
	Av/a+M96Kp29zHKBSf1FSbVF9QK6kL+v2Y73jtUR9GfwM8zcIESx8kX1YhKaJVdLiq6Lj2zdtcj
	t5mh7ENpjYGzqVGxPW6co9nXWmi6CDNxxHbcW32baWP9fUC8P17l2DN89gf7wS+/1OzlFvou31f
	DUyniS0HqzS/wBdtd7fFTjB/M8YpDB/Vcmsywr+/yzZAHT7jSZOEWCstYUzx8k138ZE9ggauBjG
	II+sSfZaHE=
X-Received: by 2002:a05:6a00:301f:b0:81f:852b:a91e with SMTP id d2e1a72fcca58-8274da3a29emr1774463b3a.59.1772178142752;
        Thu, 26 Feb 2026 23:42:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d87e78sm5139592b3a.17.2026.02.26.23.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 23:42:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Date: Thu, 26 Feb 2026 23:42:19 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
 <20260226-wdt_reset_reason-v8-4-011c3a8cb6ff@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260226-wdt_reset_reason-v8-4-011c3a8cb6ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5001-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,roeck-us.net:mid]
X-Rspamd-Queue-Id: 91BF71B40B3
X-Rspamd-Action: no action

On 2/26/26 08:59, Kathiravan Thirumoorthy wrote:
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
> function qcom_wdt_get_bootstatus() to read the restart reason from
> IMEM.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v8:
> 	- Picked up the R-b tag
> 	- Updated the comment as suggested by Konrad
> Changes in v7:
> 	- no changes
> Changes in v6:
> 	- Reworked to get the restart reason code from SRAM region
> 
> Changes in v5:
> 	- Use dev_err_probe instead of dev_err
> 
> Changes in v4:
> 	- Kept only WDIOF_CARDRESET and dropped other codes
> 	- Renamed qcom_wdt_get_reason_reason() to
> 	  qcom_wdt_get_bootstatus()
> 	- Moved the existing check inside qcom_wdt_get_bootstatus()
> 	- Dropped the device data and put all the details in the DT node
> 
> Changes in v3:
> 	- Split the introduction of device data into separate patch
> 	- s/bootloaders/XBL - for clarity of which bootloader is
> 	  involved
> 	- Mention the sysfs path on to extract this information
> 	- s/compatible/imem_compatible in the device data structure to
> 	  avoid the confusion / better naming
> 
> Changes in v2:
> 	- Use the syscon API to access the IMEM region
> 	- Handle the error cases returned by qcom_wdt_get_restart_reason
> 	- Define device specific data to retrieve the IMEM compatible,
> 	  offset and the value for non secure WDT, which allows to
> 	  extend the support for other SoCs
> ---
>   drivers/watchdog/qcom-wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index dfaac5995c84c1f377023e6e62770c5548528a4c..bbf229a7b5840714b9429f4b092ec3f7a6a26961 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -9,6 +9,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/watchdog.h>
>   
> @@ -42,6 +43,7 @@ struct qcom_wdt_match_data {
>   	const u32 *offset;
>   	bool pretimeout;
>   	u32 max_tick_count;
> +	u32 wdt_reason_val;
>   };
>   
>   struct qcom_wdt {
> @@ -185,6 +187,7 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
>   	.offset = reg_offset_data_kpss,
>   	.pretimeout = true,
>   	.max_tick_count = 0xFFFFFU,
> +	.wdt_reason_val = 5,
>   };
>   
>   static const struct qcom_wdt_match_data match_data_kpss = {
> @@ -193,6 +196,40 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>   	.max_tick_count = 0xFFFFFU,
>   };
>   
> +static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
> +				   u32 val)
> +{
> +	struct device_node *imem;
> +	struct resource res;
> +	void __iomem *addr;
> +	int ret;
> +
> +	imem = of_parse_phandle(dev->of_node, "sram", 0);
> +	if (!imem) {
> +		/* Read the EXPIRED_STATUS bit as a fallback */
> +		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> +			wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +		return 0;
> +	}
> +
> +	ret = of_address_to_resource(imem, 0, &res);
> +	of_node_put(imem);
> +	if (ret)
> +		return ret;
> +
> +	addr = ioremap(res.start, resource_size(&res));
> +	if (!addr)
> +		return -ENOMEM;
> +
> +	if (readl(addr) == val)
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	iounmap(addr);
> +
> +	return 0;
> +}
> +
>   static int qcom_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -273,8 +310,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>   	wdt->wdd.parent = dev;
>   	wdt->layout = data->offset;
>   
> -	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
> +	if (ret)
> +		return ret;
>   

Why is reporting the boot status so important that the failure to read it
results in refusing to instantiate the driver ? That warrants a detailed
explanation, even more so since it is not backward compatible.

Guenter

>   	/*
>   	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
> 


