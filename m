Return-Path: <linux-watchdog+bounces-4924-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PPtB7NWi2lIUAAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4924-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 17:02:59 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD311CE61
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 17:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBD4F303F7DB
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 16:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19D3876B7;
	Tue, 10 Feb 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLGtX2uA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CDC366DDE
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739360; cv=none; b=hmoHCzzCYDjeirZ/6QkvlLrazKYusIpbDaagBn9sZ1B8iJJxOSg/sv7ibwtuWyfYkqLhZRTwmoL6zQML2ONUi3gXhQwkP/YcD7fz8rQVEBoXzXpTjHhcdxVOpLYUhtNDYTrpCKanxzEdTOztw2zVAm+PZ6smqUUGoPTjek092Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739360; c=relaxed/simple;
	bh=VS0eY8WcAfG/iyqBEZTT6cHjNqV5dr29Qzs0B18lGXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/KAxGJeD/5UtT4CLnTH4NVmTEob011hraupCfXaOG7ZzFIgLti5SSMxgYyCKeJ4UXvcXT7sB0d9yhHHDw78vNk98z/9KYAGbHkdrQ8Pbk4NReV+jTFp7vLQc4U0aUjL1kALRj095QECaV7wLhrR+9puok0ROlEl4SgO6g1GPVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLGtX2uA; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124a95e592fso324633c88.0
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 08:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770739357; x=1771344157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3cNNl5pPhcYluAPwoEK8QbImmnq0y2snMiJMPCDs958=;
        b=SLGtX2uA7WFUBIxxi+zc1QQQjDsJ+Y+WX6ZPAl/BG5Mb/dOhytsPWlSDiBFzO/oNXm
         54vvxooaXscPiUf21XxOEr/pZCuS8IlfU++IgvwGdU6rBPkzubH+nYwlIhZbGOCYKecP
         ADcKd/YZReTKtDm1uc0l17+wpxgrUgudAo2K9pY/e71MXFJ5/oOsMBF1iWKsQ2p0L/9E
         hV/uYp0WGW8vQ0mYTGKSaA0tk0nP8Cq9rU2pHXaSOxeEkAIpEHkbcV5rDEB7r6n3NFo4
         mcjB33FLsRdZvrLxpNL381m9XR9lV3DUa8C9/9pVY9NCmT/naVPlKsp0Tn7sOugCF4Eb
         UKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739357; x=1771344157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cNNl5pPhcYluAPwoEK8QbImmnq0y2snMiJMPCDs958=;
        b=lRslD6ImN+S6Osq6RrTx+TKKNbb47cBiBOUgOicFXuOEFsFETZazF5ZVQGrNEq81rh
         tx7OWyveQ6m/DNHdv4Dm+5DErzf9VpHgafPIZfy+jnFG0ZtLAvhXPupu0Mn6u8kF5ZVz
         a54cbITM1tXuLmJHxP5z6xEyavPYJh6gPFJbn9fhKhMQ+56SNCMSuITrT8LpMKHPEO0j
         roIsmKZuFfOEL9/23nsFxstreIRVhgSODkA60zu26eB1Pke7CWuXdtRtir0JVqw/bj9e
         RgzhvF8qoiJ3YImWsqtN3DnClGYiVYH+ihQNm3Rheb38dyLK9oTE77g8XvQd22g8W80a
         zDRg==
X-Forwarded-Encrypted: i=1; AJvYcCXOBy9aAgXrWAvcXL6NhcNlVjGEhQRN29IixykHQ7ogU6QoaYxkoUQvC81qTP7xfCSgE62BcVcRXpOExjFtBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99aQxUGbJv75bQJGxL8vLP19hpakdGylllE7+pueER33TNDRx
	htYR5oyyvY8hR5zGo69lRLJ+G42nABB+tAhCdGPVzdXu8AOVhmSTuh5v
