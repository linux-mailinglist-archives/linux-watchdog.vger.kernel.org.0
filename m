Return-Path: <linux-watchdog+bounces-2423-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6FA9BF0E7
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 15:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CEC71F2300D
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 14:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD7D18BBBB;
	Wed,  6 Nov 2024 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYb9o7aW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B031E767B;
	Wed,  6 Nov 2024 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730905038; cv=none; b=tmtQo1JddfnbSqsL82TjP0RyC0S7C8Iixp3SshqZvagCg7/Gw+YGYIS8UjuBc5lyVV+K4dpGvLrJ3CDj4P/IJT+W78gTzGX7NZFPQgVsAZQ27jOHZmvUBG1bwBjKh/elLybldg7jnGn/uliZvZ619W+6wxzZYbppdhxpWOHkz4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730905038; c=relaxed/simple;
	bh=sAqOR0dGPBtFwTJ71ZUgMpuHpwkDzlzgdXbrj9+4m3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuiCwpr/LvMtJamtdUZgiKkY9MBm0HPnXysz1E1uWGrWm53phdlZBDbQF4Clt5KXaLQAnzg8ngMe6+0R0frNrsVO9HfEF6etsVFSmLlf9pL85fYy3x2KdXRhKNos2GaFZyneWQb0tBswppsVUb6PhxcvyrlADzNgySPNM3svpWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYb9o7aW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c9978a221so70148995ad.1;
        Wed, 06 Nov 2024 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730905035; x=1731509835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9un1oqqphPvuz/LlacJPYk650tZim9kSbvAUxteUe0c=;
        b=gYb9o7aWjUdboowzUb1QqKRaO9ewsOus5sp+5VtOadq/K9Rl1XRTIx0dvv7Q+iGoEp
         +80QVhk0kiMmARL9npViLzOd4+UHzG2Ms4zlbETd13DXue+t1wLCRgjQALb/VP4Z+Fn7
         J1UTB8FiB18W7G7pFg6fgRSYQ8C642o9tpyleGrLVcKb2baAtPSdf69oebY7Ag7tft0A
         rVpiDUoByBTOf8o8+LRNlgEXU6Aj1hfp3w+Xdp3KT+dd6vKVb+YUhXd+ZutUHZ4ZVDn5
         N+O5rGepJy+BtPHxPmSsHfKaZe+dLMTov/R7sPiKD8pdqpt4O89NmSfLQonBn9E+SDoV
         YJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730905035; x=1731509835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9un1oqqphPvuz/LlacJPYk650tZim9kSbvAUxteUe0c=;
        b=ITOS+Cefr7ZmpWRDwZdjuO6E168NRzDn+0RhukkTevY3dsztpn9Y7SiR6A9KeJ7/UW
         rEIRNloBILJTdru/qhM9S3ynJ1/FjBHCUMcWIPFogWV4UWNpZPJA62NmBMe1oxR8D1Jh
         foh8ySgl8BurKycZerzoCsM4SDLMkZqyDmhRg6Ph+E/brLE1oSRhm+XX2qo1RBbRQqhJ
         rIQSBHd/FhfMJc0NxzIAij2opeXCa7TsBDFuG+6sNEDYvHhjAU8CrsTyPQt84ysHftIL
         8p/V9uAl7DJdnTBQI6yb/MxoAEuEWdveGjwJEXvl7ohFBaeCaqP9zh2ERwm4dfJsPXsG
         r/qA==
X-Forwarded-Encrypted: i=1; AJvYcCVqCM+kpCyBfN5nsEPMCbl+Jwf8v2bQbLuSJzsJS6BpfpRgBIDA/6/pcmVEEIWFQxtGweaE0NMhtYc5qUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJ/q6Xtgo77c4JVni5z9vihWGlRZtz+7WPCPKSY51YNdHDeP+
	Syjjgj2bf4RHFoB4rFkZ7IrLm3FN+HWXSrr6yWU2r1a9asRoyl8Y
X-Google-Smtp-Source: AGHT+IFtgAKfA6kWLbPTvJs2W8mYXVSRcHx8IIOvlPoTUmyZTR/20DKsCiKGX3HsMpj+FqOcI8F1gA==
X-Received: by 2002:a17:902:f607:b0:20b:ab4b:544a with SMTP id d9443c01a7336-210c6c6d591mr586992085ad.43.1730905034032;
        Wed, 06 Nov 2024 06:57:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c0ec7sm96453795ad.202.2024.11.06.06.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 06:57:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1d801e59-341d-4f2f-88ca-98277731bd83@roeck-us.net>
Date: Wed, 6 Nov 2024 06:57:11 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] watchdog: mediatek: Fix mtk_wdt_restart
To: Yassine Oudjana <y.oudjana@protonmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
 <20241106104738.195968-2-y.oudjana@protonmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106104738.195968-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/24 02:47, Yassine Oudjana wrote:
> Clear the IRQ enable bit of WDT_MODE before asserting software reset
> in order to make TOPRGU issue a system reset signal instead of an IRQ.
> 
> Fixes: a44a45536f7b ("watchdog: Add driver for Mediatek watchdog")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index c35f85ce8d69c..e2d7a57d6ea2e 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -225,9 +225,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>   {
>   	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>   	void __iomem *wdt_base;
> +	u32 reg;
>   
>   	wdt_base = mtk_wdt->wdt_base;
>   
> +	/* Enable reset in order to issue a system reset instead of an IRQ */
> +	reg = readl(wdt_base + WDT_MODE);
> +	reg &= ~WDT_MODE_IRQ_EN;
> +	writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> +
>   	while (1) {
>   		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
>   		mdelay(5);


