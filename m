Return-Path: <linux-watchdog+bounces-3242-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854DA80929
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 14:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4B008C0B29
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 12:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D46126A1D8;
	Tue,  8 Apr 2025 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsF2bOyM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA3A1AAA32;
	Tue,  8 Apr 2025 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115597; cv=none; b=qXFOyh1rD8qCED9YH7dkjzUDuOenO3Icw4Tu9PR1Bk9OifHwZre3vu4BEm3Cqr8FlIB3zjf8qANTOhmgeGfEl6eft4f9CL+oVtp+hvBrPp4rIIEqz29VFbuk+a7DsHZIlNbsQ90DEkliKcgbZFXO8vom357cfPny4JEI7N91wqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115597; c=relaxed/simple;
	bh=wUf1I3G91DtSOH9aKzGyhBVYA1gBjDZ6llSyIbkY0WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NY13HZkgREab1RB8BvE/upT95E44XvtFKxB41uDEdhu6//DUvHqz3ypbbEGxRES8Uzb0bt7AxtO7XPBzXP/XgE23SQk9Tm3xFNcHvO9kx5/+HxpxV5fUbnHiXoUHWdORdmzSKEIXiwxxaFBXHjLRhgvZG1df7QZ0b3ZslQ5vUxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsF2bOyM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225477548e1so50773905ad.0;
        Tue, 08 Apr 2025 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744115595; x=1744720395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/nF9UHsTjavBiIQDEA/vItUfmoGpLwv3vVUwf7BNWYQ=;
        b=MsF2bOyMVnryeZ8VMGVewJpYt4OOEgE+OCWaL166Y9V5NkZMUnT+vHk/tr09z10maV
         y5jyuYKY+amOw1HZZISq5bvJi0KrPIFKgk1F+7tPIvhPvp36+O3cr/dOi5XD4/IPHBOl
         Itm96wjtxUkGcnUmct/6kT/F5nmDGYd04A9LxM57IGBEcs3/50JHtP+8p00euVomXg6m
         R+tgJiNhiAKulX6sH7sEG3jdY8sQkqc4xT8uJJnLocJ1VC7DKvhel+cJvrm1/+zxoxPG
         Mzq9p2/9NHXacl54IU7uURRZiutrylbD7QKaaUw3LJqRl8yUP4B5QKpzjLg1TYq7v8zl
         HpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115595; x=1744720395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nF9UHsTjavBiIQDEA/vItUfmoGpLwv3vVUwf7BNWYQ=;
        b=Yhnq4mHVIul4TDxxIEgANu9JoGJ1v3n+ODFMi8HNUEnjozBCkDOQqIAhensJ93wMd7
         /LVbAKG3psqSHS+DyAJ0FA55p/M9OBnzoSQbCEfyHeYkVuyTyT4k0fZOuMpesSjHLX1Z
         E8YexVCQ1Th1RUaOiBa657HM0Q9Zcl8X9GOjb2zJzMogipO8fGUXQtRj+/pthh4t+mYL
         uxgP7mF9nLk2YQr/Mk3yRFbkiBtHYxdZcTI69tjGsIEdEW0Zt2mJ+B0kti0Kl1GTpnbv
         b4LL+COw0rxkTbakNpR0lKzpN3TYukAVH6cb3sqIJZ3OIht2P+17Nx2CaBAVBWjF3wey
         9Xxw==
X-Forwarded-Encrypted: i=1; AJvYcCUecZJkfWhyO2EDp4iPPwNnd81RQ0w4+8snCQ7ghVtr93k/tSOiCPY5QIMlTkpDpUyGlXDuoKh57Xcd@vger.kernel.org, AJvYcCV5Y/5w16DEBYT2WdZUghmwDU8+2MzQkNcITCdpA/czS9e+Dky7zb6X3O5E8yF3m3bLI9PdC1mmXZ5v5DdR@vger.kernel.org, AJvYcCVxN2iHtLBX1TheRZFoaKWvW4fiLAKU470YWGW9RsFI/2VgAK+hNHij4Wm9QldB90hoKkRi0abIK/sKw/JQN0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZX0qRMJQIcXMwbsMm+Xw6qvfvnCk3ZZBBOZmuLA+FCtTFQdSz
	76E1uIhffgcZRGm8nK1GtnF8Eg9C/OBgYxex6IRjiu9aYpKv0oFe