X-Gm-Gg: AZuq6aL0/LZn4Wq52TLQG8x/LkxY7Yhnz9lNRcIXr0WQ4zETU93pfYGCWR9+s5ehxfH
	1AFK3ndiJskRKI/zYQ+jKnbEvnL3QdTXjm5KNKT6nUb4QJeX4vTnLOSEPgKrPor+mttEhHW6Msv
	iUB0o3EHOd+VUkvZqKPlTkWUxMOSE2IuMg1Jhb2Svc+3jKIh39tk6Hfbe+9DH835XrhVR790IWK
	t0V/q5iPIKbXwQ9pf7rUS7KKCkwMQDWeVCf++2F1jeGjH/QK7P7OsvUwzFkLjeVbNJrAIez3y+N
	MN6rPT+17jf6J8c1VBp0IizcwC1OcASU6u7k1lrsje4gH5Q9/6V1ms9kclUnHxlDd1xwnUN5pqh
	RsHOl1dIwD3R6yvRxdjd7ki++VEowxD2Z1ssDJHBtPtDVH2x6eWZ3KC4ryUhaW7WgbdC1l8p519
	uOl1Cr5espB6slhGiNTPwWC/i8ouUxQovbxWNr/86+kM+quJxV6UUDWSDiEIvn0f+WDcET0HWL6
	5yllSw4mpw=
X-Received: by 2002:a05:7022:301:b0:122:345:a948 with SMTP id a92af1059eb24-1270419f523mr7904093c88.46.1770739357072;
        Tue, 10 Feb 2026 08:02:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433abdfsm11577096c88.12.2026.02.10.08.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 08:02:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e946baf7-4c3e-42a6-9cd2-a4b917ce09bf@roeck-us.net>
Date: Tue, 10 Feb 2026 08:02:34 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] watchdog: npcm: Add reset status support
To: Tomer Maimon <tmaimon77@gmail.com>, andrew@codeconstruct.com.au,
 avifishman70@gmail.com, tali.perry1@gmail.com, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: venture@google.com, yuenn@google.com, benjaminfair@google.com,
 joel@jms.id.au, openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-3-tmaimon77@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260210133843.1078463-3-tmaimon77@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com,codeconstruct.com.au,linux-watchdog.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4924-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4CD311CE61
X-Rspamd-Action: no action