X-Gm-Gg: ASbGncv16I0q91+PAJo2XOJ/qBMqoIXoyK0XdULOboaUArSvu9lq3EXb1cTE5wMzBcH
	qqkaQPOJWmKLPZJ0vpbkN5MZGr5c8PJy0EYGl+S1uzF80uim404x9kGMMXDF6LgP+4JKa1Jj8zQ
	TwahZuhGla5EVETosI2tY3QMchAr71S2v6XnAYGsRjyWIsENJnzDxUDTPBK+o+ocaadkHireDKp
	gnvdwYN5MjUBkBRPw9ZPfzocs1E3YRRbeeIyKJFi+odh0GHMexRmMXW/5kVNa0cs5z+XctjxQqP
	s6d12XxA7lIAdIEaTJpCygzplgtJJgQwM+WY/DGWQrRvtg9UFJLrEi+KOK9qquLMV7eodtlii8A
	e6c6xfLs6JFIBx2G+jA==
X-Google-Smtp-Source: AGHT+IFPKxw0kQu5TDkKvHbyIFUGFcpYxBGmNw870k+hopqQQs5wQGQiZg50KgRRxbLhvgP+K93CBw==
X-Received: by 2002:a17:903:1a10:b0:224:216e:3342 with SMTP id d9443c01a7336-22a8a8e3d97mr225074215ad.43.1744115594771;
        Tue, 08 Apr 2025 05:33:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978771c07sm98918465ad.212.2025.04.08.05.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 05:33:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e02e7431-2e30-4e65-b04b-15fbb0bcd8d0@roeck-us.net>
Date: Tue, 8 Apr 2025 05:33:12 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] watchdog: qcom-wdt: add support to read the
 restart reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-5-e6ec30c2c926@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250408-wdt_reset_reason-v1-5-e6ec30c2c926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 01:49, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was restarted
> due to WDT expiry, bootloaders update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   drivers/watchdog/qcom-wdt.c | 40 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..54d6eaa132ab9f63e1312a69ad51b7a14f78fe2d 100644
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
> @@ -22,6 +23,8 @@ enum wdt_reg {
>   
>   #define QCOM_WDT_ENABLE		BIT(0)
>   
> +#define NON_SECURE_WDT_RESET	0x5
> +
>   static const u32 reg_offset_data_apcs_tmr[] = {
>   	[WDT_RST] = 0x38,
>   	[WDT_EN] = 0x40,
> @@ -187,6 +190,39 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>   	.max_tick_count = 0xFFFFFU,
>   };
>   
> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt)
> +{
> +	struct device_node *np;
> +	struct resource imem;
> +	void __iomem *base;
> +	int ret;
> +
> +	np = of_find_compatible_node(NULL, NULL, "qcom,restart-reason-info");
> +	if (!np)
> +		return -ENOENT;
> +
> +	ret = of_address_to_resource(np, 0, &imem);
> +	of_node_put(np);
> +	if (ret < 0) {
> +		dev_err(wdt->wdd.parent, "can't translate OF node address\n");
> +		return ret;
> +	}
> +
> +	base = ioremap(imem.start, resource_size(&imem));
> +	if (!base) {
> +		dev_err(wdt->wdd.parent, "failed to map restart reason info region\n");
> +		return -ENOMEM;
> +	}
> +
> +	memcpy_fromio(&ret, base, sizeof(ret));
> +	iounmap(base);
> +
> +	if (ret == NON_SECURE_WDT_RESET)
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	return 0;
> +}
> +
>   static int qcom_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -267,7 +303,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>   	wdt->wdd.parent = dev;
>   	wdt->layout = data->offset;
>   
> -	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> +	ret = qcom_wdt_get_restart_reason(wdt);
> +	if (ret == -ENOENT &&
> +	    readl(wdt_addr(wdt, WDT_STS)) & 1)
>   		wdt->wdd.bootstatus = WDIOF_CARDRESET;

This ignores all other error returns from qcom_wdt_get_restart_reason(),
but in that function it generates several dev_err(). Either make those
messages less than an error, or treat them as error and drop out here.

Thanks,
Guenter