On 2/10/26 05:38, Tomer Maimon wrote:
> Add reset status detection for NPCM watchdog driver on both NPCM7XX and
> NPCM8XX platforms. Implement GCR register integration via syscon for
> reset status detection and configurable reset type mapping via device
> tree properties.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>   drivers/watchdog/npcm_wdt.c | 110 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index e62ea054bc61..ebece5d6240a 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -12,9 +12,25 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <linux/watchdog.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define NPCM7XX_RESSR_OFFSET	0x6C
> +#define NPCM7XX_INTCR2_OFFSET	0x60
>   
>   #define NPCM_WTCR	0x1C
>   
> +#define NPCM7XX_PORST	BIT(31)
> +#define NPCM7XX_CORST	BIT(30)
> +#define NPCM7XX_WD0RST	BIT(29)
> +#define NPCM7XX_WD1RST	BIT(24)
> +#define NPCM7XX_WD2RST	BIT(23)
> +#define NPCM7XX_SWR1RST	BIT(28)
> +#define NPCM7XX_SWR2RST	BIT(27)
> +#define NPCM7XX_SWR3RST	BIT(26)
> +#define NPCM7XX_SWR4RST	BIT(25)
> +#define NPCM8XX_RST	(GENMASK(31, 23) | GENMASK(15, 12))
> +
>   #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
>   #define NPCM_WTE	BIT(7)			/* Enable */
>   #define NPCM_WTIE	BIT(6)			/* Enable irq */
> @@ -45,6 +61,9 @@ struct npcm_wdt {
>   	struct watchdog_device  wdd;
>   	void __iomem		*reg;
>   	struct clk		*clk;
> +	u32			card_reset;
> +	u32			ext1_reset;
> +	u32			ext2_reset;
>   };
>   
>   static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
> @@ -185,6 +204,95 @@ static const struct watchdog_ops npcm_wdt_ops = {
>   	.restart = npcm_wdt_restart,
>   };
>   
> +static u32 npcm_wdt_reset_type(const char *reset_type)
> +{
> +	if (!strcmp(reset_type, "porst"))
> +		return NPCM7XX_PORST;
> +	else if (!strcmp(reset_type, "corst"))
> +		return NPCM7XX_CORST;
> +	else if (!strcmp(reset_type, "wd0"))
> +		return NPCM7XX_WD0RST;
> +	else if (!strcmp(reset_type, "wd1"))
> +		return NPCM7XX_WD1RST;
> +	else if (!strcmp(reset_type, "wd2"))
> +		return NPCM7XX_WD2RST;
> +	else if (!strcmp(reset_type, "sw1"))
> +		return NPCM7XX_SWR1RST;
> +	else if (!strcmp(reset_type, "sw2"))
> +		return NPCM7XX_SWR2RST;
> +	else if (!strcmp(reset_type, "sw3"))
> +		return NPCM7XX_SWR3RST;
> +	else if (!strcmp(reset_type, "sw4"))
> +		return NPCM7XX_SWR4RST;
> +
> +	return 0;
> +}
> +
> +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
> +{
> +	const char *card_reset_type;
> +	const char *ext1_reset_type;
> +	const char *ext2_reset_type;
> +	struct regmap *gcr_regmap;
> +	u32 rstval, ressrval;
> +	int ret;
> +
> +	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(gcr_regmap)) {
> +		dev_warn(dev, "Failed to find gcr syscon, WD reset status not supported\n");

A warning is quite strong here, given that this is new code and the
syscon reference may not exist in existing devicetree files. notice
should be good enough.

> +		return;
> +	}
> +
> +	ret = of_property_read_string(dev->of_node,
> +				      "nuvoton,card-reset-type",
> +				      &card_reset_type);
> +	if (ret)
> +		wdt->card_reset = NPCM7XX_PORST;
> +	else
> +		wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
> +
> +	ret = of_property_read_string(dev->of_node,
> +				      "nuvoton,ext1-reset-type",
> +				      &ext1_reset_type);
> +	if (ret)
> +		wdt->ext1_reset = 0;

wdt is zero-allocated, so setting those variables to 0 is not necessary.

> +	else
> +		wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
> +
> +	ret = of_property_read_string(dev->of_node,
> +				      "nuvoton,ext2-reset-type",
> +				      &ext2_reset_type);
> +	if (ret)
> +		wdt->ext2_reset = 0;
> +	else
> +		wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
> +
> +	regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);

This warrants an explanation/comment: Why is it not necessary to check
the return value of the regmap operations ?

> +	/* prefer the most specific SoC first */
> +	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt")) {
> +		regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
> +			     rstval & ~NPCM8XX_RST);
> +	} else if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
> +		if ((rstval & NPCM7XX_PORST) == 0) {
> +			rstval = NPCM7XX_PORST;
> +			regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
> +				     rstval | NPCM7XX_PORST);

That "| NPCM7XX_PORST" is pretty pointless here since rstval was
just set to that value.

> +		} else {
> +			rstval = 0;
> +		}

Another comment needed: This negates NPCM7XX_PORST and otherwise clear
rstval. The reason is not immediately (or, rather, at all) obvious.

> +		regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &ressrval);
> +		rstval |= ressrval;
> +		regmap_write(gcr_regmap, NPCM7XX_RESSR_OFFSET, ressrval);
> +	}

If the device is not compatible to either chip, retval is just passed
on and nothing is written to the chip. That warrants another comment.

[ Yes, I see that the driver does not currently support another chip.

> +
> +	if (rstval & wdt->card_reset)
> +		wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> +	if (rstval & wdt->ext1_reset)
> +		wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> +	if (rstval & wdt->ext2_reset)
> +		wdt->wdd.bootstatus |= WDIOF_EXTERN2;
> +}
> +
>   static int npcm_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -208,6 +316,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> +	npcm_get_reset_status(wdt, dev);
> +
>   	wdt->wdd.info = &npcm_wdt_info;
>   	wdt->wdd.ops = &npcm_wdt_ops;
>   	wdt->wdd.min_timeout = 1;


